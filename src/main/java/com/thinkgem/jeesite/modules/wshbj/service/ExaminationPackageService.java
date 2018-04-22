/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationPackage;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationPackageDao;
import com.thinkgem.jeesite.modules.wshbj.entity.PackageItem;
import com.thinkgem.jeesite.modules.wshbj.dao.PackageItemDao;

/**
 * 体检套餐Service
 * @author zhxl
 * @version 2018-03-12
 */
@Service
@Transactional(readOnly = true)
public class ExaminationPackageService extends CrudService<ExaminationPackageDao, ExaminationPackage> {

	@Autowired
	private PackageItemDao packageItemDao;
	
	public ExaminationPackage get(String id) {
		ExaminationPackage examinationPackage = super.get(id);
		if (examinationPackage!=null){
			examinationPackage.setPackageItemList(packageItemDao.findList(new PackageItem(examinationPackage)));
		}

		return examinationPackage;
	}

	@Cacheable(value = "examinationPackageCache",key="'examinationPage_findList_'+#examinationPackage.name+#examinationPackage.owner")
	public List<ExaminationPackage> findList(ExaminationPackage examinationPackage) {
		return super.findList(examinationPackage);
	}


	public Page<ExaminationPackage> findPage(Page<ExaminationPackage> page, ExaminationPackage examinationPackage) {
		return super.findPage(page, examinationPackage);
	}


	
	@Transactional(readOnly = false)
	public void save(ExaminationPackage examinationPackage) {
		super.save(examinationPackage);
		for (PackageItem packageItem : examinationPackage.getPackageItemList()){
			if (packageItem.getId() == null){
				continue;
			}
			if (PackageItem.DEL_FLAG_NORMAL.equals(packageItem.getDelFlag())){
				if (StringUtils.isBlank(packageItem.getId())){
					packageItem.setExaminationPackage(examinationPackage);
					packageItem.preInsert();
					packageItemDao.insert(packageItem);
				}else{
					packageItem.preUpdate();
					packageItemDao.update(packageItem);
				}
			}else{
				packageItemDao.delete(packageItem);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationPackage examinationPackage) {
		super.delete(examinationPackage);
		packageItemDao.delete(new PackageItem(examinationPackage));
	}
	
}