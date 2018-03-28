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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationResult;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationResultService;

/**
 * 体检结果Controller
 * @author zhxl
 * @version 2018-03-25
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationResult")
public class ExaminationResultController extends BaseController {

	@Autowired
	private ExaminationResultService examinationResultService;
	
	@ModelAttribute
	public ExaminationResult get(@RequestParam(required=false) String id) {
		ExaminationResult entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationResultService.get(id);
		}
		if (entity == null){
			entity = new ExaminationResult();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationResult:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationResult examinationResult, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationResult> page = examinationResultService.findPage(new Page<ExaminationResult>(request, response), examinationResult); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationResultList";
	}

	@RequiresPermissions("wshbj:examinationResult:view")
	@RequestMapping(value = "view")
	public String view(ExaminationResult examinationResult, Model model) {
		model.addAttribute("examinationResult", examinationResult);
		return "modules/wshbj/examinationResultPage";
	}

	@RequiresPermissions("wshbj:examinationResult:view")
	@RequestMapping(value = "form")
	public String form(ExaminationResult examinationResult, Model model) {
		model.addAttribute("examinationResult", examinationResult);
		return "modules/wshbj/examinationResultForm";
	}

	@RequiresPermissions("wshbj:examinationResult:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationResult examinationResult, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationResult)){
			return form(examinationResult, model);
		}
		examinationResultService.save(examinationResult);
		addMessage(redirectAttributes, "保存体检结果成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationResult/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationResult:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationResult examinationResult, RedirectAttributes redirectAttributes) {
		examinationResultService.delete(examinationResult);
		addMessage(redirectAttributes, "删除体检结果成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationResult/?repage";
	}





}