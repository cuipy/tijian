/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.dao.OrganDao;

/**
 * 体检单位Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class OrganService extends CrudService<OrganDao, Organ> {

	public Organ get(String id) {
		return super.get(id);
	}
	
	public List<Organ> findList(Organ organ) {
		return super.findList(organ);
	}
	
	public Page<Organ> findPage(Page<Organ> page, Organ organ) {
		return super.findPage(page, organ);
	}
	
	@Transactional(readOnly = false)
	public void save(Organ organ) {
		super.save(organ);
	}
	
	@Transactional(readOnly = false)
	public void delete(Organ organ) {
		super.delete(organ);
	}
	
}