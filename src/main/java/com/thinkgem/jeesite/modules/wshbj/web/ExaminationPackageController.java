/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.entity.PackageItem;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationCategoryService;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
import com.thinkgem.jeesite.modules.wshbj.service.PackageItemService;
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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationPackage;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationPackageService;

import java.util.List;

/**
 * 体检套餐Controller
 * @author zhxl
 * @version 2018-03-12
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationPackage")
public class ExaminationPackageController extends BaseController {

	@Autowired
	private ExaminationPackageService examinationPackageService;
    @Autowired
    private ExaminationItemService examinationItemService;
	@Autowired
	private ExaminationCategoryService examinationCategoryService;
	@Autowired
	private PackageItemService packageItemService;



	@ModelAttribute
	public ExaminationPackage get(@RequestParam(required=false) String id) {
		ExaminationPackage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationPackageService.get(id);
		}
		if (entity == null){
			entity = new ExaminationPackage();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationPackage:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationPackage examinationPackage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ExaminationPackage> page = examinationPackageService.findPage(new Page<ExaminationPackage>(request, response), examinationPackage); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationPackageList";
	}

	@RequiresPermissions("wshbj:examinationPackage:view")
	@RequestMapping(value = "form")
	public String form(ExaminationPackage examinationPackage, Model model) {
		model.addAttribute("examinationPackage", examinationPackage);

		// 获取体检项目列表
        ExaminationItem examinationItem = new ExaminationItem();
        examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
        examinationItem.setDelFlag("0");
        examinationItem.setReferenceFlag("0");
        List<ExaminationItem> examinationItemList = examinationItemService.findList(examinationItem);
        model.addAttribute("examinationItemList", examinationItemList);

		// 获取体检分类列表
		ExaminationCategory examinationCategory = new ExaminationCategory();
		examinationCategory.setOwner(UserUtils.getUser().getCompany().getId());
		examinationCategory.setDelFlag("0");
		examinationCategory.setReferenceFlag("0");
		List<ExaminationCategory> examinationCategoryList = examinationCategoryService.findList(examinationCategory);
		model.addAttribute("examinationCategoryList", examinationCategoryList);

		// 获取所选体检项目列表
		if(!StringUtils.isEmpty(examinationPackage.getId())) {
			PackageItem pi = new PackageItem();
			pi.setPackageId(examinationPackage.getId());
			List<PackageItem> pis = packageItemService.findList(pi);
			model.addAttribute("packageItems",pis);
		}

		return "modules/wshbj/examinationPackageForm";
	}

	@RequiresPermissions("wshbj:examinationPackage:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationPackage examinationPackage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationPackage)){
			return form(examinationPackage, model);
		}
		if(StringUtils.isEmpty(examinationPackage.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(examinationPackage.getName());
			examinationPackage.setNamePinyin(py);
		}

		if(null==examinationPackage.getOrderNumb()){
			examinationPackage.setOrderNumb(100);
		}


		examinationPackageService.save(examinationPackage);
		addMessage(redirectAttributes, "保存体检套餐成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationPackage/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationPackage:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationPackage examinationPackage, RedirectAttributes redirectAttributes) {
		examinationPackageService.delete(examinationPackage);
		addMessage(redirectAttributes, "删除体检套餐成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationPackage/?repage";
	}

}