/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.SequenceDefine;
import com.thinkgem.jeesite.modules.sys.service.SequenceDefineService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 序列编号定义Controller
 * @author cuipengyu
 * @version 2018-03-22
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sequenceDefine")
public class SequenceDefineController extends BaseController {

	@Autowired
	private SequenceDefineService sequenceDefineService;
	
	@ModelAttribute
	public SequenceDefine get(@RequestParam(required=false) String id,@RequestParam(required=false) String className,@RequestParam(required=false) String methodName) {
		if (StringUtils.isNotEmpty(id)){
			return sequenceDefineService.get(id);
		}else if(StringUtils.isNotEmpty(className)&&StringUtils.isNotEmpty(methodName)){
			SequenceDefine sd=new SequenceDefine();
			sd.setClassName(className);
			sd.setMethodName(methodName);
			return sequenceDefineService.getByClassMethod(sd);
		}else{
			return new SequenceDefine();
		}
	}
	
	@RequiresPermissions("sys:sequenceDefine:view")
	@RequestMapping(value = {"list", ""})
	public String list( HttpServletRequest request, HttpServletResponse response, Model model) {
		List<SequenceDefine> lstSequenceDefine = sequenceDefineService.findList(null);
		model.addAttribute("list", lstSequenceDefine);
		return "modules/sys/sequenceDefineList";
	}

	@RequiresPermissions("sys:sequenceDefine:view")
	@RequestMapping(value = "form")
	public String form(SequenceDefine sequenceDefine, Model model) {
		model.addAttribute("sequenceDefine", sequenceDefine);
		return "modules/sys/sequenceDefineForm";
	}

	@RequiresPermissions("sys:sequenceDefine:edit")
	@RequestMapping(value = "save")//@Valid 
	public String save(SequenceDefine sequenceDefine, Model model, RedirectAttributes redirectAttributes) {

		if (!beanValidator(model, sequenceDefine)){
			return form(sequenceDefine, model);
		}

		sequenceDefineService.save(sequenceDefine);
		addMessage(redirectAttributes, "保存序列编号定义'" + sequenceDefine.getAnnDescribe() + "'成功");
		return "redirect:" + adminPath + "/sys/sequenceDefine/";
	}
	
	@RequiresPermissions("sys:sequenceDefine:edit")
	@RequestMapping(value = "delete")
	public String delete(SequenceDefine sequenceDefine, RedirectAttributes redirectAttributes) {

		sequenceDefineService.delete(sequenceDefine);
		addMessage(redirectAttributes, "删除序列编号定义成功");
		return "redirect:" + adminPath + "/sys/sequenceDefine";
	}


}
