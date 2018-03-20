/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.GenSeqNumber;
import org.apache.ibatis.annotations.Param;

/**
 * 序列号生成DAO接口
 * @author zhxl
 * @version 2018-03-19
 */
@MyBatisDao
public interface GenSeqNumberDao extends CrudDao<GenSeqNumber> {

	public String genSeqNumber1(@Param("keyCode")String keyCode,@Param("increment")int increment);
}