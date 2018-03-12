/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;
import com.thinkgem.jeesite.modules.wshbj.service.JobPostService;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;
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
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationUserService;

import java.util.List;

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

}