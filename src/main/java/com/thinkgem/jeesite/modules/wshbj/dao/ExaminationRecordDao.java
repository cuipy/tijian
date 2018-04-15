/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 体检记录DAO接口
 * @author zhxl
 * @version 2018-03-17
 */
@MyBatisDao
public interface ExaminationRecordDao extends CrudDao<ExaminationRecord> {

	public String genCode(@Param("keyCode")String keyCode);

	public ExaminationRecord getByCode(String code);

	public Map getMapByCode(String code);

	List<ExaminationRecord> getList4Result(@Param("startDate")String startDate,@Param("endDate") String endDate
			,@Param("code") String code,@Param("organId") String organId);

	int updateRecordStatus(@Param("id")String id,@Param("status")String status);


	List<Map> getList4CertForm(@Param("startDate")String startDate,@Param("endDate") String endDate
			,@Param("code") String code,@Param("organId") String organId,@Param("name") String name,@Param("status") String status);
}