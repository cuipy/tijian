/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationSamples;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 体检样本DAO接口
 * @author zhxl
 * @version 2018-03-25
 */
@MyBatisDao
public interface ExaminationSamplesDao extends CrudDao<ExaminationSamples> {

    ExaminationSamples getEffectiveSample(ExaminationSamples examinationSamples);

    ExaminationSamples getByCode(@Param("code") String code);

    List<Map> findMapList(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("startCode") String startCode
            , @Param("endCode") String endCode, @Param("orgId") String orgId, @Param("orgName")String orgName,
                                           @Param("itemId") String itemId, @Param("code")String code, @Param("examinationCode")String examinationCode);

    int updateResult(@Param("id")String id,@Param("resultDictId")String resultDictId
            ,@Param("resultFlag")String resultFlag,@Param("resultRemarks")String resultRemarks);

    int updateResultByCode(@Param("code")String code,@Param("resultDictId")String resultDictId
            ,@Param("resultFlag")String resultFlag,@Param("resultRemarks")String resultRemarks);
}