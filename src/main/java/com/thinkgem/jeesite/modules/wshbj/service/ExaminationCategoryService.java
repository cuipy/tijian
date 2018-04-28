/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.Date;
import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationCategoryDao;

/**
 * 检查大类Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationCategoryService extends CrudService<ExaminationCategoryDao, ExaminationCategory> {


	public ExaminationCategory get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationCategory> findList(ExaminationCategory examinationCategory) {
		return super.findList(examinationCategory);
	}
	
	public Page<ExaminationCategory> findPage(Page<ExaminationCategory> page, ExaminationCategory examinationCategory) {
		return super.findPage(page, examinationCategory);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationCategory examinationCategory) {
		super.save(examinationCategory);
	}

	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy,String examinationCategoryIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(examinationCategoryIds)){
			return RequestResult.generateFailResult("类别数据错误");
		}

		//TODO 数据来源

		String[] categoryIdsArray = examinationCategoryIds.split(",");
		ExaminationCategory category = null,newCategory = null;
		for (String categoryId:categoryIdsArray) {
			category = get(categoryId);
			if (category==null){
				continue;
			}
			newCategory = new ExaminationCategory();
			newCategory.setDelFlag("0");
			newCategory.setCode(category.getCode());
			newCategory.setName(category.getName());
			newCategory.setRemarks(category.getRemarks());
			newCategory.setReferenceFlag("0");
			newCategory.setOwner(createBy.getCompany().getId());

			super.save(newCategory);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationCategory examinationCategory) {
		super.delete(examinationCategory);
	}
	
}