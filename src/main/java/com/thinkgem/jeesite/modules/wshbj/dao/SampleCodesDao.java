/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.SampleCodes;

/**
 * 样本编号库DAO接口
 * @author cuipengyu
 * @version 2018-04-20
 */
@MyBatisDao
public interface SampleCodesDao extends CrudDao<SampleCodes> {

    SampleCodes getByCode(SampleCodes sampleCodes);

    void updateUsed(SampleCodes sampleCodes);
}