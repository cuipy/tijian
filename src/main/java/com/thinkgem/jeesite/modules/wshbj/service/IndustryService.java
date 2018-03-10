/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import com.thinkgem.jeesite.modules.wshbj.dao.IndustryDao;

/**
 * 行业基础数据管理Service
 * @author zhxl
 * @version 2018-03-06
 */
@Service
@Transactional(readOnly = true)
public class IndustryService extends CrudService<IndustryDao, Industry> {

	public Industry get(String id) {
		return super.get(id);
	}
	
	public List<Industry> findList(Industry industry) {
		return super.findList(industry);
	}
	
	public Page<Industry> findPage(Page<Industry> page, Industry industry) {
		return super.findPage(page, industry);
	}
	
	@Transactional(readOnly = false)
	public void save(Industry industry) {
		super.save(industry);
	}
	
	@Transactional(readOnly = false)
	public void delete(Industry industry) {
		super.delete(industry);
	}
	
}