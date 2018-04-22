/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import com.thinkgem.jeesite.modules.wshbj.entity.JobPost;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 工作岗位DAO接口
 * @author zhxl
 * @version 2018-03-11
 */
@MyBatisDao
public interface JobPostDao extends CrudDao<JobPost> {

    @Override
    @Cacheable(value = "jobPostCache",key="'jobPost_get_'+#id")
    JobPost get(String id);

    @Override
    @Cacheable(value = "jobPostCache",key="'jobPost_ge_'+#id+#name+#owner")
    JobPost get(JobPost entity);


    @Override
    @CacheEvict(value="jobPostCache",allEntries=true)
    int insert(JobPost entity);

    @Override
    @CacheEvict(value="jobPostCache",allEntries=true)
    int update(JobPost entity);

    @Override
    @CacheEvict(value="jobPostCache",allEntries=true)
    int delete(JobPost entity);
    
}