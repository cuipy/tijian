/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;

/**
 * 全局参数配置DAO接口
 * @author cuipengyu
 * @version 2018-04-18
 */
@MyBatisDao
public interface GlobalSetDao extends CrudDao<GlobalSet> {

	
}