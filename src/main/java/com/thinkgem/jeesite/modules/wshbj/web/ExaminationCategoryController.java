/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.service.SysSequenceService;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationCategoryService;

/**
 * 检查大类Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationCategory")
public class ExaminationCategoryController extends BaseController {

	@Autowired
	private ExaminationCategoryService examinationCategoryService;
	
	@ModelAttribute
	public ExaminationCategory get(@RequestParam(required=false) String id) {
		ExaminationCategory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationCategoryService.get(id);
		}
		if (entity == null){
			entity = new ExaminationCategory();
		}
		return entity;
	}

	
	@RequiresPermissions("wshbj:examinationCategory:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationCategory examinationCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationCategory.setOwner(UserUtils.getUser().getCompany().getId());
		Page<ExaminationCategory> page = examinationCategoryService.findPage(new Page<ExaminationCategory>(request, response), examinationCategory); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationCategoryList";
	}

	@RequiresPermissions("wshbj:examinationCategory:view")
	@RequestMapping(value = "form")
	public String form(ExaminationCategory examinationCategory, Model model) {
		if(examinationCategory==null){
			examinationCategory=new ExaminationCategory();
		}

		model.addAttribute("examinationCategory", examinationCategory);
		return "modules/wshbj/examinationCategoryForm";
	}

	@RequiresPermissions("wshbj:examinationCategory:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationCategory examinationCategory, Model model, RedirectAttributes redirectAttributes) {

		examinationCategory.setReferenceFlag("0");
		examinationCategory.setOwner(UserUtils.getUser().getCompany().getId());
		if(StringUtils.isEmpty(examinationCategory.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre()+SysSequenceUtils.nextSequence(ExaminationCategory.class,"code");
			examinationCategory.setCode(code);
		}
		if (!beanValidator(model, examinationCategory)){
			return form(examinationCategory, model);
		}

		if(StringUtils.isEmpty(examinationCategory.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(examinationCategory.getName());
			examinationCategory.setNamePinyin(py);
		}
		if(null==examinationCategory.getOrderNumb()){
			examinationCategory.setOrderNumb(100);
		}
		examinationCategoryService.save(examinationCategory);
		addMessage(redirectAttributes, "保存检查大类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationCategory/list?repage";
	}
	
	@RequiresPermissions("wshbj:examinationCategory:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationCategory examinationCategory, RedirectAttributes redirectAttributes) {
		examinationCategoryService.delete(examinationCategory);
		addMessage(redirectAttributes, "删除检查大类成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationCategory/list?repage";
	}



//	@RequiresPermissions("wshbj:examinationCategory:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(ExaminationCategory examinationCategory, HttpServletRequest request, HttpServletResponse response, Model model) {
//		examinationCategory.setOwner(null);
//		examinationCategory.setReferenceFlag("1");
//		Page<ExaminationCategory> page = examinationCategoryService.findPage(new Page<ExaminationCategory>(request, response), examinationCategory);
//		model.addAttribute("page", page);
//		return "modules/wshbj/examinationCategoryListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationCategory:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(ExaminationCategory examinationCategory, Model model) {
//		model.addAttribute("examinationCategory", examinationCategory);
//		return "modules/wshbj/examinationCategoryFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationCategory:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(ExaminationCategory examinationCategory, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, examinationCategory)){
//			return form(examinationCategory, model);
//		}
//		examinationCategoryService.save(examinationCategory);
//		addMessage(redirectAttributes, "保存检查大类成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationCategory/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:examinationCategory:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(ExaminationCategory examinationCategory, RedirectAttributes redirectAttributes) {
//		examinationCategoryService.delete(examinationCategory);
//		addMessage(redirectAttributes, "删除检查大类成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationCategory/listByCenter?repage";
//	}
}