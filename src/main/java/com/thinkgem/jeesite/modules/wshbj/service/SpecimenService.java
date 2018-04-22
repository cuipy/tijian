/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemType;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.dao.SpecimenDao;

/**
 * 检查标本类型Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class SpecimenService extends CrudService<SpecimenDao, Specimen> {

	public Specimen get(String id) {
		return super.get(id);
	}

	@Cacheable(value = "specimenCache",key="'specimen_findList_'+#specimen.code+#specimen.name+#specimen.owner")
	public List<Specimen> findList(Specimen specimen) {
		return super.findList(specimen);
	}

	@Cacheable(value = "specimenCache",key="'specimen_findPage_'+#page.pageNo+#page.pageSize+#specimen.code+#specimen.name+#specimen.owner")
	public Page<Specimen> findPage(Page<Specimen> page, Specimen specimen) {
		return super.findPage(page, specimen);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "specimenCache",allEntries = true)
	public void save(Specimen specimen) {
		super.save(specimen);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "specimenCache",allEntries = true)
	public void delete(Specimen specimen) {
		super.delete(specimen);
	}

	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String specimenIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(specimenIds)){
			return RequestResult.generateFailResult("标本数据错误");
		}

		//TODO 数据来源

		String[] specimenIdsArray = specimenIds.split(",");
		Specimen specimen = null,newSpecimen = null;
		for (String specimenId:specimenIdsArray) {
			specimen = get(specimenId);
			if (specimen==null){
				continue;
			}
			newSpecimen = new Specimen();
			newSpecimen.setDelFlag("0");
			newSpecimen.setCode(specimen.getCode());
			newSpecimen.setName(specimen.getName());
			newSpecimen.setRemarks(specimen.getRemarks());
			newSpecimen.setReferenceFlag("0");
			newSpecimen.setOwner(createBy.getCompany().getId());

			super.save(newSpecimen);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
	
}