/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;
import com.thinkgem.jeesite.modules.wshbj.service.JobPostService;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;
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
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationUserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 体检用户Controller
 * @author zhxl
 * @version 2018-03-07
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/examinationUser")
public class ExaminationUserController extends BaseController {

	@Autowired
	private ExaminationUserService examinationUserService;
	@Autowired
	private OrganService organService;
	@Autowired
	private IndustryService industryService;
	@Autowired
	private JobPostService jobPostService;
	
	@ModelAttribute
	public ExaminationUser get(@RequestParam(required=false) String id) {
		ExaminationUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = examinationUserService.get(id);
		}
		if (entity == null){
			entity = new ExaminationUser();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:examinationUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(ExaminationUser examinationUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		examinationUser.setOwner(UserUtils.getUser().getCompany().getId());
		Page<ExaminationUser> page = examinationUserService.findPage(new Page<ExaminationUser>(request, response), examinationUser); 
		model.addAttribute("page", page);

		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		return "modules/wshbj/examinationUserList";
	}

	@RequiresPermissions("wshbj:examinationUser:view")
	@RequestMapping(value = "form")
	public String form(ExaminationUser examinationUser, Model model) {
		model.addAttribute("examinationUser", examinationUser);

		Organ organ = new Organ();
		organ.setOwner(UserUtils.getUser().getCompany().getId());
		organ.setDelFlag("0");
		organ.setReferenceFlag("0");
		List<Organ> organList = organService.findList(organ);
		model.addAttribute("organList", organList);

		Industry industry = new Industry();
		industry.setOwner(UserUtils.getUser().getCompany().getId());
		industry.setDelFlag("0");
		industry.setReferenceFlag("0");
		List<Industry> industryList = industryService.findList(industry);
		model.addAttribute("industryList", industryList);

		JobPost jobPost = new JobPost();
		jobPost.setOwner(UserUtils.getUser().getCompany().getId());
		jobPost.setDelFlag("0");
		jobPost.setReferenceFlag("0");
		List<JobPost> postList = jobPostService.findList(jobPost);
		model.addAttribute("postList", postList);

		return "modules/wshbj/examinationUserForm";
	}

	@RequiresPermissions("wshbj:examinationUser:edit")
	@RequestMapping(value = "save")
	public String save(ExaminationUser examinationUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, examinationUser)){
			return form(examinationUser, model);
		}
		examinationUser.setOwner(UserUtils.getUser().getCompany().getId());
		examinationUserService.save(examinationUser);
		addMessage(redirectAttributes, "保存体检用户成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationUser/?repage";
	}
	
	@RequiresPermissions("wshbj:examinationUser:edit")
	@RequestMapping(value = "delete")
	public String delete(ExaminationUser examinationUser, RedirectAttributes redirectAttributes) {
		examinationUserService.delete(examinationUser);
		addMessage(redirectAttributes, "删除体检用户成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/examinationUser/?repage";
	}


	/**
	 * 树结构选择标签（euserTreeSelect.tag）
	 */
	@RequiresPermissions("wshbj:examinationUser:view")
	@RequestMapping(value = "treeSelect")
	public String treeSelect(HttpServletRequest request, Model model) {
		model.addAttribute("url", request.getParameter("url")); 	// 树结构数据URL
		model.addAttribute("extId", request.getParameter("extId")); // 排除的编号ID
		model.addAttribute("checked", request.getParameter("checked")); // 是否可复选
		model.addAttribute("selectIds", request.getParameter("selectIds")); // 指定默认选中的ID
		model.addAttribute("isAll", request.getParameter("isAll")); 	// 是否读取全部数据，不进行权限过滤
		model.addAttribute("module", request.getParameter("module"));	// 过滤栏目模型（仅针对CMS的Category树）
		return "modules/wshbj/examinationUserTreeSelect";
	}


	@RequiresPermissions("wshbj:examinationUser:view")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=true) String organId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		ExaminationUser examinationUser = new ExaminationUser();
		examinationUser.setOwner(UserUtils.getUser().getCompany().getId());
		examinationUser.setOrganId(organId);

		List<ExaminationUser> list = examinationUserService.findList(examinationUser);
		for (int i=0; i<list.size(); i++){
			ExaminationUser e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", organId);
			map.put("name", StringUtils.replace(e.getName(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}


	@ResponseBody
	@RequestMapping(value = "getById")
	public ExaminationUser getById(@RequestParam(required=true) String id, HttpServletResponse response) {
	    if (org.apache.commons.lang3.StringUtils.isBlank(id)){
	        return null;
        }
		ExaminationUser examinationUser = examinationUserService.get(id);
		return examinationUser;
	}


	@ResponseBody
	@RequestMapping(value = "getByIdNumber")
	public ExaminationUser getByIdNumber(@RequestParam(required=true) String idNumber, HttpServletResponse response) {
		if (org.apache.commons.lang3.StringUtils.isBlank(idNumber)){
			return null;
		}
		ExaminationUser examinationUser = examinationUserService.getByIdNumberAndOwner(idNumber,UserUtils.getUser().getCompany().getId());
		return examinationUser;
	}

	@ResponseBody
	@GetMapping(value = "ajax_for_autocompleter")
	public List<Map<String,String>> ajax_for_autocompleter(String query){
		ExaminationUser queryUser=new ExaminationUser();
		queryUser.setCode(query);
		queryUser.setIdNumber(query);
		queryUser.setPhoneNumber(query);
		queryUser.setName(query);

		List<ExaminationUser> lst = examinationUserService.findList(queryUser);
		List<Map<String,String>> lst2=new ArrayList();

		for(ExaminationUser u:lst){
			lst2.add(u.getMap());
		}

		return lst2;
	}

}