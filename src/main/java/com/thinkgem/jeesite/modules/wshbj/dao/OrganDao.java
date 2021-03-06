/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.entity.tongji1;
import org.apache.ibatis.annotations.Param;
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

    List<Organ> listNeedUpload(Organ organ);

    int updateUploadDate(Organ organ);

    List<Organ> tongji1(@Param("beginDate")String beginDate, @Param("endDate")String endDate,@Param("organ") String organ );

}