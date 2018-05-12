/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.utils.PinyinUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
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
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.service.JobPostService;

/**
 * 工作岗位Controller
 * @author zhxl
 * @version 2018-03-11
 */
@Controller
@RequestMapping(value = "${adminPath}/wshbj/jobPost")
public class JobPostController extends BaseController {

	@Autowired
	private JobPostService jobPostService;
	
	@ModelAttribute
	public JobPost get(@RequestParam(required=false) String id) {
		JobPost entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jobPostService.get(id);
		}
		if (entity == null){
			entity = new JobPost();
		}
		return entity;
	}
	
	@RequiresPermissions("wshbj:jobPost:view")
	@RequestMapping(value = {"list", ""})
	public String list(JobPost jobPost, HttpServletRequest request, HttpServletResponse response, Model model) {
		jobPost.setOwner(UserUtils.getUser().getCompany().getId());
		Page<JobPost> page = jobPostService.findPage(new Page<JobPost>(request, response), jobPost); 
		model.addAttribute("page", page);
		return "modules/wshbj/jobPostList";
	}

//	@RequiresPermissions("wshbj:jobPost:edit")
//	@RequestMapping(value = {"list4Pull", ""})
//	public String list4Pull(JobPost jobPost, HttpServletRequest request, HttpServletResponse response, Model model) {
//		jobPost.setOwner(null);
//		jobPost.setReferenceFlag("1");
//		Page<JobPost> page = jobPostService.findPage(new Page<JobPost>(request, response), jobPost);
//		model.addAttribute("page", page);
//		return "modules/wshbj/jobPostList4Pull";
//	}
//
//	@RequiresPermissions("wshbj:jobPost:edit")
//	@RequestMapping(value =  "saveByPull",method = RequestMethod.POST)
//	@ResponseBody
//	public RequestResult saveByPull(HttpServletRequest request, String jobPostIds) {
//		return jobPostService.saveByPull(UserUtils.getUser(),jobPostIds);
//	}


	@RequiresPermissions("wshbj:jobPost:view")
	@RequestMapping(value = "form")
	public String form(JobPost jobPost, Model model) {
		model.addAttribute("jobPost", jobPost);
		return "modules/wshbj/jobPostForm";
	}

	@RequiresPermissions("wshbj:jobPost:edit")
	@RequestMapping(value = "save")
	public String save(JobPost jobPost, Model model, RedirectAttributes redirectAttributes) {

		if(StringUtils.isEmpty(jobPost.getCode())){
			String code=GlobalSetUtils.getGlobalSet().getCodePre() + SysSequenceUtils.nextSequence(JobPost.class,"code");
			jobPost.setCode(code);
		}

		if (!beanValidator(model, jobPost)){
			return form(jobPost, model);
		}
		jobPost.setOwner(UserUtils.getUser().getCompany().getId());
		jobPost.setReferenceFlag("0");

		if(StringUtils.isEmpty(jobPost.getNamePinyin())){
			String py=PinyinUtils.getStringPinYin(jobPost.getName());
			jobPost.setNamePinyin(py);
		}

		if(null==jobPost.getOrderNumb()){
			jobPost.setOrderNumb(100);
		}

		jobPostService.save(jobPost);
		addMessage(redirectAttributes, "保存工作岗位管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/jobPost/list?repage";
	}
	
	@RequiresPermissions("wshbj:jobPost:edit")
	@RequestMapping(value = "delete")
	public String delete(JobPost jobPost, RedirectAttributes redirectAttributes) {
		jobPostService.delete(jobPost);
		addMessage(redirectAttributes, "删除工作岗位管理成功");
		return "redirect:"+Global.getAdminPath()+"/wshbj/jobPost/list?repage";
	}

//	@RequiresPermissions("wshbj:jobPost:viewByCenter")
//	@RequestMapping(value = {"listByCenter", ""})
//	public String listByCenter(JobPost jobPost, HttpServletRequest request, HttpServletResponse response, Model model) {
//		jobPost.setOwner(null);
//		jobPost.setReferenceFlag("1");
//		Page<JobPost> page = jobPostService.findPage(new Page<JobPost>(request, response), jobPost);
//		model.addAttribute("page", page);
//		return "modules/wshbj/jobPostListByCenter";
//	}
//
//	@RequiresPermissions("wshbj:jobPost:viewByCenter")
//	@RequestMapping(value = "formByCenter")
//	public String formByCenter(JobPost jobPost, Model model) {
//		model.addAttribute("jobPost", jobPost);
//		return "modules/wshbj/jobPostFormByCenter";
//	}
//
//	@RequiresPermissions("wshbj:jobPost:editByCenter")
//	@RequestMapping(value = "saveByCenter")
//	public String saveByCenter(JobPost jobPost, Model model, RedirectAttributes redirectAttributes) {
//		if (!beanValidator(model, jobPost)){
//			return form(jobPost, model);
//		}
//		jobPost.setOwner(null);
//		jobPost.setReferenceFlag("1");
//		jobPostService.save(jobPost);
//		addMessage(redirectAttributes, "保存工作岗位管理成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/jobPost/listByCenter?repage";
//	}
//
//	@RequiresPermissions("wshbj:jobPost:editByCenter")
//	@RequestMapping(value = "deleteByCenter")
//	public String deleteByCenter(JobPost jobPost, RedirectAttributes redirectAttributes) {
//		jobPostService.delete(jobPost);
//		addMessage(redirectAttributes, "删除工作岗位管理成功");
//		return "redirect:"+Global.getAdminPath()+"/wshbj/jobPost/listByCenter?repage";
//	}
}