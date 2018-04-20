/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodes;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.service.SampleCodesService;
import com.thinkgem.jeesite.modules.wshbj.service.SpecimenService;
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
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodesPack;
import com.thinkgem.jeesite.modules.wshbj.service.SampleCodesPackService;

/**
 * 样本编号包Controller
 * @author cuipengyu
 * @version 2018-04-20
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/sampleCodesPack")
public class SampleCodesPackController extends BaseController {

	@Autowired
	private SampleCodesPackService sampleCodesPackService;

	@Autowired
	private SpecimenService specimenService;

	@Autowired
	private SampleCodesService sampleCodesService;


	@ModelAttribute
	public SampleCodesPack get(@RequestParam(required=false) String id) {
		SampleCodesPack entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sampleCodesPackService.get(id);
		}
		if (entity == null){
			entity = new SampleCodesPack();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = {"list", ""})
	public String list(SampleCodesPack sampleCodesPack, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SampleCodesPack> page = sampleCodesPackService.findPage(new Page<SampleCodesPack>(request, response), sampleCodesPack); 
		model.addAttribute("page", page);
		return "modules/wshbj/sampleCodesPackList";
	}

	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = "view")
	public String view(SampleCodesPack sampleCodesPack, Model model) {
		model.addAttribute("sampleCodesPack", sampleCodesPack);
		return "modules/wshbj/sampleCodesPackPage";
	}

	@RequiresPermissions("wshbj:sampleCodes:view")
	@RequestMapping(value = "form")
	public String form(SampleCodesPack sampleCodesPack, Model model) {

		// 加载标本列表
		Specimen specimen = new Specimen();
		specimen.setOwner(UserUtils.getUser().getCompany().getId());
		specimen.setDelFlag("0");
		specimen.setReferenceFlag("0");
		List<Specimen> specimenList = specimenService.findList(specimen);
		model.addAttribute("specimenList", specimenList);


		model.addAttribute("sampleCodesPack", sampleCodesPack);
		return "modules/wshbj/sampleCodesPackForm";
	}

	@RequiresPermissions("wshbj:sampleCodes:edit")
	@RequestMapping(value = "save")
	public String save(SampleCodesPack sampleCodesPack, Model model, RedirectAttributes redirectAttributes) {

		// 设置创建人
		sampleCodesPack.setAuthId(UserUtils.getUser().getId());
		sampleCodesPack.setAuthName(UserUtils.getUser().getName());
		sampleCodesPack.setOwner(UserUtils.getUser().getCompany().getId());

		if (!beanValidator(model, sampleCodesPack)){
			return form(sampleCodesPack, model);
		}
		RequestResult rr = sampleCodesPackService.save2(sampleCodesPack);

		if(rr.getState()!=1){
			addMessage(redirectAttributes,rr.getMsg());
			return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodesPack/?repage";
		}
		RequestResult rr2 = sampleCodesService.createCodes(sampleCodesPack);

		if(rr2.getState()!=1){
			addMessage(redirectAttributes,rr.getMsg());
			return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodesPack/?repage";
		}

		addMessage(redirectAttributes, "保存样本编号包成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodesPack/?repage";
	}
	
	@RequiresPermissions("wshbj:sampleCodes:edit")
	@RequestMapping(value = "delete")
	public String delete(SampleCodesPack sampleCodesPack, RedirectAttributes redirectAttributes) {
		sampleCodesPackService.delete(sampleCodesPack);
		addMessage(redirectAttributes, "删除样本编号包成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/sampleCodesPack/?repage";
	}





}