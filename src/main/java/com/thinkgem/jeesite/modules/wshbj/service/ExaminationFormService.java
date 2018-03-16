/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationForm;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationFormDao;

/**
 * 体检流程表模板Service
 * @author zhxl
 * @version 2018-03-14
 */
@Service
@Transactional(readOnly = true)
public class ExaminationFormService extends CrudService<ExaminationFormDao, ExaminationForm> {


	public ExaminationForm get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationForm> findList(ExaminationForm examinationForm) {
		return super.findList(examinationForm);
	}
	
	public Page<ExaminationForm> findPage(Page<ExaminationForm> page, ExaminationForm examinationForm) {
		return super.findPage(page, examinationForm);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationForm examinationForm) {


		super.save(examinationForm);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationForm examinationForm) {
		super.delete(examinationForm);
	}

	protected ExaminationForm refreshBean(ExaminationForm examinationForm) {

		return examinationForm;
	}
	
}