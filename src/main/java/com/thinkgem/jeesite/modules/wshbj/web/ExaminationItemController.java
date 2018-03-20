/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemTypeService;
import com.thinkgem.jeesite.modules.wshbj.service.GenSeqNumberService;
import com.thinkgem.jeesite.modules.wshbj.service.SpecimenService;
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
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;

import java.util.List;

/**
 * 检查项目Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationItem")
public class ExaminationItemController extends BaseController {

	@Autowired
	private ExaminationItemService examinationItemService;
	@Autowired
	private ExaminationItemTypeService examinationItemTypeService;
	@Autowired
	private SpecimenService specimenService;
	@Autowired
	private GenSeqNumberService genSeqNumberService;
	
	@ModelAttribute
	public ExaminationItem get(@RequestParam(required=false) String id) {
		ExaminationItem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationItemService.get(id);
		}
		if (entity == null){
			entity = new ExaminationItem();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationItem:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemList";
	}

	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = {"list4Pull", ""})
	public String list4Pull(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItem.setOwner(null);
		examinationItem.setReferenceFlag("1");
		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemList4Pull";
	}

	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value =  "saveByPull",method = RequestMethod.POST)
	@ResponseBody
	public RequestResult saveByPull(HttpServletRequest request, String examinationItemIds) {
		return examinationItemService.saveByPull(UserUtils.getUser(),examinationItemIds);
	}

	@RequiresPermissions("wshbj:examinationItem:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItem examinationItem, Model model) {
		model.addAttribute("examinationItem", examinationItem);

		ExaminationItemType examinationItemType = new ExaminationItemType();
		examinationItemType.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItemType.setDelFlag("0");
		examinationItemType.setReferenceFlag("0");
		List<ExaminationItemType> examinationItemTypeList = examinationItemTypeService.findList(examinationItemType);
		model.addAttribute("examinationItemTypeList", examinationItemTypeList);

		Specimen specimen = new Specimen();
		specimen.setOwner(UserUtils.getUser().getCompany().getId());
		specimen.setDelFlag("0");
		specimen.setReferenceFlag("0");
		List<Specimen> specimenList = specimenService.findList(specimen);
		model.addAttribute("specimenList", specimenList);
		return "modules/wshbj/examinationItemForm";
	}

	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItem examinationItem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItem)){
			return form(examinationItem, model);
		}
		//项目编号
		examinationItem.setPermission(genSeqNumberService.genSeqNumber1(UserUtils.getUser().getCompany().getCode()+"ITEM_",1));
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItem.setReferenceFlag("0");
		examinationItemService.save(examinationItem);
		addMessage(redirectAttributes, "保存检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/list?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItem examinationItem, RedirectAttributes redirectAttributes) {
		examinationItemService.delete(examinationItem);
		addMessage(redirectAttributes, "删除检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/list?repage";
	}

	@RequiresPermissions("wshbj:examinationItem:viewByCenter")
	@RequestMapping(value = {"listByCenter", ""})
	public String listByCenter(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItem.setOwner(null);
		examinationItem.setReferenceFlag("1");
		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem);
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemListByCenter";
	}

	@RequiresPermissions("wshbj:examinationItem:viewByCenter")
	@RequestMapping(value = "formByCenter")
	public String formByCenter(ExaminationItem examinationItem, Model model) {
		model.addAttribute("examinationItem", examinationItem);
		return "modules/wshbj/examinationItemFormByCenter";
	}

	@RequiresPermissions("wshbj:examinationItem:editByCenter")
	@RequestMapping(value = "saveByCenter")
	public String saveByCenter(ExaminationItem examinationItem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItem)){
			return form(examinationItem, model);
		}
		examinationItem.setOwner(null);
		examinationItem.setReferenceFlag("1");
		examinationItemService.save(examinationItem);
		addMessage(redirectAttributes, "保存检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/listByCenter?repage";
	}

	@RequiresPermissions("wshbj:examinationItem:editByCenter")
	@RequestMapping(value = "deleteByCenter")
	public String deleteByCenter(ExaminationItem examinationItem, RedirectAttributes redirectAttributes) {
		examinationItemService.delete(examinationItem);
		addMessage(redirectAttributes, "删除检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/listByCenter?repage";
	}

}