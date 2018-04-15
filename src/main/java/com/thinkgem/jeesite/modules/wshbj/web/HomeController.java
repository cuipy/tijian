/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.wshbj.entity.CertRecord;
import com.thinkgem.jeesite.modules.wshbj.service.CertRecordService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 首页Controller
 * @author cuipengyu
 * @version 2018-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/home")
public class HomeController extends BaseController {

	@Autowired
	private CertRecordService certRecordService;

	@RequestMapping(value = {"index", ""})
	public String index(Model m) {
		String v=String.valueOf(new java.util.Date().getTime());
		m.addAttribute("v",v);
		return "modules/wshbj/home_index";
	}


}