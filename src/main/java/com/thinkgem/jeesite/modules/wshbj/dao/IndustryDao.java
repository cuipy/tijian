/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;

import java.util.List;

/**
 * 行业基础数据管理DAO接口
 * @author zhxl
 * @version 2018-03-11
 */
@MyBatisDao
@EnableCaching
public interface IndustryDao extends CrudDao<Industry> {

    @Override
    Industry get(String id);

    @Override
    @Cacheable(value = "industryCache",key="'industry_findList_'")
    List<Industry> findList(Industry entity);

    @Override
    @Cacheable(value = "industryCache",key="'industry_get_'+#id+#name+#owner")
    Industry get(Industry entity);

    @Override
    @Cacheable(value = "industryCache",key="'industry_findAllList_'+#id+#name+#owner")
    List<Industry> findAllList(Industry entity);

    @Override
    @CacheEvict(value="industryCache",allEntries=true)
    int insert(Industry entity);

    @Override
    @CacheEvict(value="industryCache",allEntries=true)
    int update(Industry entity);

    @Override
    @CacheEvict(value="industryCache",allEntries=true)
    int delete(Industry entity);
}