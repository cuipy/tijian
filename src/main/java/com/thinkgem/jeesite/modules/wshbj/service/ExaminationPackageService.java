/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationPackage;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationPackageDao;

/**
 * 体检套餐Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationPackageService extends CrudService<ExaminationPackageDao, ExaminationPackage> {

	public ExaminationPackage get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationPackage> findList(ExaminationPackage examinationPackage) {
		return super.findList(examinationPackage);
	}
	
	public Page<ExaminationPackage> findPage(Page<ExaminationPackage> page, ExaminationPackage examinationPackage) {
		return super.findPage(page, examinationPackage);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationPackage examinationPackage) {
		super.save(examinationPackage);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationPackage examinationPackage) {
		super.delete(examinationPackage);
	}
	
}