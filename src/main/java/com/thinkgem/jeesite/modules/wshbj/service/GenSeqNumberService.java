/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.GenSeqNumber;
import com.thinkgem.jeesite.modules.wshbj.dao.GenSeqNumberDao;

/**
 * 序列号生成Service
 * @author zhxl
 * @version 2018-03-19
 */
@Service
@Transactional(readOnly = true)
public class GenSeqNumberService extends CrudService<GenSeqNumberDao, GenSeqNumber> {


	public GenSeqNumber get(String id) {
		return super.get(id);
	}
	
	public List<GenSeqNumber> findList(GenSeqNumber genSeqNumber) {
		return super.findList(genSeqNumber);
	}
	
	public Page<GenSeqNumber> findPage(Page<GenSeqNumber> page, GenSeqNumber genSeqNumber) {
		return super.findPage(page, genSeqNumber);
	}
	
	@Transactional(readOnly = false)
	public void save(GenSeqNumber genSeqNumber) {


		super.save(genSeqNumber);
	}
	
	@Transactional(readOnly = false)
	public void delete(GenSeqNumber genSeqNumber) {
		super.delete(genSeqNumber);
	}

	protected GenSeqNumber refreshBean(GenSeqNumber genSeqNumber) {

		return genSeqNumber;
	}


	@Transactional(readOnly = false)
	public String genSeqNumber1(String keyCode, int increment){
		if (StringUtils.isBlank(keyCode)){
			return null;
		}
		return this.dao.genSeqNumber1(keyCode,increment);
	}
}