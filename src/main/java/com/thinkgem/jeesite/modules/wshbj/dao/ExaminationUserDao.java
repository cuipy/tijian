/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * 体检用户DAO接口
 * @author zhxl
 * @version 2018-03-07
 */
@MyBatisDao
public interface ExaminationUserDao extends CrudDao<ExaminationUser> {

    ExaminationUser getByIdNumberAndOwner(@Param("idNumber")String idNumber, @Param("owner")String owner);

    List<ExaminationUser> listNeedUpload(ExaminationUser examinationUser);

    void updateUploadDate(ExaminationUser examinationUser);
}