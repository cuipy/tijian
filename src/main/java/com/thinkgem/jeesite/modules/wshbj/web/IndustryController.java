/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
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
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;

/**
 * 行业基础数据管理Controller
 * @author zhxl
 * @version 2018-03-11
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
		industry.setOwner(UserUtils.getUser().getCompany().getId());
		Page<Industry> page = industryService.findPage(new Page<Industry>(request, response), industry); 
		model.addAttribute("page", page);
		return "modules/wshbj/industryList";
	}


//	@RequiresPermissions("wshbj:industry:edit")
//	@RequestMapping(value = {"list4Pull", ""})
//	public String list4Pull(Industry industry, HttpServletRequest request, HttpServletResponse response, Model model) {
//		industry.setOwner(null);
//		industry.setReferenceFlag("1");
//		Page<Industry> page = industryService.findPage(new Page<Industry>(request, response), industry);
//		model.addAttribute("page", page);
//		return "modules/wshbj/industryList4Pull";
//	}
//
//	@RequiresPermissions("wshbj:industry:edit")
//	@RequestMapping(value =  "saveByPull",method = RequestMethod.POST)
//	@ResponseBody
//	public RequestResult saveByPull(HttpServletRequest request, String industryIds) {
//		return industryService.saveByPull(UserUtils.getUser(),industryIds);
//	}

	@RequiresPermissions("wshbj:industry:view")
	@RequestMapping(value = "form")
	public String form(Industry industry, Model model) {
		model.addAttribute("industry", industry);
		return "modules/wshbj/industryForm";
	}

	@RequiresPermissions("wshbj:industry:edit")
	@RequestMapping(value = "save")
	public String save(Industry industry, Model model, RedirectAttributes redirectAttributes) {

		industry.setOwner(UserUtils.getUser().getCompany().getId());
		industry.setReferenceFlag("0");

		if(StringUtils.isEmpty(industry.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre() + SysSequenceUtils.nextSequence(Industry.class,"code");
			industry.setCode(code);
		}

		if (!beanValidator(model, industry)){
			return form(industry, model);
		}

		industryService.save(industry);
		addMessage(redirectAttributes, "保存行业管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/list?repage";
	}
	
	@RequiresPermissions("wshbj:industry:edit")
	@RequestMapping(value = "delete")
	public String delete(Industry industry, RedirectAttributes redirectAttributes) {
		industryService.delete(industry);
		addMessage(redirectAttributes, "删除行业管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/list?repage";
	}


//	@RequiresPermissions("wshbj:industry:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(Industry industry, HttpServletRequest request, HttpServletResponse response, Model model) {
//		industry.setOwner(null);
//		industry.setReferenceFlag("1");
//		Page<Industry> page = industryService.findPage(new Page<Industry>(request, response), industry);
//		model.addAttribute("page", page);
//		return "modules/wshbj/industryListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:industry:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(Industry industry, Model model) {
//		model.addAttribute("industry", industry);
//		return "modules/wshbj/industryFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:industry:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(Industry industry, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, industry)){
//			return form(industry, model);
//		}
//		industry.setOwner(null);
//		industry.setReferenceFlag("1");
//		industryService.save(industry);
//		addMessage(redirectAttributes, "保存行业管理成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:industry:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(Industry industry, RedirectAttributes redirectAttributes) {
//		industryService.delete(industry);
//		addMessage(redirectAttributes, "删除行业管理成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/industry/listByCenter?repage";
//	}
}