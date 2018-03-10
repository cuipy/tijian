/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;

/**
 * 体检记录DAO接口
 * @author zhxl
 * @version 2018-03-07
 */
@MyBatisDao
public interface ExaminationRecordDao extends CrudDao<ExaminationRecord> {
	
}