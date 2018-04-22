/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 检查标本类型DAO接口
 * @author zhxl
 * @version 2018-03-07
 */
@MyBatisDao
public interface SpecimenDao extends CrudDao<Specimen> {

    @Override
    @Cacheable(value = "specimenCache",key="'specimen_get_'+#id")
    Specimen get(String id);

    @Override
    @Cacheable(value = "specimenCache",key="'specimen_ge_'+#id+#name+#owner")
    Specimen get(Specimen entity);

    @Override
    @CacheEvict(value="specimenCache",allEntries=true)
    int insert(Specimen entity);

    @Override
    @CacheEvict(value="specimenCache",allEntries=true)
    int update(Specimen entity);

    @Override
    @CacheEvict(value="specimenCache",allEntries=true)
    int delete(Specimen entity);
    
}