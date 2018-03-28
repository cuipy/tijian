/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationSamples;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationSamplesService;

/**
 * 体检样本Controller
 * @author zhxl
 * @version 2018-03-25
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationSamples")
public class ExaminationSamplesController extends BaseController {

	@Autowired
	private ExaminationSamplesService examinationSamplesService;
	@Autowired
	private ExaminationItemService examinationItemService;
	
	@ModelAttribute
	public ExaminationSamples get(@RequestParam(required=false) String id) {
		ExaminationSamples entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationSamplesService.get(id);
		}
		if (entity == null){
			entity = new ExaminationSamples();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationSamples:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationSamples examinationSamples, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationSamples> page = examinationSamplesService.findPage(new Page<ExaminationSamples>(request, response), examinationSamples); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationSamplesList";
	}

	@RequiresPermissions("wshbj:examinationSamples:view")
	@RequestMapping(value = "view")
	public String view(ExaminationSamples examinationSamples, Model model) {
		model.addAttribute("examinationSamples", examinationSamples);
		return "modules/wshbj/examinationSamplesPage";
	}

	@RequiresPermissions("wshbj:examinationSamples:view")
	@RequestMapping(value = "form")
	public String form(ExaminationSamples examinationSamples, Model model) {
		model.addAttribute("examinationSamples", examinationSamples);

		Office company = UserUtils.getUser().getCompany();
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());
		examinationItem.setNeedSamples("1");

		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("itemList", examinationItemList);

		return "modules/wshbj/examinationSamplesForm";
	}

	@RequiresPermissions("wshbj:examinationSamples:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationSamples examinationSamples, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationSamples)){
			return form(examinationSamples, model);
		}
		examinationSamplesService.save(examinationSamples);
		addMessage(redirectAttributes, "保存体检样本成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationSamples/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationSamples:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationSamples examinationSamples, RedirectAttributes redirectAttributes) {
		examinationSamplesService.delete(examinationSamples);
		addMessage(redirectAttributes, "删除体检样本成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationSamples/?repage";
	}





}