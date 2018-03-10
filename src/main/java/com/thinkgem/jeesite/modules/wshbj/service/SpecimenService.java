/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.dao.SpecimenDao;

/**
 * 检查标本类型Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class SpecimenService extends CrudService<SpecimenDao, Specimen> {

	public Specimen get(String id) {
		return super.get(id);
	}
	
	public List<Specimen> findList(Specimen specimen) {
		return super.findList(specimen);
	}
	
	public Page<Specimen> findPage(Page<Specimen> page, Specimen specimen) {
		return super.findPage(page, specimen);
	}
	
	@Transactional(readOnly = false)
	public void save(Specimen specimen) {
		super.save(specimen);
	}
	
	@Transactional(readOnly = false)
	public void delete(Specimen specimen) {
		super.delete(specimen);
	}
	
}