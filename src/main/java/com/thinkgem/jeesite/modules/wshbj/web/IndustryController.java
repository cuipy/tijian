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
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;

/**
 * 行业基础数据管理Controller
 * @author zhxl
 * @version 2018-03-06
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/industry")
public class IndustryController extends BaseController {

	@Autowired
	private IndustryService industryService;
	
	@ModelAttribute
	public Industry get(@RequestParam(required=false) String id) {
		Industry entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = industryService.get(id);
		}
		if (entity == null){
			entity = new Industry();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:industry:view")
	@RequestMapping(value = {"list", ""})
	public String list(Industry industry, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Industry> page = industryService.findPage(new Page<Industry>(request, response), industry); 
		model.addAttribute("page", page);
		return "modules/wshbj/industryList";
	}

	@RequiresPermissions("wshbj:industry:view")
	@RequestMapping(value = "form")
	public String form(Industry industry, Model model) {
		model.addAttribute("industry", industry);
		return "modules/wshbj/industryForm";
	}

	@RequiresPermissions("wshbj:industry:edit")
	@RequestMapping(value = "save")
	public String save(Industry industry, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, industry)){
			return form(industry, model);
		}
		industryService.save(industry);
		addMessage(redirectAttributes, "保存行业管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/?repage";
	}
	
	@RequiresPermissions("wshbj:industry:edit")
	@RequestMapping(value = "delete")
	public String delete(Industry industry, RedirectAttributes redirectAttributes) {
		industryService.delete(industry);
		addMessage(redirectAttributes, "删除行业管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/?repage";
	}

}