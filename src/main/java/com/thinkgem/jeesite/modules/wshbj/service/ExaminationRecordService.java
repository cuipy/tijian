/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.text.SimpleDateFormat;
import java.util.*;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import org.springframework.web.bind.annotation.RequestParam;
import sun.misc.Request;

/**
 * 体检记录Service
 *
 * @author zhxl
 * @version 2018-03-17
 */
@Service
@Transactional(readOnly = true)
public class ExaminationRecordService extends CrudService<ExaminationRecordDao, ExaminationRecord> {

    @Autowired
    private ExaminationRecordDao examinationRecordDao;

    @Autowired
    private ExaminationUserService examinationUserService;
    @Autowired
    private ExaminationItemService examinationItemService;
    @Autowired
    private ExaminationResultDictService resultDictService;
    @Autowired
    private ExaminationSamplesDao examinationSamplesDao;
    @Autowired
    private ExaminationRecordItemService examinationRecordItemService;

    @Autowired
    private SpecimenService specimenService;

    @Autowired
    private ZhizhengAddRecordService zhizhengAddRecordService;


    //@Cacheable(value = "examinationRecordCache",key="'examinationRecord_get_'+#id")
    public ExaminationRecord get(String id) {
        ExaminationRecord examinationRecord = super.get(id);
        return examinationRecord;
    }

    public String getHeadImg(String id) {
        return dao.getHeadImg(id);
    }

    //@Cacheable(value = "examinationRecordCache",key="'examinationRecord_getByCode_'+#examinationRecord.code")
    public ExaminationRecord getByCode(ExaminationRecord examinationRecord) {
        examinationRecord = this.dao.getByCode(examinationRecord);
        return examinationRecord;
    }


    public List<ExaminationRecord> findList(ExaminationRecord examinationRecord) {
        return super.findList(examinationRecord);
    }

    /**
     * 获取状态小于等于某个值的记录列表
     *
     * @param examinationRecord
     * @return
     */
    public List<ExaminationRecord> listBeforeStatus(ExaminationRecord examinationRecord) {
        return examinationRecordDao.listBeforeStatus(examinationRecord);
    }

    public Page<ExaminationRecord> findPage(Page<ExaminationRecord> page, ExaminationRecord examinationRecord) {
        return super.findPage(page, examinationRecord);
    }

    public Page<ExaminationRecord> pageForPrint(Page<ExaminationRecord> page, ExaminationRecord examinationRecord) {

        examinationRecord.setPage(page);
        page.setList(dao.listForPrint(examinationRecord));
        return page;
    }

    public Page<ExaminationRecord> pageForNopass(Page<ExaminationRecord> page, ExaminationRecord examinationRecord) {

        examinationRecord.setPage(page);
        page.setList(dao.listForNopass(examinationRecord));
        return page;
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public void save(ExaminationRecord examinationRecord) {
        super.save(examinationRecord);
        for (ExaminationRecordItem examinationRecordItem : examinationRecord.getItems()) {
            if (examinationRecordItem.getId() == null) {
                continue;
            }
            if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(examinationRecordItem.getDelFlag())) {
                examinationRecordItemService.save(examinationRecordItem);
            } else {
                examinationRecordItemService.delete(examinationRecordItem);
            }
        }
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public int updateRecordStatus(String recordId, String status) {
        if (StringUtils.isBlank(recordId) || StringUtils.isBlank(status)) {
            return 0;
        }
        int count = this.dao.updateRecordStatus(recordId, status);
        return count;
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public void delete(ExaminationRecord examinationRecord) {
        super.delete(examinationRecord);
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(examinationRecord.getId());
        examinationRecordItemService.delete(recordItem);
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public RequestResult delRecord(ExaminationRecord examinationRecord) {


        ExaminationRecord record = get(examinationRecord.getId());
        //未体检状态才允许修改
        if (!ExaminationRecordConstant.STATUS0.equals(record.getStatus())) {
            return RequestResult.generate(10, "未体检状态才可以删除，该体检记录不允许删除");
        }

        super.delete(examinationRecord);
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(examinationRecord.getId());
        examinationRecordItemService.delete(recordItem);

        // 返回执行成功
        return RequestResult.generate(1, "删除成功");
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public RequestResult updatePrintCard(ExaminationRecord examinationRecord) {

        ExaminationRecord record = get(examinationRecord.getId());

        if (ExaminationRecordConstant.STATUS50.equals(record.getStatus())) {
            return RequestResult.generate(2, "体检记录已经制证状态，无需重复设置。");
        }

        //未体检状态才允许修改
        if (!ExaminationRecordConstant.STATUS40.equals(record.getStatus())&&!ExaminationRecordConstant.STATUS45.equals(record.getStatus())) {
            return RequestResult.generate(10, "体检记录的状态必须是合格才允许制证。");
        }

        // 获取可制证数量
        ZhizhengAddRecord zzrecord = zhizhengAddRecordService.getLastRecord();
        Integer resultCount = 0;
        if(zzrecord!=null) {
            resultCount = zzrecord.getResultCount();
        }
        if(resultCount<=0){
            return RequestResult.generate(20,"可制证数量为0，可不制证");
        }

        // 可制证数量减1
        String ownerId= UserUtils.getUser().getCompany().getId();
        zhizhengAddRecordService.decrementZhizhengCount(ownerId);

        dao.updatePrintCard(examinationRecord.getId());

        // 返回执行成功
        return RequestResult.generate(1, "体检记录制证成功");
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public RequestResult saveRecord(ExaminationRecord examinationRecord) {
        //验证用户名、身份证号是否与系统数据一致

        if (StringUtils.isNotBlank(examinationRecord.getId())) {
            if (examinationRecord == null || "1".equals(examinationRecord.getDelFlag())) {
                return RequestResult.generate(210,"该体检记录已经删除，不可执行修改操作。");
            }

            //未体检状态才允许修改
            if (!ExaminationRecordConstant.STATUS0.equals(examinationRecord.getStatus())) {
                return RequestResult.generate(220,"未体检状态才可以修改，该体检记录不允许修改");
            }
        }

        // 根据登记信息，获取体检用户，5月15日前，用户先创建，后进行信息登记，之后需要增加登记的同时创建用户的功能。
        ExaminationUser examinationUser = null;
        if (StringUtils.isNotBlank(examinationRecord.getUser().getId())) {
            examinationUser = examinationUserService.get(examinationRecord.getUser().getId());
            if (examinationUser == null) {
                return RequestResult.generate(230,"您当前选择的用户信息，未能获得该用户的信息");
            }
        }
        super.save(examinationRecord);

        // 获取条码生成 和 打印 阶段
        Integer sampleCodeCreatePoint = GlobalSetUtils.getGlobalSet().getSampleCodeCreatePoint();
        Integer sampleCodePrintPoint = GlobalSetUtils.getGlobalSet().getSampleCodePrintPoint();


        /**
         * 保存检查项目
         * 1 读取现有的项目，
         * 2 获得本次设置的项目
         * 3 循环比对并保存
         *
         */
        List<ExaminationRecordItem> currRecordItems=examinationRecord.getItems();

        // 打算保存的
        List<ExaminationItem> savingItems = new ArrayList();

        List<ExaminationRecordItem> lst = examinationRecord.getExaminationRecordItemList();

        for(ExaminationRecordItem savingItem:lst){
            ExaminationItem item = examinationItemService.get(savingItem.getItemId());
            if(item!=null){
                savingItems.add(item);
            }
        }

        // 循環比对，目前存在的，是否不存在需要剔除了。
        for(ExaminationRecordItem currItem:currRecordItems){
            // 已经处理的，就不能删除了
            if(currItem.getGrabSample()||!StringUtils.isEmpty(currItem.getResultFlag())){
                continue;
            }

            // 如果不是最后一次的，也不处理
            if("0".equals(currItem.getLastFlag())){
                continue;
            }

            // 从要保存的记录里查查，是否已经在当前的记录里面不存在了。 。
            ExaminationItem sameItem=null;

            for (ExaminationItem savingItem : savingItems) {
                if (savingItem.getId().equals(currItem.getItemId())) {
                    sameItem = savingItem;
                    break;
                }
            }


            // 1 如果不存在，就把当前这条记录删除；2 如果存在，就将要保持的这条记录剔除不做处理
            if(sameItem==null){
                examinationRecordItemService.delete(currItem);
            }else{
                savingItems.remove(sameItem);
            }
        }

        // savingItems 中剩下的都是要添加到记录中的
        for(ExaminationItem savingItem:savingItems){
            ExaminationRecordItem item=new ExaminationRecordItem();
            item.setRecordId(examinationRecord.getId());

            item.setItemId(savingItem.getId());
            item.setItemName(savingItem.getName());
            item.setExaminationFlag("1");//初检
            item.setNeedSamples(savingItem.getNeedSamples());
            item.setSpecimenId(savingItem.getSpecimenId());
            item.setLastFlag("1");

            // 设置采样部门
            if("1".equals(savingItem.getNeedSamples())){
                String specimentId=savingItem.getSpecimenId();
                Specimen specimen=specimenService.get(specimentId);
                if(specimen!=null){
                    item.setGrabSampleDeptId(specimen.getGrabDeptId());
                }
            }

            // 设置录入结果部门
            item.setRecordResultDeptId(savingItem.getResultDeptId());

            // 如果在 体检编号 在 创建体检记录的时候 生成
            if(sampleCodeCreatePoint==1&&"1".equals(savingItem.getNeedSamples())){
                if(savingItem.getCodeType()==0){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yy}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }
                if(savingItem.getCodeType()==1){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yyMM}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }
                if(savingItem.getCodeType()==2){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yyMMdd}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }


            }

            examinationRecordItemService.save(item);
        }

        return RequestResult.generate(1,"保存成功",examinationRecord);
    }

//    @Transactional(readOnly = false)
//    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
//    public void refreshStatus(String recordId) {
//        if (StringUtils.isBlank(recordId)) {
//            return;
//        }
//
//        //不存在或已删除不处理
//        ExaminationRecord record = get(recordId);
//        if (record == null || "1".equals(record.getDelFlag())) {
//            return;
//        }
//
//        //已制证返回不处理
//        if (ExaminationRecordConstant.STATUS50.equals(record.getStatus())) {
//            return;
//        }
//
//        //未体检完数量
//        int count10 = 0;
//        //体检不合格数量
//        int count20 = 0;
//        //复检合格数量
//        int count30 = 0;
//        //初检合格数量
//        int count40 = 0;
//
//
//        //查询出所有检查项目
//        ExaminationRecordItem recordItem = new ExaminationRecordItem();
//        recordItem.setRecordId(recordId);
//        recordItem.setLastFlag("1");
//        recordItem.setDelFlag(ExaminationRecordItem.DEL_FLAG_NORMAL);
//        List<ExaminationRecordItem> itemList = examinationRecordItemService.findList(recordItem);
//        for (int i = 0; i < itemList.size(); i++) {
//            recordItem = itemList.get(i);
//            if (StringUtils.isBlank(recordItem.getResultDictId())) {  //未录入项目体检结果
//                count10++;
//            } else {
//                if ("1".equals(recordItem.getResultFlag())) {  //合格
//                    //初检合格
//                    if ("1".equals(recordItem.getExaminationFlag())) {
//                        count40++;
//                    } else {  //复检合格
//                        count30++;
//                    }
//                } else {  //不合格
//                    count20++;
//                }
//            }
//        }
//
//        String status = null;
//        if (count10 > 0) {    //未体检完
//            if (count10 == itemList.size()) {   //未体检
//                status = ExaminationRecordConstant.STATUS0;
//            } else {  //未体检完
//                status = ExaminationRecordConstant.STATUS10;
//            }
//
//        } else if (count20 > 0) {  //体检不合格
//            status = ExaminationRecordConstant.STATUS20;
//        } else if (count30 > 0) {  //复检合格
//            status = ExaminationRecordConstant.STATUS30;
//        } else {  //初检合格，可制证
//            status = ExaminationRecordConstant.STATUS40;
//        }
//
//        this.updateRecordStatus(recordId, status);
//    }

    /**
     * 更新状态，只需要id
     */
    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public void updateStatus(ExaminationRecord record) {

        ExaminationRecordItem eriTmp = new ExaminationRecordItem();
        eriTmp.setRecordId(record.getId());

        // 还没有体检结果的数量
        int cntNoResult = examinationRecordItemService.countNoResult(eriTmp);

        // 体检中
        if (cntNoResult > 0) {
            record.setStatus(ExaminationRecordConstant.STATUS10);
        } else {
            // 没通过的数量
            int cntNotOk = examinationRecordItemService.countNotOk(eriTmp);
            // 进入复检阶段的数量
            int cntExamFlag2 = examinationRecordItemService.countExamFlag2(eriTmp);

            // 全部都通过了
            if (cntNotOk == 0) {
                if (cntExamFlag2 == 0) {
                    // 初检合格
                    record.setStatus(ExaminationRecordConstant.STATUS40);
                } else {
                    // 复检合格
                    record.setStatus(ExaminationRecordConstant.STATUS45);
                }
                record.setZhizhengTime(new java.util.Date());

            }
            // 存在体检不合格的问题
            else {
                if (cntExamFlag2 == 0) {
                    // 初检不合格
                    record.setStatus(ExaminationRecordConstant.STATUS20);
                } else {
                    // 复检不合格
                    record.setStatus(ExaminationRecordConstant.STATUS30);
                }
            }
        }

        save(record);
    }

    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public RequestResult startFujian(ExaminationRecord examinationRecord) {
        if(examinationRecord==null || StringUtils.isBlank(examinationRecord.getId())){
            return RequestResult.generateFailResult("复检记录错误");
        }
        examinationRecord = get(examinationRecord.getId());
        if (examinationRecord==null
                || (!ExaminationRecordConstant.STATUS20.equals(examinationRecord.getStatus())
                && !ExaminationRecordConstant.STATUS30.equals(examinationRecord.getStatus()))){
            return RequestResult.generateFailResult("复检记录错误");
        }
        // 1 获得不合格的，Last的 体检项目；
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(examinationRecord.getId());
        recordItem.setLastFlag("1");
        recordItem.setResultFlag("0");
        List<ExaminationRecordItem> recordItemList = examinationRecordItemService.findList(recordItem);
        // 2 复制每个不合格的体检项目，设置为非last的状态，并保存到 ExaminationRecoredItem中
        for (ExaminationRecordItem item:recordItemList) {
            examinationRecordItemService.updateLastFlag(item.getId(),"0");
        }
        //从不合格的ExaminationRecordItem里获取不合格的item的id 然后通过item 的id 查询出此项目复检时需要的 体检的项目
        List<String> fujianItemlist=new  ArrayList<String> ();
        for(int i=0;i<recordItemList.size();i++ ){
            ExaminationItem examinationItem=examinationItemService.get(recordItemList.get(i).getItemId());
            String [] fujianItems=examinationItem.getFlagItemId().split(",");
            for(int j=0;j<fujianItems.length;j++){
                if(!fujianItems[j].equals("")) {
                    if (fujianItemlist.lastIndexOf(fujianItems[j]) == -1) {
                        fujianItemlist.add(fujianItems[j]);
                    }
                }
            }
         }
         //查出需要复检的项目
        List<ExaminationItem> savingItems = new ArrayList();
        for(int i=0;i<fujianItemlist.size();i++){
            savingItems.add(examinationItemService.get(fujianItemlist.get(i)));
        }
        // savingItems 中剩下的都是要添加到记录中的
        for(ExaminationItem savingItem:savingItems){
            ExaminationRecordItem item=new ExaminationRecordItem();
            item.setRecordId(examinationRecord.getId());

            item.setItemId(savingItem.getId());
            item.setItemName(savingItem.getName());
            item.setExaminationFlag("1");//初检
            item.setNeedSamples(savingItem.getNeedSamples());
            item.setSpecimenId(savingItem.getSpecimenId());
            item.setLastFlag("1");

            // 设置采样部门
            if("1".equals(savingItem.getNeedSamples())){
                String specimentId=savingItem.getSpecimenId();
                Specimen specimen=specimenService.get(specimentId);
                if(specimen!=null){
                    item.setGrabSampleDeptId(specimen.getGrabDeptId());
                }
            }

            // 设置录入结果部门
            item.setRecordResultDeptId(savingItem.getResultDeptId());

            // 如果在 体检编号 在 创建体检记录的时候 生成
                 if(savingItem.getCodeType()==0){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yy}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }
                if(savingItem.getCodeType()==1){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yyMM}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }
                if(savingItem.getCodeType()==2){
                    String exp = UserUtils.getUser().getCompany().getId()+"{yyMMdd}[6]";
                    String sampleCode = SysSequenceUtils.nextSequence(exp);
                    item.setSampleCode(sampleCode);
                }


            examinationRecordItemService.save(item);
        }

      /*  // 3 设置每个不合格的项目 sample_code 、result_flag 为 null   examinstaion_flag 为复检 并保存。
        for (ExaminationRecordItem item:recordItemList) {
            item.setId(null);
            item.setSampleCode(null);
            item.setResultDictId(null);
            item.setResultDictName(null);
            item.setResultRemarks(null);
            item.setResultFlag(null);
            item.setExaminationFlag("2");
            item.setLastFlag("1");
            examinationRecordItemService.save(item);
        }*/

        // 4 刷新体检记录的状态。
        this.updateStatus(examinationRecord);

        return RequestResult.generateSuccessResult("启动复检成功");
    }

    public List<ExaminationRecord> listByIds(String[] ids) {
        List<ExaminationRecord> lst=new ArrayList();
        if(ids!=null) {
            for (String id : ids) {
                ExaminationRecord er = get(id);
                if (er != null) {
                    lst.add(er);
                }
            }
        }
        return lst;
    }

    public Page<ExaminationRecord> tongji2(Page<ExaminationRecord> page, ExaminationRecord examinationRecord,String beginDate,String endDate,String organ) {

        examinationRecord.setPage(page);
        page.setList(dao.tongji2(beginDate,endDate,organ));
        return page;
    }
    public Page<ExaminationRecord> tongji4(Page<ExaminationRecord> page, ExaminationRecord examinationRecord,String beginDate,String endDate,String organ,String state) {

        examinationRecord.setPage(page);
        page.setList(dao.tongji4(beginDate,endDate,organ,state));
        return page;
    }
}
