/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationResultDict;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationResultDictService;

import java.util.List;

/**
 * 体检结果字典Controller
 * @author zhxl
 * @version 2018-03-12
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationResultDict")
public class ExaminationResultDictController extends BaseController {

	@Autowired
	private ExaminationResultDictService examinationResultDictService;
	@Autowired
	private ExaminationItemService examinationItemService;
	
	@ModelAttribute
	public ExaminationResultDict get(@RequestParam(required=false) String id) {
		ExaminationResultDict entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationResultDictService.get(id);
		}
		if (entity == null){
			entity = new ExaminationResultDict();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationResultDict:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationResultDict examinationResultDict, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationResultDict> page = examinationResultDictService.findPage(new Page<ExaminationResultDict>(request, response), examinationResultDict); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationResultDictList";
	}

	@RequiresPermissions("wshbj:examinationResultDict:view")
	@RequestMapping(value = "form")
	public String form(ExaminationResultDict examinationResultDict, Model model) {
		model.addAttribute("examinationResultDict", examinationResultDict);

		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItem.setDelFlag("0");
		examinationItem.setReferenceFlag("0");
		List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
		model.addAttribute("examinationItemList", examinationItemList);

		return "modules/wshbj/examinationResultDictForm";
	}

	@RequiresPermissions("wshbj:examinationResultDict:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationResultDict examinationResultDict, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationResultDict)){
			return form(examinationResultDict, model);
		}
		examinationResultDictService.save(examinationResultDict);
		addMessage(redirectAttributes, "保存体检结果字典成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationResultDict/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationResultDict:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationResultDict examinationResultDict, RedirectAttributes redirectAttributes) {
		examinationResultDictService.delete(examinationResultDict);
		addMessage(redirectAttributes, "删除体检结果字典成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationResultDict/?repage";
	}

}