/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.dao.CertRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.PackageItemDao;
import com.thinkgem.jeesite.modules.wshbj.entity.CertRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.PackageItem;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 制卡记录Service
 * @author zhxl
 * @version 2018-03-25
 */
@Service
@Transactional(readOnly = true)
public class PackageItemService extends CrudService<PackageItemDao, PackageItem> {



	public PackageItem get(String id) {
		return super.get(id);
	}
	
	public List<PackageItem> findList(PackageItem packageItem) {
		return super.findList(packageItem);
	}

	
	@Transactional(readOnly = false)
	public void save(PackageItem packageItem) {
		super.save(packageItem);
	}
	
	@Transactional(readOnly = false)
	public void delete(PackageItem packageItem) {
		super.delete(packageItem);
	}


	
}