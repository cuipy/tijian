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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordService;

/**
 * 体检记录Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationRecord")
public class ExaminationRecordController extends BaseController {

	@Autowired
	private ExaminationRecordService examinationRecordService;
	
	@ModelAttribute
	public ExaminationRecord get(@RequestParam(required=false) String id) {
		ExaminationRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationRecordService.get(id);
		}
		if (entity == null){
			entity = new ExaminationRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationRecord examinationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationRecord> page = examinationRecordService.findPage(new Page<ExaminationRecord>(request, response), examinationRecord); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationRecordList";
	}

	@RequiresPermissions("wshbj:examinationRecord:view")
	@RequestMapping(value = "form")
	public String form(ExaminationRecord examinationRecord, Model model) {
		model.addAttribute("examinationRecord", examinationRecord);
		return "modules/wshbj/examinationRecordForm";
	}

	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationRecord examinationRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationRecord)){
			return form(examinationRecord, model);
		}
		examinationRecordService.save(examinationRecord);
		addMessage(redirectAttributes, "保存体检记录成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationRecord examinationRecord, RedirectAttributes redirectAttributes) {
		examinationRecordService.delete(examinationRecord);
		addMessage(redirectAttributes, "删除体检记录成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationRecord/?repage";
	}

}