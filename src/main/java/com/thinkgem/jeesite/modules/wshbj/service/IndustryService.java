/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import com.thinkgem.jeesite.modules.wshbj.dao.IndustryDao;

/**
 * 行业基础数据管理Service
 * @author zhxl
 * @version 2018-03-11
 */
@Service
@Transactional(readOnly = true)
public class IndustryService extends CrudService<IndustryDao, Industry> {

	@Cacheable(value = "industryCache",key="'industry_get_'+#id")
	public Industry get(String id) {
		Industry entity = super.get(id);
		return entity;
	}

	@Cacheable(value = "industryCache",key="'industry_findList_'+#industry.code+#industry.name+#industry.owner")
	public List<Industry> findList(Industry industry) {
		return super.findList(industry);
	}

	@Cacheable(value = "industryCache",key="'industry_findPage_'+#page.pageNo+#page.pageSize+#industry.code+#industry.name+#industry.owner")
	public Page<Industry> findPage(Page<Industry> page, Industry industry) {
		return super.findPage(page, industry);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "industryCache",allEntries = true)
	public void save(Industry industry) {
		super.save(industry);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "industryCache",allEntries = true)
	public void delete(Industry industry) {
		super.delete(industry);
	}


	@Transactional(readOnly = false)
	@CacheEvict(value = "industryCache",allEntries = true)
	public RequestResult saveByPull(User createBy, String industryIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(industryIds)){
			return RequestResult.generateFailResult("行业数据错误");
		}

		//TODO 数据来源

		String[] industryIdsArray = industryIds.split(",");
		Industry industry = null,newIndustry = null;
		for (String industryId:industryIdsArray) {
			industry = get(industryId);
			if (industry==null){
				continue;
			}
			newIndustry = new Industry();
			newIndustry.setDelFlag("0");
			newIndustry.setCode(industry.getCode());
			newIndustry.setName(industry.getName());
			newIndustry.setRemarks(industry.getRemarks());
			newIndustry.setReferenceFlag("0");
			newIndustry.setOwner(createBy.getCompany().getId());

			super.save(newIndustry);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
}