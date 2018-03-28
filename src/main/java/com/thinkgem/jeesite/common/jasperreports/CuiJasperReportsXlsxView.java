/*
 * Copyright 2002-2015 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.thinkgem.jeesite.common.jasperreports;

import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsSingleFormatView;

/**
 * Implementation of {@code AbstractJasperReportsSingleFormatView}
 * that renders report results in XLSX format.
 *
 * <p><b>This class is compatible with classic JasperReports releases back until 2.x.</b>
 * As a consequence, it keeps using the {@link net.sf.jasperreports.engine.JRExporter}
 * API which got deprecated as of JasperReports 5.5.2 (early 2014).
 *
 * @author Rob Harrop
 * @author Juergen Hoeller
 * @since 4.2
 */
@SuppressWarnings({"deprecation", "rawtypes"})
public class CuiJasperReportsXlsxView extends CuiAbstractJasperReportsSingleFormatView {

	public CuiJasperReportsXlsxView() {
		setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	}

	@Override
	protected net.sf.jasperreports.engine.JRExporter createExporter() {
		return new JRXlsxExporter();
	}

	@Override
	protected boolean useWriter() {
		return false;
	}

}
