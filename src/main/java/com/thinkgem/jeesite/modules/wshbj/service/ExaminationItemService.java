/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemDao;

/**
 * 检查项目Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationItemService extends CrudService<ExaminationItemDao, ExaminationItem> {

	public ExaminationItem get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationItem> findList(ExaminationItem examinationItem) {
		return super.findList(examinationItem);
	}
	
	public Page<ExaminationItem> findPage(Page<ExaminationItem> page, ExaminationItem examinationItem) {
		return super.findPage(page, examinationItem);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationItem examinationItem) {
		super.save(examinationItem);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationItem examinationItem) {
		super.delete(examinationItem);
	}
	
}