package com.thinkgem.jeesite.common.web;

import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class MyJasperReportsView extends JasperReportsMultiFormatView{

    @Override
    protected void renderReport(JasperPrint populatedReport, Map<String, Object> model, HttpServletResponse response) throws Exception {
        if(model.get("url")==null){
            logger.warn("MyJasperReportsView 未能获得参数url");
            return;
        }

        String _url=model.get("url").toString();
        this.setUrl(_url);
        super.renderReport(populatedReport, model, response);
    }
}
