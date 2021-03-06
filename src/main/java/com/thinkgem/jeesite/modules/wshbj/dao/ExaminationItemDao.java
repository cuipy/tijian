/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 检查项目DAO接口
 * @author zhxl
 * @version 2018-03-07
 */
@MyBatisDao
public interface ExaminationItemDao extends CrudDao<ExaminationItem> {

    public List<ExaminationItem> findListByPackage(String packageId);

    public List<ExaminationItem> findAuthorisedList(String roleId);

    public int insertRoleItem(@Param("roleId")String roleId,@Param("itemIdList")List<String> itemIdList);

    public int deleteRoleItem(String roleId);

}