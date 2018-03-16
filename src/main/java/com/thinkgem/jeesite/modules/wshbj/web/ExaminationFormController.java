/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationForm;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationFormService;

/**
 * 体检流程表模板Controller
 * @author zhxl
 * @version 2018-03-14
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationForm")
public class ExaminationFormController extends BaseController {

	@Autowired
	private ExaminationFormService examinationFormService;
	
	@ModelAttribute
	public ExaminationForm get(@RequestParam(required=false) String id) {
		ExaminationForm entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationFormService.get(id);
		}
		if (entity == null){
			entity = new ExaminationForm();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationForm:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationForm examinationForm, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationForm> page = examinationFormService.findPage(new Page<ExaminationForm>(request, response), examinationForm); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationFormList";
	}

	@RequiresPermissions("wshbj:examinationForm:view")
	@RequestMapping(value = "view")
	public String view(ExaminationForm examinationForm, Model model) {
		model.addAttribute("examinationForm", examinationForm);
		return "modules/wshbj/examinationFormPage";
	}

	@RequiresPermissions("wshbj:examinationForm:view")
	@RequestMapping(value = "form")
	public String form(ExaminationForm examinationForm, Model model) {
		model.addAttribute("examinationForm", examinationForm);
		return "modules/wshbj/examinationFormForm";
	}

	@RequiresPermissions("wshbj:examinationForm:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationForm examinationForm, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationForm)){
			return form(examinationForm, model);
		}
		examinationFormService.save(examinationForm);
		addMessage(redirectAttributes, "保存体检流程表模板成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationForm/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationForm:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationForm examinationForm, RedirectAttributes redirectAttributes) {
		examinationFormService.delete(examinationForm);
		addMessage(redirectAttributes, "删除体检流程表模板成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationForm/?repage";
	}





}