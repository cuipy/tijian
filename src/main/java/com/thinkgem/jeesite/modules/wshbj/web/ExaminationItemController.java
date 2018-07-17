/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemTypeService;
import com.thinkgem.jeesite.modules.wshbj.service.GenSeqNumberService;
import com.thinkgem.jeesite.modules.wshbj.service.SpecimenService;
import org.apache.commons.collections.map.HashedMap;
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
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;

import java.util.List;
import java.util.Map;

/**
 * 检查项目Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationItem")
public class ExaminationItemController extends BaseController {

	@Autowired
	private ExaminationItemService examinationItemService;
	@Autowired
	private ExaminationItemTypeService examinationItemTypeService;
	@Autowired
	private SpecimenService specimenService;
	@Autowired
	private GenSeqNumberService genSeqNumberService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private OfficeService officeService;


	@ModelAttribute
	public ExaminationItem get(@RequestParam(required=false) String id) {
		ExaminationItem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationItemService.get(id);
		}
		if (entity == null){
			entity = new ExaminationItem();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationItem:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem); 
		model.addAttribute("page", page);
		return "modules/wshbj/examinationItemList";
	}

	@RequiresPermissions("wshbj:examinationItem:view")
	@RequestMapping(value = "form")
	public String form(ExaminationItem examinationItem, Model model) {
		model.addAttribute("examinationItem", examinationItem);

		// 加载部门列表
		List<Office> depts = officeService.getMyDepts();
		model.addAttribute("depts",depts);

		// 加载体检项目类型 属于体检小类
		ExaminationItemType examinationItemType = new ExaminationItemType();
		examinationItemType.setOwner(UserUtils.getUser().getCompany().getId());
		examinationItemType.setDelFlag("0");
		examinationItemType.setReferenceFlag("0");
		List<ExaminationItemType> examinationItemTypeList = examinationItemTypeService.findList(examinationItemType);
		model.addAttribute("examinationItemTypeList", examinationItemTypeList);

		// 加载标本列表
		Specimen specimen = new Specimen();
		specimen.setOwner(UserUtils.getUser().getCompany().getId());
		specimen.setDelFlag("0");
		specimen.setReferenceFlag("0");
		List<Specimen> specimenList = specimenService.findList(specimen);
		model.addAttribute("specimenList", specimenList);
		return "modules/wshbj/examinationItemForm";
	}

	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationItem examinationItem, Model model, RedirectAttributes redirectAttributes) {
        if(StringUtils.isEmpty(examinationItem.getCode())){
            String code=GlobalSetUtils.getGlobalSet().getCodePre() + SysSequenceUtils.nextSequence(ExaminationItem.class,"code");
            examinationItem.setCode(code);
        }

	    if (!beanValidator(model, examinationItem)){
			return form(examinationItem, model);
		}

		if(StringUtils.isEmpty(examinationItem.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(examinationItem.getName());
			examinationItem.setNamePinyin(py);
		}

		if(null==examinationItem.getOrderNumb()){
			examinationItem.setOrderNumb(100);
		}
		examinationItem.setOwner(UserUtils.getUser().getCompany().getId());

		examinationItemService.save(examinationItem);
		addMessage(redirectAttributes, "保存检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/list?repage";
	}
	
	@RequiresPermissions("wshbj:examinationItem:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationItem examinationItem, RedirectAttributes redirectAttributes) {
		examinationItemService.delete(examinationItem);
		addMessage(redirectAttributes, "删除检查项目成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/list?repage";
	}


	@RequiresPermissions("wshbj:examinationItem:assigning")
	@RequestMapping(value = {"assigning", ""})
	public String assigning(String  roleId, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("roleId", roleId);

		List<String> ids = Lists.newArrayList();
		List<ExaminationItem> itemList = examinationItemService.findAuthorisedList(roleId);
		for (ExaminationItem item:itemList
			 ) {
			ids.add(item.getId());
		}
		List<Map<String, Object>> mapList = Lists.newArrayList();

		Office company = UserUtils.getUser().getCompany();
		Map<String, Object> map = Maps.newHashMap();
		map.put("id", company.getId());
		map.put("name", company.getName());
		map.put("isParent", true);
		mapList.add(map);
		ExaminationItem examinationItem = new ExaminationItem();
		examinationItem.setOwner(company.getId());

		List<ExaminationItem> list = examinationItemService.findList(examinationItem);
		for (int i=0; i<list.size(); i++){
			ExaminationItem item = list.get(i);
			map = Maps.newHashMap();
			map.put("id", item.getId());
			map.put("pid", company.getId());
			map.put("name", StringUtils.replace(item.getName(), " ", ""));
			map.put("checked",ids.contains(item.getId()));
			mapList.add(map);
		}
		model.addAttribute("itemList", mapList);

		//角色列表
		Role role = new Role();
		role.setOffice(UserUtils.getUser().getCompany());
		List<Role> roleList = systemService.findRole(role);
		model.addAttribute("roleList", roleList);
		return "modules/wshbj/examinationItemAssigning";
	}


	@RequiresPermissions("wshbj:examinationItem:assigning")
	@RequestMapping(value = "saveAssigning")
	@ResponseBody
	public ResponseResult saveAssigning(Model model, RedirectAttributes redirectAttributes,String roleId,@RequestParam("itemIds[]")String[] itemIds) {


		return examinationItemService.saveAssigning(roleId,itemIds);
	}


	@RequiresPermissions("wshbj:examinationItem:assigning")
	@RequestMapping(value = "getAuthorisedList")
	@ResponseBody
	public List<ExaminationItem> getAuthorisedList(Model model, RedirectAttributes redirectAttributes,String roleId) {
		List<ExaminationItem> itemList = examinationItemService.findAuthorisedList(roleId);

		return itemList;
	}

	/**
	 * 项目授权列表
	 * @param examinationItem
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("wshbj:examinationItem:assigning")
	@RequestMapping(value = {"assigningList", ""})
	public String assigningList(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Map<String, Object>> mapList = Lists.newArrayList();

		//角色列表
		Role role = new Role();
		role.setOffice(UserUtils.getUser().getCompany());
		List<Role> roleList = systemService.findRole(role);
		Map<String, Object> map = new HashedMap();
		for (Role role1:roleList) {
			map = new HashedMap();
			map.put("roleId",role1.getId());
			map.put("roleName",role1.getName());

			List<ExaminationItem> itemList = examinationItemService.findAuthorisedList(role1.getId());
			map.put("itemList",itemList);

			mapList.add(map);
		}

		model.addAttribute("roleItemList", mapList);
		return "modules/wshbj/assigningList";
	}

//	@RequiresPermissions("wshbj:examinationItem:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(ExaminationItem examinationItem, HttpServletRequest request, HttpServletResponse response, Model model) {
//		examinationItem.setOwner(null);
//		examinationItem.setReferenceFlag("1");
//		Page<ExaminationItem> page = examinationItemService.findPage(new Page<ExaminationItem>(request, response), examinationItem);
//		model.addAttribute("page", page);
//		return "modules/wshbj/examinationItemListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationItem:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(ExaminationItem examinationItem, Model model) {
//		model.addAttribute("examinationItem", examinationItem);
//		return "modules/wshbj/examinationItemFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:examinationItem:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(ExaminationItem examinationItem, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, examinationItem)){
//			return form(examinationItem, model);
//		}
//		examinationItem.setOwner(null);
//		examinationItem.setReferenceFlag("1");
//		examinationItemService.saveByCenter(examinationItem);
//		addMessage(redirectAttributes, "保存检查项目成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:examinationItem:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(ExaminationItem examinationItem, RedirectAttributes redirectAttributes) {
//		examinationItemService.delete(examinationItem);
//		addMessage(redirectAttributes, "删除检查项目成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationItem/listByCenter?repage";
//	}



}