/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemCategory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItemType;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemTypeDao;

/**
 * 检查项目类型Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationItemTypeService extends CrudService<ExaminationItemTypeDao, ExaminationItemType> {

	public ExaminationItemType get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationItemType> findList(ExaminationItemType examinationItemType) {
		return super.findList(examinationItemType);
	}
	
	public Page<ExaminationItemType> findPage(Page<ExaminationItemType> page, ExaminationItemType examinationItemType) {
		return super.findPage(page, examinationItemType);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationItemType examinationItemType) {
		super.save(examinationItemType);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationItemType examinationItemType) {
		super.delete(examinationItemType);
	}


	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String typeIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(typeIds)){
			return RequestResult.generateFailResult("类型数据错误");
		}

		//TODO 数据来源

		String[] categoryIdsArray = typeIds.split(",");
		ExaminationItemType type = null,newType = null;
		for (String categoryId:categoryIdsArray) {
			type = get(categoryId);
			if (type==null){
				continue;
			}
			newType = new ExaminationItemType();
			newType.setDelFlag("0");
			newType.setCode(type.getCode());
			newType.setName(type.getName());
			newType.setRemarks(type.getRemarks());
			newType.setReferenceFlag("0");
			newType.setOwner(createBy.getCompany().getId());

			super.save(newType);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
}