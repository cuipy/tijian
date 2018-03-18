package com.thinkgem.jeesite.common.jasperreports;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.Servlets;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.view.save.JRHtmlSaveContributor;
import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsSingleFormatView;

public class CuiJasperReportsHtmlView extends CuiAbstractJasperReportsSingleFormatView {

    public CuiJasperReportsHtmlView() {
        this.setContentType("text/html");
    }

    protected JRExporter createExporter() {
        JRExporter exporter=new HtmlExporter();

        String imgRealPath=Global.getProjectRealPath()+"/jrf/";
        String imgURI= Servlets.getRequest().getContextPath()+"/jrf/";

        exporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR_NAME,imgRealPath);
        exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, imgURI);

        exporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR, Boolean.TRUE);

        return exporter;
    }

    protected boolean useWriter() {
        return true;
    }

}
