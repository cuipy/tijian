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
import com.thinkgem.jeesite.modules.wshbj.entity.CertRecord;
import com.thinkgem.jeesite.modules.wshbj.dao.CertRecordDao;

/**
 * 制卡记录Service
 * @author zhxl
 * @version 2018-03-25
 */
@Service
@Transactional(readOnly = true)
public class CertRecordService extends CrudService<CertRecordDao, CertRecord> {



	public CertRecord get(String id) {
		return super.get(id);
	}
	
	public List<CertRecord> findList(CertRecord certRecord) {
		return super.findList(certRecord);
	}
	
	public Page<CertRecord> findPage(Page<CertRecord> page, CertRecord certRecord) {
		return super.findPage(page, certRecord);
	}
	
	@Transactional(readOnly = false)
	public void save(CertRecord certRecord) {



		super.save(certRecord);
	}
	
	@Transactional(readOnly = false)
	public void delete(CertRecord certRecord) {
		super.delete(certRecord);
	}


	
}