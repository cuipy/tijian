/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemCategoryService;

/**
 * 检查小类Controller
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
		examinationItemCategory.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItemCategory.setReferenceFlag("0");
		Page<ExaminationItemCategory> page = examinationItemCategoryService.findPage(new Page<ExaminationItemCategory>(request, response), examinationItemCategory); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemCategoryList";
	}


//	@RequiresPermissions("wshbj:examinationItemCategory:edit")
//	@RequestMapping(value = {"list4Pull", ""})
//	public String list4Pull(ExaminationItemCategory examinationItemCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
//		examinationItemCategory.setOwner(null);
//		examinationItemCategory.setReferenceFlag("1");
//		Page<ExaminationItemCategory> page = examinationItemCategoryService.findPage(new Page<ExaminationItemCategory>(request, response), examinationItemCategory);
//		model.addAttribute("page", page);
//		return "modules/wshbj/examinationItemCategoryList4Pull";
//	}
//
//	@RequiresPermissions("wshbj:examinationItemCategory:edit")
//	@RequestMapping(value =  "saveByPull",method = RequestMethod.POST)
//	@ResponseBody
//	public RequestResult saveByPull(HttpServletRequest request, String examinationItemCategoryIds) {
//		return examinationItemCategoryService.saveByPull(UserUtils.getUser(),examinationItemCategoryIds);
//	}

	@RequiresPermissions("wshbj:examinationItemCategory:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItemCategory examinationItemCategory, Model model) {
		model.addAttribute("examinationItemCategory", examinationItemCategory);
		return "modules/wshbj/examinationItemCategoryForm";
	}

	@RequiresPermissions("wshbj:examinationItemCategory:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItemCategory examinationItemCategory, Model model, RedirectAttributes redirectAttributes) {
		examinationItemCategory.setReferenceFlag("0");
		examinationItemCategory.setOwner(UserUtils.getUser().getCompany().getId());

		if(StringUtils.isEmpty(examinationItemCategory.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre()+SysSequenceUtils.nextSequence(ExaminationItemCategory.class,"code");
			examinationItemCategory.setCode(code);
		}

		if (!beanValidator(model, examinationItemCategory)){
			return form(examinationItemCategory, model);
		}

		if(StringUtils.isEmpty(examinationItemCategory.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(examinationItemCategory.getName());
			examinationItemCategory.setNamePinyin(py);
		}
		if(null==examinationItemCategory.getOrderNumb()){
			examinationItemCategory.setOrderNumb(100);
		}

		examinationItemCategoryService.save(examinationItemCategory);
		addMessage(redirectAttributes, "保存检查小类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/list?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItemCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItemCategory examinationItemCategory, RedirectAttributes redirectAttributes) {
		examinationItemCategoryService.delete(examinationItemCategory);
		addMessage(redirectAttributes, "删除检查小类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/list?repage";
	}


//	@RequiresPermissions("wshbj:examinationItemCategory:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(ExaminationItemCategory examinationItemCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
//		examinationItemCategory.setReferenceFlag("1");
//		Page<ExaminationItemCategory> page = examinationItemCategoryService.findPage(new Page<ExaminationItemCategory>(request, response), examinationItemCategory);
//		model.addAttribute("page", page);
//		return "modules/wshbj/examinationItemCategoryListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationItemCategory:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(ExaminationItemCategory examinationItemCategory, Model model) {
//		model.addAttribute("examinationItemCategory", examinationItemCategory);
//		return "modules/wshbj/examinationItemCategoryFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationItemCategory:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(ExaminationItemCategory examinationItemCategory, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, examinationItemCategory)){
//			return form(examinationItemCategory, model);
//		}
//		examinationItemCategory.setReferenceFlag("1");
//		examinationItemCategoryService.save(examinationItemCategory);
//		addMessage(redirectAttributes, "保存检查小类成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:examinationItemCategory:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(ExaminationItemCategory examinationItemCategory, RedirectAttributes redirectAttributes) {
//		examinationItemCategoryService.delete(examinationItemCategory);
//		addMessage(redirectAttributes, "删除检查小类成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItemCategory/listByCenter?repage";
//	}
}