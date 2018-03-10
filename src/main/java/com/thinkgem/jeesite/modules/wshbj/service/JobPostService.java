/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.dao.JobPostDao;

/**
 * 工作岗位Service
 * @author zhxl
 * @version 2018-03-06
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
	
}