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

    @Cacheable(value = "examinationItemCache",key="'examinationItem_findListByPackage_'+#packageId")
    public List<ExaminationItem> findListByPackage(String packageId);

    @Cacheable(value = "examinationItemCache",key="'examinationItem_findAuthorisedList_'+#roleId")
    public List<ExaminationItem> findAuthorisedList(String roleId);

    @CacheEvict(value="examinationItemCache",allEntries=true)
    public int insertRoleItem(@Param("roleId")String roleId,@Param("itemIdList")List<String> itemIdList);

    @CacheEvict(value="examinationItemCache",allEntries=true)
    public int deleteRoleItem(String roleId);

    @Override
    @Cacheable(value = "examinationItemCache",key="'examinationItem_get_'+#id")
    ExaminationItem get(String id);

    @Override
    @Cacheable(value = "examinationItemCache",key="'examinationItem_findList_'+#code+#name+#owner")
    List<ExaminationItem> findList(ExaminationItem entity);

    @Override
    @Cacheable(value = "examinationItemCache",key="'examinationItem_get_'+#id+#code+#name+#owner")
    ExaminationItem get(ExaminationItem entity);

    @Override
    @Cacheable(value = "examinationItemCache",key="'examinationItem_findAllList_'+#id+#code+#name+#owner")
    List<ExaminationItem> findAllList(ExaminationItem entity);

    @Override
    @CacheEvict(value="examinationItemCache",allEntries=true)
    int insert(ExaminationItem entity);

    @Override
    @CacheEvict(value="examinationItemCache",allEntries=true)
    int update(ExaminationItem entity);

    @Override
    @CacheEvict(value="examinationItemCache",allEntries=true)
    int delete(ExaminationItem entity);
}