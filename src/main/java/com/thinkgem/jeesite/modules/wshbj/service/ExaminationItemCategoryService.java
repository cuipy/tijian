/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemCategoryDao;

/**
 * 检查项目分类Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationItemCategoryService extends CrudService<ExaminationItemCategoryDao, ExaminationItemCategory> {

	public ExaminationItemCategory get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationItemCategory> findList(ExaminationItemCategory examinationItemCategory) {
		return super.findList(examinationItemCategory);
	}
	
	public Page<ExaminationItemCategory> findPage(Page<ExaminationItemCategory> page, ExaminationItemCategory examinationItemCategory) {
		return super.findPage(page, examinationItemCategory);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationItemCategory examinationItemCategory) {
		super.save(examinationItemCategory);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationItemCategory examinationItemCategory) {
		super.delete(examinationItemCategory);
	}


	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String itemCategoryIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(itemCategoryIds)){
			return RequestResult.generateFailResult("类别数据错误");
		}

		//TODO 数据来源

		String[] categoryIdsArray = itemCategoryIds.split(",");
		ExaminationItemCategory category = null,newCategory = null;
		for (String categoryId:categoryIdsArray) {
			category = get(categoryId);
			if (category==null){
				continue;
			}
			newCategory = new ExaminationItemCategory();
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
}