/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 体检记录项目Service
 *
 * @author zhxl
 * @version 2018-03-17
 */
@Service
@Transactional(readOnly = true)
public class ExaminationRecordItemService extends CrudService<ExaminationRecordItemDao, ExaminationRecordItem> {


    @Autowired
    private SampleCodesService sampleCodesService;

    @Autowired
    private ExaminationRecordService examinationRecordService;

    @Autowired
    private ExaminationRecordItemDao examinationRecordItemDao;

    @Override
    //@Cacheable(value = "examinationPackageItemCache",key="'examinationPageItem_get_'+#id")
    public ExaminationRecordItem get(String id) {
        return super.get(id);
    }

    //@Cacheable(value = "examinationPackageItemCache",key="'examinationPageItem_listByRecordId_'+#recordId")
    public List<ExaminationRecordItem> listByRecordId(String recordId){
        if(StringUtils.isBlank(recordId)){
            return new ArrayList<ExaminationRecordItem>();
        }
        List<ExaminationRecordItem> lst = this.dao.listByRecordId(recordId);
        return lst;
    }

    public Page<ExaminationRecordItem> pageNeedSampleNodo(Page<ExaminationRecordItem> page, ExaminationRecordItem entity) {
        entity.setPage(page);
        page.setList(dao.listNeedSampleNodo(entity));
        return page;
    }

    public Page<ExaminationRecordItem> pageNeedSampleDone(Page<ExaminationRecordItem> page, ExaminationRecordItem entity) {
        entity.setPage(page);
        page.setList(dao.listNeedSampleDone(entity));
        return page;
    }

    public  Page<ExaminationRecordItem> pageAllNeedSample(Page<ExaminationRecordItem> page, ExaminationRecordItem entity) {
        entity.setPage(page);
        page.setList(dao.listAllNeedSample(entity));
        return page;
    }

    /**
     * 需要录入结果的，即或者 采集样本结束的，或者 不需要采集样本的
     * @param page
     * @param entity
     * @return
     */
    public Page<ExaminationRecordItem> pageResulting(Page<ExaminationRecordItem> page, ExaminationRecordItem entity) {
        entity.setPage(page);
        page.setList(dao.listResulting(entity));
        return page;
    }

    public Page<ExaminationRecordItem> pageResulted(Page<ExaminationRecordItem> page, ExaminationRecordItem entity) {
        entity.setPage(page);
        page.setList(dao.listResulted(entity));
        return page;
    }


    public Integer countSampleCode(ExaminationRecordItem item){
        int cnt=dao.countSampleCode(item);
        return cnt;
    }

    public RequestResult checkSampleCode(ExaminationRecordItem examinationRecordItem){
        // 验证是否已经在体检记录项目表中存在该记录
        String scode=examinationRecordItem.getSampleCode();

        ExaminationRecordItem sitem=new ExaminationRecordItem();
        sitem.setSampleCode(scode);
        Integer cnt=countSampleCode(sitem);
        if(cnt>0){
            return RequestResult.generate(10,"样本编号已经被使用。");
        }

        SampleCodes sampleCode=new SampleCodes();
        sampleCode.setSampleCode(scode);
        SampleCodes sc = sampleCodesService.getByCode(sampleCode);
        if(sc==null||StringUtils.isEmpty(sc.getSampleCode())){
            return  RequestResult.generate(20,"样本编号不存在，无法使用。");
        }

        if(StringUtils.isEmpty(sc.getSpecimenId())){
            return  RequestResult.generate(30,"该样本编号不合法，在创建的时候忘记选择样本类型了。");
        }

        if(!sc.getSpecimenId().equals(examinationRecordItem.getSpecimenId())){
            return  RequestResult.generate(40,"该样本编号的样本类型与当前选择的类型不一致，因此无法使用。"+
                    sc.getSpecimenId()+"!= "+examinationRecordItem.getSpecimenId());

        }

        return RequestResult.generate(1,"样本编号合法，可以使用");

    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordItemCache",allEntries = true)
    public RequestResult saveSamples(ExaminationRecordItem examinationRecordItem) {
        List<String> resultMessages = Lists.newArrayList();
        resultMessages.add("数据验证失败：");

        //体检记录处于未体检、体检不合格时才允许录入样本
        ExaminationRecord record = examinationRecordService.get(examinationRecordItem.getRecordId());
        if(record==null){
            resultMessages.add("体检记录错误");
            return RequestResult.generateFailResult("根据体检记录编号获取体检记录失败，无法进行采样数据保存", resultMessages);
        }

        // 判断体检状态是否为可操作
        if(!ExaminationRecordConstant.STATUS10.equals(record.getStatus())&&!ExaminationRecordConstant.STATUS0.equals(record.getStatus())
                &&!ExaminationRecordConstant.STATUS20.equals(record.getStatus())&&!ExaminationRecordConstant.STATUS30.equals(record.getStatus())){
            resultMessages.add("该体检记录的状态值"+record.getStatus()+"不允许录入样本");
            return RequestResult.generateFailResult("保存样本失败，该体检记录的状态值"+record.getStatus()+"不允许录入样本", resultMessages);
        }

        RequestResult rr = checkSampleCode(examinationRecordItem);
        if(rr.getState()!=1){
            return rr;
        }


        /**
         * 获取对应项目的最后有效项目
         */
        ExaminationRecordItem recordItem = examinationRecordItemDao.getLastRecordItem(examinationRecordItem.getRecordId(),examinationRecordItem.getItemId());
        if(recordItem==null){
            resultMessages.add("体检项目不存在");
            return RequestResult.generateFailResult("保存样本失败，在获取最后一次有效体检项目时失败了。", resultMessages);
        }

        if(recordItem.getStatus()==1){
            return RequestResult.generate(101,"该体检项目已经采集了样本，正在等待检验结果，不允许重复提交样本数据");
        }

        if(recordItem.getStatus()==3){
            return RequestResult.generate(110,"该体检项目已经合格，无需提交样本");
        }

        if(recordItem.getStatus()==10){
            return RequestResult.generate(120,"由于未知原因，本采集项目状态不正确，不可进行采集操作");
        }


        recordItem.setSampleCode(examinationRecordItem.getSampleCode());
        super.save(recordItem);


        examinationRecordService.updateStatus(record);

        resultMessages.remove(0);
        resultMessages.add("保存成功");
        return RequestResult.generateSuccessResult("保存成功", resultMessages);

    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordItemCache",allEntries = true)
    public RequestResult updateResultFlag(ExaminationRecordItem examinationRecordItem) {

        ExaminationRecordItem eri = get(examinationRecordItem.getId());
        ExaminationRecord record = eri.getRecord();
        if(eri==null){
            return RequestResult.generate(5,"由于未知原因，无法获得该体检项目的数据，保存操作失败!");
        }

//        if("1".equals(eri.getResultFlag())){
//            return RequestResult.generate(8,"该体检项目已经合格，无需再录入项目结果");
//        }

        // 首先获取当前记录，检查状态是否合法
        if(record==null){
            return RequestResult.generate(10,"由于未知原因，根据体检项目获取体检记录信息失败，无法继续操作，保存操作失败");
        }

        // 检查体检记录状态
//        if(ExaminationRecordConstant.STATUS40.equals(record.getStatus())||ExaminationRecordConstant.STATUS45.equals(record.getStatus())
//                ||ExaminationRecordConstant.STATUS50.equals(record.getStatus())){
//            return RequestResult.generate(20,"体检记录的状态为"+record.getStrStatus()+"，无法再设置体检项目的检查结果。");
//        }

        // 检查体检项目的状态
        if("0".equals(eri.getLastFlag())){
            return RequestResult.generate(30,"该体检项目属于废弃的记录，无法修改体检记录。");
        }

//        if(eri.getStatus()==3){
//            return RequestResult.generate(40,"体检项目已经合格，无需再录入项目结果。");
//        }

        if(eri.getStatus()==0){
            return RequestResult.generate(1,"体检项目需要体检样本，但似乎没有进行样本采集，无法进行结果录入。");
        }

        // 设置项目的状态
        // 已经有了中奖结果,说明是复检了
        if(eri.getResultFlag()!=null){
            examinationRecordItem.setExaminationFlag("2");
        }
        eri.setResultFlag(examinationRecordItem.getResultFlag());
        /* 储存取样本的时间*/
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = formatter.parse(dateString, pos);
        eri.setRecordResultTime(strtodate);
        super.save(eri);

        // 更新体检记录的状态
        examinationRecordService.updateStatus(record);

        return RequestResult.generate(1,"保存成功。");
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordItemCache",allEntries = true)
    public RequestResult cancelSample(ExaminationRecordItem examinationRecordItem) {

        ExaminationRecord record = examinationRecordItem.getRecord();
        ExaminationRecordItem eri = get(examinationRecordItem.getId());

        if(eri==null){
            return RequestResult.generate(5,"由于未知原因，无法获得该体检项目的数据，保存操作失败");
        }

        // 首先获取当前记录，检查状态是否合法
        if(record==null){
            return RequestResult.generate(10,"由于未知原因，根据体检项目获取体检记录信息失败，无法继续操作，保存操作失败");
        }

        // 检查体检项目的状态
        if("0".equals(eri.getLastFlag())){
            return RequestResult.generate(30,"该体检项目属于废弃的记录，无法撤销样本编号。");
        }

        if("0".equals(eri.getNeedSamples())){
            return RequestResult.generate(40,"体检项目不需要样本，因此无法进行样本编号撤销。");
        }

        if(eri.getStatus()==0){
            return RequestResult.generate(50,"体检项目需要体检样本，但似乎没有进行样本采集，因此无需样本编号撤销。");
        }

        // 设置样本编号和结果为null
        examinationRecordItem.setSampleCode(null);
        examinationRecordItem.setResultFlag(null);
        super.save(examinationRecordItem);

        // 更新体检记录的状态
        examinationRecordService.updateStatus(record);

        return RequestResult.generate(1,"保存成功。");
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordItemCache",allEntries = true)
    public RequestResult cancelResult(ExaminationRecordItem examinationRecordItem) {

        ExaminationRecord record = examinationRecordItem.getRecord();
        ExaminationRecordItem eri = get(examinationRecordItem.getId());

        if(eri==null){
            return RequestResult.generate(5,"由于未知原因，无法获得该体检项目的数据，保存操作失败");
        }

        // 首先获取当前记录，检查状态是否合法
        if(record==null){
            return RequestResult.generate(10,"由于未知原因，根据体检项目获取体检记录信息失败，无法继续操作，保存操作失败");
        }

        // 检查体检项目的状态
        if("0".equals(eri.getLastFlag())){
            return RequestResult.generate(30,"该体检项目属于废弃的记录，无法撤销样本编号。");
        }

        // 设置样本编号和结果为null
        eri.setResultFlag(null);
        super.save(eri);

        // 更新体检记录的状态
        examinationRecordService.updateStatus(record);

        return RequestResult.generate(1,"保存成功。");
    }

    public int countNoResult(ExaminationRecordItem eriTmp) {
        return dao.countNoResult(eriTmp);
    }

    public int countNotOk(ExaminationRecordItem eriTmp) {
        return dao.countNotOk(eriTmp);
    }

    public int countExamFlag2(ExaminationRecordItem eriTmp) {
        return dao.countExamFlag2(eriTmp);
    }

//    @Transactional(readOnly = false)
//    //@CacheEvict(value = "examinationRecordItemCache",allEntries = true)
//    public void saveRecordResult( String recordItemId, String sampleCode
//            , String resultDictId,String resultDictName
//            ,String resultFlag, String resultRemarks) {
//        dao.saveRecordResult(recordItemId,sampleCode,resultDictId,resultDictName,resultFlag,resultRemarks);
//    }


    @Transactional(readOnly = false)
    public int updateLastFlag(String id, String lastFlag){
        return this.dao.updateLastFlag(id,lastFlag);
    }

    @Transactional(readOnly = false)
    public int updateSampleCodePrintCount( ExaminationRecordItem examinationRecordItem){
        return this.dao.updateSampleCodePrintCount(examinationRecordItem);
    }

    @Transactional(readOnly = false)
    public Integer updateGrabSample(ExaminationRecordItem examinationRecordItem) {
        return dao.updateGrabSample(examinationRecordItem);
    }

    @Transactional(readOnly = false)
    public Integer cancelGrabSample(String examRecordId,String spencimenId,Date strtodate) {
        return dao.cancelGrabSample(examRecordId,spencimenId,strtodate);
    }
}