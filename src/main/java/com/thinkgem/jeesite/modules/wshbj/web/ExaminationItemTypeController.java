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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemType;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemTypeService;

/**
 * 检查项目类型Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationItemType")
public class ExaminationItemTypeController extends BaseController {

	@Autowired
	private ExaminationItemTypeService examinationItemTypeService;
	
	@ModelAttribute
	public ExaminationItemType get(@RequestParam(required=false) String id) {
		ExaminationItemType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationItemTypeService.get(id);
		}
		if (entity == null){
			entity = new ExaminationItemType();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationItemType:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationItemType examinationItemType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationItemType> page = examinationItemTypeService.findPage(new Page<ExaminationItemType>(request, response), examinationItemType); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemTypeList";
	}

	@RequiresPermissions("wshbj:examinationItemType:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItemType examinationItemType, Model model) {
		model.addAttribute("examinationItemType", examinationItemType);
		return "modules/wshbj/examinationItemTypeForm";
	}

	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItemType examinationItemType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItemType)){
			return form(examinationItemType, model);
		}
		examinationItemTypeService.save(examinationItemType);
		addMessage(redirectAttributes, "保存检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItemType examinationItemType, RedirectAttributes redirectAttributes) {
		examinationItemTypeService.delete(examinationItemType);
		addMessage(redirectAttributes, "删除检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/?repage";
	}

}