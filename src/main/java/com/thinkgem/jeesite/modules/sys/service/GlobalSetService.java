/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;
import com.thinkgem.jeesite.modules.sys.dao.GlobalSetDao;

/**
 * 全局参数配置Service
 * @author cuipengyu
 * @version 2018-04-18
 */
@Service
@Transactional(readOnly = true)
public class GlobalSetService extends CrudService<GlobalSetDao, GlobalSet> {


	public GlobalSet get(String id) {
		return super.get(id);
	}
	
	public List<GlobalSet> findList(GlobalSet globalSet) {
		return super.findList(globalSet);
	}
	
	public Page<GlobalSet> findPage(Page<GlobalSet> page, GlobalSet globalSet) {
		return super.findPage(page, globalSet);
	}
	
	@Transactional(readOnly = false)
	public void save(GlobalSet globalSet) {


		super.save(globalSet);
	}
	
	@Transactional(readOnly = false)
	public void delete(GlobalSet globalSet) {
		super.delete(globalSet);
	}

	protected GlobalSet refreshBean(GlobalSet globalSet) {

		return globalSet;
	}
	
}