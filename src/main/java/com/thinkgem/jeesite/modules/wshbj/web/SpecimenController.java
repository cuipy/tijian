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
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.service.SpecimenService;

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
		Page<Specimen> page = specimenService.findPage(new Page<Specimen>(request, response), specimen); 
		model.addAttribute("page", page);
		return "modules/wshbj/specimenList";
	}

	@RequiresPermissions("wshbj:specimen:view")
	@RequestMapping(value = "form")
	public String form(Specimen specimen, Model model) {
		model.addAttribute("specimen", specimen);
		return "modules/wshbj/specimenForm";
	}

	@RequiresPermissions("wshbj:specimen:edit")
	@RequestMapping(value = "save")
	public String save(Specimen specimen, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, specimen)){
			return form(specimen, model);
		}
		specimenService.save(specimen);
		addMessage(redirectAttributes, "保存检查标本类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/?repage";
	}
	
	@RequiresPermissions("wshbj:specimen:edit")
	@RequestMapping(value = "delete")
	public String delete(Specimen specimen, RedirectAttributes redirectAttributes) {
		specimenService.delete(specimen);
		addMessage(redirectAttributes, "删除检查标本类型成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/specimen/?repage";
	}

}