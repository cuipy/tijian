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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemCategoryService;

/**
 * 检查项目分类Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationItemCategory")
public class ExaminationItemCategoryController extends BaseController {

	@Autowired
	private ExaminationItemCategoryService examinationItemCategoryService;
	
	@ModelAttribute
	public ExaminationItemCategory get(@RequestParam(required=false) String id) {
		ExaminationItemCategory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationItemCategoryService.get(id);
		}
		if (entity == null){
			entity = new ExaminationItemCategory();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationItemCategory:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationItemCategory examinationItemCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationItemCategory> page = examinationItemCategoryService.findPage(new Page<ExaminationItemCategory>(request, response), examinationItemCategory); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemCategoryList";
	}

	@RequiresPermissions("wshbj:examinationItemCategory:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItemCategory examinationItemCategory, Model model) {
		model.addAttribute("examinationItemCategory", examinationItemCategory);
		return "modules/wshbj/examinationItemCategoryForm";
	}

	@RequiresPermissions("wshbj:examinationItemCategory:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItemCategory examinationItemCategory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItemCategory)){
			return form(examinationItemCategory, model);
		}
		examinationItemCategoryService.save(examinationItemCategory);
		addMessage(redirectAttributes, "保存检查项目分类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItemCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItemCategory examinationItemCategory, RedirectAttributes redirectAttributes) {
		examinationItemCategoryService.delete(examinationItemCategory);
		addMessage(redirectAttributes, "删除检查项目分类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/?repage";
	}

}