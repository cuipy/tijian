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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;

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
		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemList";
	}

	@RequiresPermissions("wshbj:examinationItem:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItem examinationItem, Model model) {
		model.addAttribute("examinationItem", examinationItem);
		return "modules/wshbj/examinationItemForm";
	}

	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItem examinationItem, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationItem)){
			return form(examinationItem, model);
		}
		examinationItemService.save(examinationItem);
		addMessage(redirectAttributes, "保存检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItem examinationItem, RedirectAttributes redirectAttributes) {
		examinationItemService.delete(examinationItem);
		addMessage(redirectAttributes, "删除检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/?repage";
	}

}