/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;
import com.thinkgem.jeesite.common.utils.DateUtils;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import javax.validation.ConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodes;
import com.thinkgem.jeesite.modules.wshbj.service.SampleCodesService;

/**
 * 样本编号库Controller
 * @author cuipengyu
 * @version 2018-04-20
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/sampleCodes")
public class SampleCodesController extends BaseController {

	@Autowired
	private SampleCodesService sampleCodesService;
	
	@ModelAttribute
	public SampleCodes get(@RequestParam(required=false) String id) {
		SampleCodes entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sampleCodesService.get(id);
		}
		if (entity == null){
			entity = new SampleCodes();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = {"list", ""})
	public String list(SampleCodes sampleCodes, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SampleCodes> page = sampleCodesService.findPage(new Page<SampleCodes>(request, response), sampleCodes); 
		model.addAttribute("page", page);
		return "modules/wshbj/sampleCodesList";
	}

	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = "view")
	public String view(SampleCodes sampleCodes, Model model) {
		model.addAttribute("sampleCodes", sampleCodes);
		return "modules/wshbj/sampleCodesPage";
	}

	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = "form")
	public String form(SampleCodes sampleCodes, Model model) {
		model.addAttribute("sampleCodes", sampleCodes);
		return "modules/wshbj/sampleCodesForm";
	}

	@RequiresPermissions("wshbj:sampleCodes:edit")
	@RequestMapping(value = "save")
	public String save(SampleCodes sampleCodes, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sampleCodes)){
			return form(sampleCodes, model);
		}
		sampleCodesService.save(sampleCodes);
		addMessage(redirectAttributes, "保存样本编号库成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodes/?repage";
	}
	
	@RequiresPermissions("wshbj:sampleCodes:edit")
	@RequestMapping(value = "delete")
	public String delete(SampleCodes sampleCodes, RedirectAttributes redirectAttributes) {
		sampleCodesService.delete(sampleCodes);
		addMessage(redirectAttributes, "删除样本编号库成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodes/?repage";
	}





}