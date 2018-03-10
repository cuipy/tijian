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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationUserService;

/**
 * 体检用户Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationUser")
public class ExaminationUserController extends BaseController {

	@Autowired
	private ExaminationUserService examinationUserService;
	
	@ModelAttribute
	public ExaminationUser get(@RequestParam(required=false) String id) {
		ExaminationUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationUserService.get(id);
		}
		if (entity == null){
			entity = new ExaminationUser();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationUser examinationUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationUser> page = examinationUserService.findPage(new Page<ExaminationUser>(request, response), examinationUser); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationUserList";
	}

	@RequiresPermissions("wshbj:examinationUser:view")
	@RequestMapping(value = "form")
	public String form(ExaminationUser examinationUser, Model model) {
		model.addAttribute("examinationUser", examinationUser);
		return "modules/wshbj/examinationUserForm";
	}

	@RequiresPermissions("wshbj:examinationUser:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationUser examinationUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationUser)){
			return form(examinationUser, model);
		}
		examinationUserService.save(examinationUser);
		addMessage(redirectAttributes, "保存体检用户成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationUser/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationUser:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationUser examinationUser, RedirectAttributes redirectAttributes) {
		examinationUserService.delete(examinationUser);
		addMessage(redirectAttributes, "删除体检用户成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationUser/?repage";
	}

}