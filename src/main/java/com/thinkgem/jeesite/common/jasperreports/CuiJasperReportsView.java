package com.thinkgem.jeesite.common.jasperreports;

import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.BeanUtils;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class CuiJasperReportsView extends CuiJasperReportsMultiFormatView {

    public static final String DEFAULT_FORMAT_KEY = "format";
    private String formatKey = "format";
    private Map<String, Class<? extends CuiAbstractJasperReportsView>> formatMappings = new HashMap(4);
    private Properties contentDispositionMappings;

    public CuiJasperReportsView() {
        this.formatMappings.put("docx", CuiJasperReportsDocxView.class);
        this.formatMappings.put("html", CuiJasperReportsHtmlView.class);
        this.formatMappings.put("pdf", CuiJasperReportsPdfView.class);
        this.formatMappings.put("xls", CuiJasperReportsXlsView.class);
        this.formatMappings.put("xlsx", CuiJasperReportsXlsxView.class);
    }

    public void setFormatKey(String formatKey) {
        this.formatKey = formatKey;
    }

    public void setFormatMappings(Map<String, Class<? extends CuiAbstractJasperReportsView>> formatMappings) {
        if (CollectionUtils.isEmpty(formatMappings)) {
            throw new IllegalArgumentException("'formatMappings' must not be empty");
        } else {
            this.formatMappings = formatMappings;
        }
    }

    public void setContentDispositionMappings(Properties mappings) {
        this.contentDispositionMappings = mappings;
    }

    public Properties getContentDispositionMappings() {
        if (this.contentDispositionMappings == null) {
            this.contentDispositionMappings = new Properties();
        }

        return this.contentDispositionMappings;
    }

    protected boolean generatesDownloadContent() {
        return true;
    }

    protected void renderReport(JasperPrint populatedReport, Map<String, Object> model, HttpServletResponse response) throws Exception {
        String format = (String)model.get(this.formatKey);
        if (format == null) {
            throw new IllegalArgumentException("No format found in model");
        } else {
            if (this.logger.isDebugEnabled()) {
                this.logger.debug("Rendering report using format mapping key [" + format + "]");
            }

            Class<? extends CuiAbstractJasperReportsView> viewClass = (Class)this.formatMappings.get(format);
            if (viewClass == null) {
                throw new IllegalArgumentException("Format discriminator [" + format + "] is not a configured mapping");
            } else {
                if (this.logger.isDebugEnabled()) {
                    this.logger.debug("Rendering report using view class [" + viewClass.getName() + "]");
                }

                CuiAbstractJasperReportsView view = (CuiAbstractJasperReportsView) BeanUtils.instantiateClass(viewClass);
                view.setExporterParameters(this.getExporterParameters());
                view.setConvertedExporterParameters(this.getConvertedExporterParameters());
                this.populateContentDispositionIfNecessary(response, format);
                view.renderReport(populatedReport, model, response);
            }
        }
    }

    private void populateContentDispositionIfNecessary(HttpServletResponse response, String format) {
        if (this.contentDispositionMappings != null) {
            String header = this.contentDispositionMappings.getProperty(format);
            if (header != null) {
                if (this.logger.isDebugEnabled()) {
                    this.logger.debug("Setting Content-Disposition header to: [" + header + "]");
                }

                response.setHeader("Content-Disposition", header);
            }
        }

    }
}
