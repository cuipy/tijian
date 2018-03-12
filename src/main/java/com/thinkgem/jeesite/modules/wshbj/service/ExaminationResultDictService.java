/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationResultDict;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationResultDictDao;

/**
 * 体检结果字典Service
 * @author zhxl
 * @version 2018-03-12
 */
@Service
@Transactional(readOnly = true)
public class ExaminationResultDictService extends CrudService<ExaminationResultDictDao, ExaminationResultDict> {

	public ExaminationResultDict get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationResultDict> findList(ExaminationResultDict examinationResultDict) {
		return super.findList(examinationResultDict);
	}
	
	public Page<ExaminationResultDict> findPage(Page<ExaminationResultDict> page, ExaminationResultDict examinationResultDict) {
		return super.findPage(page, examinationResultDict);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationResultDict examinationResultDict) {
		super.save(examinationResultDict);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationResultDict examinationResultDict) {
		super.delete(examinationResultDict);
	}
	
}