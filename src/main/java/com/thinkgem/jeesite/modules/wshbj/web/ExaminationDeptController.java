/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationDept;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationDeptService;

/**
 * 检查部门Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationDept")
public class ExaminationDeptController extends BaseController {

	@Autowired
	private ExaminationDeptService examinationDeptService;
	
	@ModelAttribute
	public ExaminationDept get(@RequestParam(required=false) String id) {
		ExaminationDept entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationDeptService.get(id);
		}
		if (entity == null){
			entity = new ExaminationDept();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationDept:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationDept examinationDept, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationDept> page = examinationDeptService.findPage(new Page<ExaminationDept>(request, response), examinationDept); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationDeptList";
	}

	@RequiresPermissions("wshbj:examinationDept:view")
	@RequestMapping(value = "form")
	public String form(ExaminationDept examinationDept, Model model) {
		model.addAttribute("examinationDept", examinationDept);
		return "modules/wshbj/examinationDeptForm";
	}

	@RequiresPermissions("wshbj:examinationDept:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationDept examinationDept, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationDept)){
			return form(examinationDept, model);
		}
		examinationDeptService.save(examinationDept);
		addMessage(redirectAttributes, "保存检查部门成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationDept/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationDept:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationDept examinationDept, RedirectAttributes redirectAttributes) {
		examinationDeptService.delete(examinationDept);
		addMessage(redirectAttributes, "删除检查部门成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationDept/?repage";
	}

}