/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.wshbj.service.CertRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 首页Controller
 * @author cuipengyu
 * @version 2018-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/report")
public class ReportController extends BaseController {

	@Autowired
	private CertRecordService certRecordService;

	@RequestMapping(value = {"test2"})
	public String test2(Model m) {

		m.addAttribute("format","pdf");

		return "test2";
	}


}