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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public List<ExaminationRecordItem> listByRecordId(String recordId){
        if(StringUtils.isBlank(recordId)){
            return new ArrayList<ExaminationRecordItem>();
        }
        return this.dao.listByRecordId(recordId);
    }

    public Integer count(ExaminationRecordItem item){
        int cnt=dao.count(item);
        return cnt;
    }

    public RequestResult checkSampleCode(ExaminationRecordItem examinationRecordItem){
        // 验证是否已经在体检记录项目表中存在该记录
        String scode=examinationRecordItem.getSampleCode();

        ExaminationRecordItem sitem=new ExaminationRecordItem();
        sitem.setSampleCode(scode);
        Integer cnt=count(sitem);
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
            return RequestResult.generate(110,"由于未知原因，本采集项目状态不正确，不可进行采集操作");
        }


        recordItem.setSampleCode(examinationRecordItem.getSampleCode());
        super.save(recordItem);

        examinationRecordService.updateRecordStatus(recordItem.getRecordId(),ExaminationRecordConstant.STATUS10);

        resultMessages.remove(0);
        resultMessages.add("保存成功");
        return RequestResult.generateSuccessResult("保存成功", resultMessages);

    }

}