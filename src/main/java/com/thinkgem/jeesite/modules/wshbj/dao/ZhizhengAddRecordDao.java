/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;

import java.util.List;

/**
 * 制证新增记录
 * @author cuipengyu
 * @version 2018-06-12
 */
@MyBatisDao
public interface ZhizhengAddRecordDao extends CrudDao<Specimen> {

    List<ZhizhengAddRecord> getLast2();
    
}