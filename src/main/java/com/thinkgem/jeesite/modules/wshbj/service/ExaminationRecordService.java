/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;

/**
 * 体检记录Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationRecordService extends CrudService<ExaminationRecordDao, ExaminationRecord> {

	public ExaminationRecord get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationRecord> findList(ExaminationRecord examinationRecord) {
		return super.findList(examinationRecord);
	}
	
	public Page<ExaminationRecord> findPage(Page<ExaminationRecord> page, ExaminationRecord examinationRecord) {
		return super.findPage(page, examinationRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationRecord examinationRecord) {
		super.save(examinationRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationRecord examinationRecord) {
		super.delete(examinationRecord);
	}
	
}