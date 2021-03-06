/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemType;
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
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.service.SpecimenService;

import java.util.List;

/**
 * 检查标本类型Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/specimen")
public class SpecimenController extends BaseController {

	@Autowired
	private SpecimenService specimenService;

	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute
	public Specimen get(@RequestParam(required=false) String id) {
		Specimen entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = specimenService.get(id);
		}
		if (entity == null){
			entity = new Specimen();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:specimen:view")
	@RequestMapping(value = {"list", ""})
	public String list(Specimen specimen, HttpServletRequest request, HttpServletResponse response, Model model) {
		specimen.setOwner(UserUtils.getUser().getCompany().getId());
		Page<Specimen> page = specimenService.findPage(new Page<Specimen>(request, response), specimen); 
		model.addAttribute("page", page);
		return "modules/wshbj/specimenList";
	}


	@RequiresPermissions("wshbj:specimen:view")
	@RequestMapping(value = "form")
	public String form(Specimen specimen, Model model) {

		// 加载部门列表
		List<Office> depts = officeService.getMyDepts();
		model.addAttribute("depts",depts);


		model.addAttribute("specimen", specimen);
		return "modules/wshbj/specimenForm";
	}

	@RequiresPermissions("wshbj:specimen:edit")
	@RequestMapping(value = "save")
	public String save(Specimen specimen, Model model, RedirectAttributes redirectAttributes) {
		specimen.setOwner(UserUtils.getUser().getCompany().getId());
		specimen.setReferenceFlag("0");

		if(StringUtils.isEmpty(specimen.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre() + SysSequenceUtils.nextSequence(Specimen.class,"code");
			specimen.setCode(code);
		}

		if (!beanValidator(model, specimen)){
			return form(specimen, model);
		}

		if(StringUtils.isEmpty(specimen.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(specimen.getName());
			specimen.setNamePinyin(py);
		}

		if(null==specimen.getOrderNumb()){
			specimen.setOrderNumb(100);
		}

		specimenService.save(specimen);
		addMessage(redirectAttributes, "保存检查标本类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/list?repage";
	}
	
	@RequiresPermissions("wshbj:specimen:edit")
	@RequestMapping(value = "delete")
	public String delete(Specimen specimen, RedirectAttributes redirectAttributes) {
		specimenService.delete(specimen);
		addMessage(redirectAttributes, "删除检查标本类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/list?repage";
	}


//	@RequiresPermissions("wshbj:specimen:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(Specimen specimen, HttpServletRequest request, HttpServletResponse response, Model model) {
//		specimen.setOwner(null);
//		specimen.setReferenceFlag("1");
//		Page<Specimen> page = specimenService.findPage(new Page<Specimen>(request, response), specimen);
//		model.addAttribute("page", page);
//		return "modules/wshbj/specimenListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:specimen:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(Specimen specimen, Model model) {
//		model.addAttribute("specimen", specimen);
//		return "modules/wshbj/specimenFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:specimen:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(Specimen specimen, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, specimen)){
//			return form(specimen, model);
//		}
//		specimen.setOwner(null);
//		specimen.setReferenceFlag("1");
//		specimenService.save(specimen);
//		addMessage(redirectAttributes, "保存检查标本类型成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:specimen:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(Specimen specimen, RedirectAttributes redirectAttributes) {
//		specimenService.delete(specimen);
//		addMessage(redirectAttributes, "删除检查标本类型成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/listByCenter?repage";
//	}
}