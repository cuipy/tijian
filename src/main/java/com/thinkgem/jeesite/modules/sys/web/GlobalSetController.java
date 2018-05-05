/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
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
import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;
import com.thinkgem.jeesite.modules.sys.service.GlobalSetService;

/**
 * 全局参数配置Controller
 * @author cuipengyu
 * @version 2018-04-18
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/globalSet")
public class GlobalSetController extends BaseController {

	@Autowired
	private GlobalSetService globalSetService;
	
	@ModelAttribute
	public GlobalSet get() {
		List<GlobalSet> lst = globalSetService.findList(new GlobalSet());
		if(lst==null||lst.size()<=0){
			return new GlobalSet();
		}else{
			return lst.get(0);
		}
	}

	@RequiresPermissions("sys:globalSet:view")
	@RequestMapping(value = "view")
	public String view(GlobalSet globalSet, Model model) {
		model.addAttribute("globalSet", globalSet);
		return "modules/sys/globalSetView";
	}

	@RequiresPermissions("sys:globalSet:view")
	@RequestMapping(value = "form")
	public String form(GlobalSet globalSet, Model model) {

		model.addAttribute("globalSet", globalSet);
		return "modules/sys/globalSetForm";
	}

	@RequiresPermissions("sys:globalSet:edit")
	@RequestMapping(value = "save")
	public String save(GlobalSet globalSet, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, globalSet)){
			return form(globalSet, model);
		}

		globalSetService.save(globalSet);
		addMessage(redirectAttributes, "保存全局参数配置成功");
		return "redirect:"+Global.getAdminPath()+"/sys/globalSet/form";
	}


}