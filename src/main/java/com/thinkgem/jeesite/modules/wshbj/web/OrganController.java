/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
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
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 体检单位Controller
 * @author zhxl
 * @version 2018-03-12
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/organ")
public class OrganController extends BaseController {

	@Autowired
	private OrganService organService;
	
	@ModelAttribute
	public Organ get(@RequestParam(required=false) String id) {
		Organ entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = organService.get(id);
		}
		if (entity == null){
			entity = new Organ();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:organ:view")
	@RequestMapping(value = {"list", ""})
	public String list(Organ organ, HttpServletRequest request, HttpServletResponse response, Model model) {
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		Page<Organ> page = organService.findPage(new Page<Organ>(request, response), organ); 
		model.addAttribute("page", page);
		return "modules/wshbj/organList";
	}

	@RequiresPermissions("wshbj:organ:view")
	@RequestMapping(value = "form")
	public String form(Organ organ, Model model) {
		model.addAttribute("organ", organ);
		return "modules/wshbj/organForm";
	}

	@RequiresPermissions("wshbj:organ:edit")
	@RequestMapping(value = "save")
	public String save(Organ organ, Model model, RedirectAttributes redirectAttributes) {

		if(StringUtils.isEmpty(organ.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre() + SysSequenceUtils.nextSequence(Organ.class,"code");
			organ.setCode(code);
		}

		if (!beanValidator(model, organ)){
			return form(organ, model);
		}
		organ.setReferenceFlag("0");
		organ.setOwner(UserUtils.getUser().getCompany().getId());

		if(StringUtils.isEmpty(organ.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(organ.getName());
			organ.setNamePinyin(py);
		}

		if(null==organ.getOrderNumb()){
			organ.setOrderNumb(100);
		}


		organService.save(organ);
		addMessage(redirectAttributes, "保存体检单位成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/organ/?repage";
	}
	
	@RequiresPermissions("wshbj:organ:edit")
	@RequestMapping(value = "delete")
	public String delete(Organ organ, RedirectAttributes redirectAttributes) {
		organService.delete(organ);
		addMessage(redirectAttributes, "删除体检单位成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/organ/?repage";
	}


	@RequiresPermissions("wshbj:organ:view")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData() {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Office company = UserUtils.getUser().getCompany();
		Map<String, Object> map = Maps.newHashMap();
		map.put("id", company.getId());
		map.put("name", company.getName());
		map.put("isParent", true);
		mapList.add(map);

		Organ organ = new Organ();
		organ.setOwner(company.getId());
		organ.setDelFlag("0");
		List<Organ> list = organService.findList(organ);
		for(Organ o:list){
			map = Maps.newHashMap();
			map.put("id", o.getId());
			map.put("pId", company.getId());
			map.put("pIds",company.getId());
			map.put("name", o.getName());
			map.put("isParent", true);
			mapList.add(map);
		}

		return mapList;
	}

	@ResponseBody
	@GetMapping(value = "ajax_for_autocompleter")
	public List<Map<String,String>> ajax_for_autocompleter(String query,Integer limit){
		Organ organ=new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setLikeField(StringUtils.forSuperLikeQuery(query));

		Page<Organ> page=new Page();
		page.setPageNo(1);
		page.setPageSize(limit);
		Page<Organ> p = organService.findPage(page,organ);
		List<Map<String,String>> lst2=new ArrayList();

		for(Organ o:p.getList()){
			lst2.add(o.getMap());
		}

		return lst2;
	}
}