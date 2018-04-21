/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 体检记录DAO接口
 * @author zhxl
 * @version 2018-03-17
 */
@MyBatisDao
public interface ExaminationRecordItemDao extends CrudDao<ExaminationRecordItem> {

    public int saveRecordResult(@Param("recordItemId") String recordItemId, @Param("sampleCode")String sampleCode
            , @Param("resultDictId")String resultDictId,@Param("resultDictName")String resultDictName
            ,@Param("resultFlag")String resultFlag,@Param("resultRemarks") String resultRemarks);

    public ExaminationRecordItem getEmptyResult(ExaminationRecordItem recordItem);

    ExaminationRecordItem getLastRecordItem(@Param("recordId") String recordId,@Param("itemId")String itemId);

    public int updateSampleCode(@Param("id") String id,@Param("sampleCode")String sampleCode);

    public int revokeSampleCode(@Param("id") String id);

    int countUnCompletedRecordItem(String recordId);

    int countCompletedRecordItem(String recordId);

    /**
     * @author zhxl
     * @description 根据体检记录查询所有体检记录项目
     * @date 2018/4/18 23:36:48
     * @param
     * @return java.util.List<com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem>
     */
    List<ExaminationRecordItem> listByRecordId(String recordId);

    int count(ExaminationRecordItem item);

    /**
     * 有几个项目没通过
     * @param item
     * @return
     */
    int countNotOk(ExaminationRecordItem item);

    /**
     * 复检的数量
     * @param item
     * @return
     */
    int countExamFlag2(ExaminationRecordItem item);

    /**
     * 样本编号在整个表中的数量，验证一个样本编号是否已经被用了
     * @param item
     * @return
     */
    int countSampleCode(ExaminationRecordItem item);

    /**
     * 还没有体检结果的项目
     * @param item
     * @return
     */
    int countNoResult(ExaminationRecordItem item);

    /**
     * 计算没体检的项目
     * @param item
     * @return
     */
    int countNoExam(ExaminationRecordItem item);

    List<ExaminationRecordItem> listNodo(ExaminationRecordItem entity);

    List<ExaminationRecordItem> listDone(ExaminationRecordItem entity);

}