/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.dao.JobPostDao;

/**
 * 工作岗位Service
 * @author zhxl
 * @version 2018-03-11
 */
@Service
@Transactional(readOnly = true)
public class JobPostService extends CrudService<JobPostDao, JobPost> {

	public JobPost get(String id) {
		return super.get(id);
	}
	
	public List<JobPost> findList(JobPost jobPost) {
		return super.findList(jobPost);
	}
	
	public Page<JobPost> findPage(Page<JobPost> page, JobPost jobPost) {
		return super.findPage(page, jobPost);
	}
	
	@Transactional(readOnly = false)
	public void save(JobPost jobPost) {
		super.save(jobPost);
	}
	
	@Transactional(readOnly = false)
	public void delete(JobPost jobPost) {
		super.delete(jobPost);
	}

	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String jobPostIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(jobPostIds)){
			return RequestResult.generateFailResult("岗位数据错误");
		}

		//TODO 数据来源

		String[] jobPostIdsArray = jobPostIds.split(",");
		JobPost jobPost = null,newJobPost = null;
		for (String jobPostId:jobPostIdsArray) {
			jobPost = get(jobPostId);
			if (jobPost==null){
				continue;
			}
			newJobPost = new JobPost();
			newJobPost.setDelFlag("0");
			newJobPost.setCode(jobPost.getCode());
			newJobPost.setName(jobPost.getName());
			newJobPost.setRemarks(jobPost.getRemarks());
			newJobPost.setReferenceFlag("0");
			newJobPost.setOwner(createBy.getCompany().getId());

			super.save(newJobPost);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}

}