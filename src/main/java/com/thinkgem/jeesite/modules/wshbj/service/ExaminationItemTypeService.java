/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

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
	
}