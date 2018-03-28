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
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationSamples;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;

/**
 * 体检样本Service
 * @author zhxl
 * @version 2018-03-25
 */
@Service
@Transactional(readOnly = true)
public class ExaminationSamplesService extends CrudService<ExaminationSamplesDao, ExaminationSamples> {


	public ExaminationSamples get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationSamples> findList(ExaminationSamples examinationSamples) {
		return super.findList(examinationSamples);
	}
	
	public Page<ExaminationSamples> findPage(Page<ExaminationSamples> page, ExaminationSamples examinationSamples) {
		return super.findPage(page, examinationSamples);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationSamples examinationSamples) {


		super.save(examinationSamples);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationSamples examinationSamples) {
		super.delete(examinationSamples);
	}

	protected ExaminationSamples refreshBean(ExaminationSamples examinationSamples) {

		return examinationSamples;
	}
	
}