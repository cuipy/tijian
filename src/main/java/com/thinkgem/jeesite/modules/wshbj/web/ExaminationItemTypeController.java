/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationDept;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationDeptService;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemType;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemTypeService;

import java.util.List;

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
	@Autowired
	private ExaminationItemCategoryService examinationItemCategoryService;
	@Autowired
	private ExaminationDeptService examinationDeptService;
	
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
		examinationItemType.setOwner(UserUtils.getUser().getCompany().getId());
		Page<ExaminationItemType> page = examinationItemTypeService.findPage(new Page<ExaminationItemType>(request, response), examinationItemType); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemTypeList";
	}

	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value = {"list4Pull", ""})
	public String list4Pull(ExaminationItemType examinationItemType, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItemType.setOwner(null);
		examinationItemType.setReferenceFlag("1");
		Page<ExaminationItemType> page = examinationItemTypeService.findPage(new Page<ExaminationItemType>(request, response), examinationItemType);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemTypeList4Pull";
	}

	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value =  "saveByPull",method = RequestMethod.POST)
	@ResponseBody
	public RequestResult saveByPull(HttpServletRequest request, String itemTypeIds) {
		return examinationItemTypeService.saveByPull(UserUtils.getUser(),itemTypeIds);
	}

	@RequiresPermissions("wshbj:examinationItemType:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItemType examinationItemType, Model model) {
		model.addAttribute("examinationItemType", examinationItemType);
		ExaminationItemCategory category = new ExaminationItemCategory();
		category.setOwner(UserUtils.getUser().getCompany().getId());
		category.setDelFlag("0");
		category.setReferenceFlag("0");
		List<ExaminationItemCategory> itemCategoryList = examinationItemCategoryService.findList(category);
		model.addAttribute("itemCategoryList", itemCategoryList);

		ExaminationDept examinationDept = new ExaminationDept();
		examinationDept.setOwner(UserUtils.getUser().getCompany().getId());
		examinationDept.setDelFlag("0");
		examinationDept.setReferenceFlag("0");
		List<ExaminationDept> deptList = examinationDeptService.findList(examinationDept);
		model.addAttribute("deptList", deptList);
		return "modules/wshbj/examinationItemTypeForm";
	}

	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItemType examinationItemType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItemType)){
			return form(examinationItemType, model);
		}
		examinationItemType.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItemType.setReferenceFlag("0");
		examinationItemTypeService.save(examinationItemType);
		addMessage(redirectAttributes, "保存检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/list?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItemType:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItemType examinationItemType, RedirectAttributes redirectAttributes) {
		examinationItemTypeService.delete(examinationItemType);
		addMessage(redirectAttributes, "删除检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/list?repage";
	}


	@RequiresPermissions("wshbj:examinationItemType:viewByCenter")
	@RequestMapping(value = {"listByCenter", ""})
	public String listByCenter(ExaminationItemType examinationItemType, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItemType.setOwner(null);
		examinationItemType.setReferenceFlag("1");
		Page<ExaminationItemType> page = examinationItemTypeService.findPage(new Page<ExaminationItemType>(request, response), examinationItemType);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemTypeListByCenter";
	}

	@RequiresPermissions("wshbj:examinationItemType:viewByCenter")
	@RequestMapping(value = "formByCenter")
	public String formByCenter(ExaminationItemType examinationItemType, Model model) {
		model.addAttribute("examinationItemType", examinationItemType);
		return "modules/wshbj/examinationItemTypeFormByCenter";
	}

	@RequiresPermissions("wshbj:examinationItemType:editByCenter")
	@RequestMapping(value = "saveByCenter")
	public String saveByCenter(ExaminationItemType examinationItemType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItemType)){
			return form(examinationItemType, model);
		}
		examinationItemType.setOwner(null);
		examinationItemType.setReferenceFlag("1");
		examinationItemTypeService.save(examinationItemType);
		addMessage(redirectAttributes, "保存检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/listByCenter?repage";
	}

	@RequiresPermissions("wshbj:examinationItemType:editByCenter")
	@RequestMapping(value = "deleteByCenter")
	public String deleteByCenter(ExaminationItemType examinationItemType, RedirectAttributes redirectAttributes) {
		examinationItemTypeService.delete(examinationItemType);
		addMessage(redirectAttributes, "删除检查项目类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemType/listByCenter?repage";
	}

}