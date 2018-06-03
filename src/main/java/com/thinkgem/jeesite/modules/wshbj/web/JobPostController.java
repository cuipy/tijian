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
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@ResponseBody
	@GetMapping(value = "ajax_for_autocompleter")
	public List<Map<String,String>> ajax_for_autocompleter(String query, Integer limit){
		JobPost organ=new JobPost();
		organ.setLikeField(StringUtils.forSuperLikeQuery(query));

		Page<JobPost> page=new Page();
		page.setPageNo(1);
		page.setPageSize(limit);
		Page<JobPost> p = jobPostService.findPage(page,organ);
		List<Map<String,String>> lst2=new ArrayList();

		for(JobPost o:p.getList()){
			lst2.add(o.getMap());
		}

		return lst2;
	}

}