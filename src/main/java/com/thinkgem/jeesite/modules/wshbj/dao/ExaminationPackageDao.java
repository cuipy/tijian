/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationPackage;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

/**
 * 体检套餐DAO接口
 * @author zhxl
 * @version 2018-03-12
 */
@MyBatisDao
public interface ExaminationPackageDao extends CrudDao<ExaminationPackage> {

    @Override
    @Cacheable(value = "examinationPackageCache",key="'examinationPage_get_'+#id")
    ExaminationPackage get(String id);

    @Override
    @CacheEvict(value = "examinationPackageCache",allEntries = true)
    int insert(ExaminationPackage entity);

    @Override
    @CacheEvict(value = "examinationPackageCache",allEntries = true)
    int update(ExaminationPackage entity);

    @Override
    @CacheEvict(value = "examinationPackageCache",allEntries = true)
    int delete(ExaminationPackage entity);
}