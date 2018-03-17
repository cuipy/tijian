package com.thinkgem.jeesite.common.utils;

import com.thinkgem.jeesite.common.config.Global;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class JasperReportsUtils {

    /**
     * 渲染显示成html
     * @param resp
     * @param jasperFile
     */
    public static void renderHtml(HttpServletResponse resp,Connection conn,String jasperFile,Map<String,Object> params){

        if(resp==null||conn==null||StringUtils.isEmpty(jasperFile)){
            return;
        }

        try {

            File f=new File(jasperFile);
            if(!f.exists()){
                HttpResponseUtils.error(resp,404,"没有找到JasperFile:"+jasperFile);
                return;
            }

            JasperReport jr= (JasperReport) JRLoader.loadObject(f);
            JasperPrint jp= JasperFillManager.fillReport(jr,params,conn);
            Exporter exp=new HtmlExporter();

            SimpleHtmlExporterOutput expOutput=new SimpleHtmlExporterOutput(resp.getWriter());
            exp.setExporterOutput(expOutput);
            exp.setExporterInput(new SimpleExporterInput(jp));
            exp.exportReport();

            resp.getWriter().flush();
            resp.getWriter().close();

        } catch (JRException e) {
            try {
                e.printStackTrace(resp.getWriter());
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        } catch (IOException e) {
            try {
                e.printStackTrace(resp.getWriter());
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        } catch (Exception e) {
            try {
                e.printStackTrace(resp.getWriter());
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }

    }


}
