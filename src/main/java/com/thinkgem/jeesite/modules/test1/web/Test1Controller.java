/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.test1.entity.Test1;
import com.thinkgem.jeesite.modules.test1.service.Test1Service;

/**
 * 测试一下从test1表生成类Controller
 * @author 崔鹏宇
 * @version 2018-03-03
 */
@Controller
@RequestMapping(value = "${adminPath}/test1/test1")
public class Test1Controller extends BaseController {

	@Autowired
	private Test1Service test1Service;
	
	@ModelAttribute
	public Test1 get(@RequestParam(required=false) String id) {
		Test1 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = test1Service.get(id);
		}
		if (entity == null){
			entity = new Test1();
		}
		return entity;
	}
	
	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = {"list", ""})
	public String list(Test1 test1, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Test1> page = test1Service.findPage(new Page<Test1>(request, response), test1); 
		model.addAttribute("page", page);
		return "modules/test1/test1List";
	}

	@RequiresPermissions("test1:test1:view")
	@RequestMapping(value = "form")
	public String form(Test1 test1, Model model) {
		model.addAttribute("test1", test1);
		return "modules/test1/test1Form";
	}

	@RequiresPermissions("test1:test1:edit")
	@RequestMapping(value = "save")
	public String save(Test1 test1, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, test1)){
			return form(test1, model);
		}
		test1Service.save(test1);
		addMessage(redirectAttributes, "保存测试1成功");
		return "redirect:"+Global.getAdminPath()+"/test1/test1/?repage";
	}
	
	@RequiresPermissions("test1:test1:edit")
	@RequestMapping(value = "delete")
	public String delete(Test1 test1, RedirectAttributes redirectAttributes) {
		test1Service.delete(test1);
		addMessage(redirectAttributes, "删除测试1成功");
		return "redirect:"+Global.getAdminPath()+"/test1/test1/?repage";
	}

}