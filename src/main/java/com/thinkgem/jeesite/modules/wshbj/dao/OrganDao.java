/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 体检单位DAO接口
 * @author zhxl
 * @version 2018-03-12
 */
@MyBatisDao
public interface OrganDao extends CrudDao<Organ> {

    @Override
    @Cacheable(value = "organCache",key="'organ_get_'+#id")
    Organ get(String id);

    @Override
    @Cacheable(value = "organCache",key="'organ_ge_'+#id+#name+#owner")
    Organ get(Organ entity);


    @Override
    @CacheEvict(value="organCache",allEntries=true)
    int insert(Organ entity);

    @Override
    @CacheEvict(value="organCache",allEntries=true)
    int update(Organ entity);

    @Override
    @CacheEvict(value="organCache",allEntries=true)
    int delete(Organ entity);
}