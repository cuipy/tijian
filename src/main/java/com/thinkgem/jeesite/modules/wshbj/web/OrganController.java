/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;

/**
 * 体检单位Controller
 * @author zhxl
 * @version 2018-03-12
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/organ")
public class OrganController extends BaseController {

	@Autowired
	private OrganService organService;
	
	@ModelAttribute
	public Organ get(@RequestParam(required=false) String id) {
		Organ entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = organService.get(id);
		}
		if (entity == null){
			entity = new Organ();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:organ:view")
	@RequestMapping(value = {"list", ""})
	public String list(Organ organ, HttpServletRequest request, HttpServletResponse response, Model model) {
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		Page<Organ> page = organService.findPage(new Page<Organ>(request, response), organ); 
		model.addAttribute("page", page);
		return "modules/wshbj/organList";
	}

	@RequiresPermissions("wshbj:organ:view")
	@RequestMapping(value = "form")
	public String form(Organ organ, Model model) {
		model.addAttribute("organ", organ);
		return "modules/wshbj/organForm";
	}

	@RequiresPermissions("wshbj:organ:edit")
	@RequestMapping(value = "save")
	public String save(Organ organ, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, organ)){
			return form(organ, model);
		}
		organ.setReferenceFlag("0");
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organService.save(organ);
		addMessage(redirectAttributes, "保存体检单位成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/organ/?repage";
	}
	
	@RequiresPermissions("wshbj:organ:edit")
	@RequestMapping(value = "delete")
	public String delete(Organ organ, RedirectAttributes redirectAttributes) {
		organService.delete(organ);
		addMessage(redirectAttributes, "删除体检单位成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/organ/?repage";
	}

}