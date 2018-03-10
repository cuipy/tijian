/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationCategoryDao;

/**
 * 检查类别Service
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
	public RequestResult saveByPull(ExaminationCategory examinationCategory) {


		//
		return null;
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationCategory examinationCategory) {
		super.delete(examinationCategory);
	}
	
}