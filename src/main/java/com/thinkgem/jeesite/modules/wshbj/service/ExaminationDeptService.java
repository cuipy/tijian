/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationDept;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationDeptDao;

/**
 * 检查部门Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationDeptService extends CrudService<ExaminationDeptDao, ExaminationDept> {

	public ExaminationDept get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationDept> findList(ExaminationDept examinationDept) {
		return super.findList(examinationDept);
	}
	
	public Page<ExaminationDept> findPage(Page<ExaminationDept> page, ExaminationDept examinationDept) {
		return super.findPage(page, examinationDept);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationDept examinationDept) {
		super.save(examinationDept);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationDept examinationDept) {
		super.delete(examinationDept);
	}
	
}