/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test1.entity.Test1;

/**
 * 测试1 描述DAO接口
 * @author 崔鹏宇
 * @version 2018-03-13
 */
@MyBatisDao
public interface Test1Dao extends CrudDao<Test1> {

	Test1 getByAuth(Test1 test1);

	
}