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

    //@Cacheable(value = "examinationRecordCache",key="'examinationRecord_get_'+#id")
    public ExaminationRecord get(String id) {
        ExaminationRecord examinationRecord = super.get(id);
        return examinationRecord;
    }

    //@Cacheable(value = "examinationRecordCache",key="'examinationRecord_getByCode_'+#examinationRecord.code")
    public ExaminationRecord getByCode(ExaminationRecord examinationRecord) {
        examinationRecord = this.dao.getByCode(examinationRecord);
        return examinationRecord;
    }

    public Map getMapByCode4Result(String code, String examinationFlag) {
        if (StringUtils.isBlank(code)) {
            new HashMap<String, Object>();
        }

        Map map = this.dao.getMapByCode(code);
        if (map != null && map.containsKey("id")) {
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(map.get("id").toString());
            recordItem.setExaminationFlag(examinationFlag);
            List<ExaminationRecordItem> recordItems = examinationRecordItemService.findList(recordItem);
            List<Map<String, Object>> examinationRecordItemList = new ArrayList<Map<String, Object>>();
            Map<String, Object> itemMap = null;
            ExaminationResultDict examinationResultDict = new ExaminationResultDict();
            if (recordItems != null && recordItems.size() > 0) {
                for (ExaminationRecordItem recordItem1 : recordItems) {
                    itemMap = new HashMap<String, Object>();
                    itemMap.put("recordItemId", recordItem1.getId());
                    itemMap.put("itemId", recordItem1.getItemId());
                    itemMap.put("itemName", recordItem1.getItemName());
                    itemMap.put("needSamples", recordItem1.getNeedSamples());
                    itemMap.put("sampleCode", recordItem1.getSampleCode());
                    itemMap.put("resultDictId", recordItem1.getResultDictId());
                    itemMap.put("examinationFlag", recordItem1.getExaminationFlag());
                    //项目结果字典
                    examinationResultDict.setItemId(recordItem1.getItemId());
                    List<ExaminationResultDict> dictList = resultDictService.findList(examinationResultDict);

                    itemMap.put("dictList", dictList);
                    examinationRecordItemList.add(itemMap);
                }
            }

            map.put("examinationRecordItemList", examinationRecordItemList);
        }

        return map;
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
//                if (StringUtils.isBlank(examinationRecordItem.getId())) {
//                    examinationRecordItem.setRecordId(examinationRecord.getId());
//                    examinationRecordItem.preInsert();
//                    examinationRecordItemService.save(examinationRecordItem);
//                } else {
//                    examinationRecordItem.preUpdate();
//                    examinationRecordItemService.save(examinationRecordItem);
//                }
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
    public ResponseResult delRecord(ExaminationRecord examinationRecord) {


        ExaminationRecord record = get(examinationRecord.getId());
        //未体检状态才允许修改
        if (!ExaminationRecordConstant.STATUS0.equals(record.getStatus())) {
            return ResponseResult.generate("10", "未体检状态才可以删除，该体检记录不允许删除");
        }

        super.delete(examinationRecord);
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(examinationRecord.getId());
        examinationRecordItemService.delete(recordItem);

        // 返回执行成功
        return ResponseResult.generate("0", "删除成功");
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

        // 无意义，登记的信息允许修改
//        //if (examinationUser != null) {
//        if (!examinationRecord.getIdNumber().equals(examinationUser.getIdNumber())) {
//            resultMessages.add("身份证与体检用户内记录信息不一致");
//            return ResponseResult.generateFailResult("用户信息错误", resultMessages);
//        }
//        if (!examinationRecord.getName().equals(examinationUser.getName())) {
//            resultMessages.add("名称与体检用户内记录信息不一致");
//            return ResponseResult.generateFailResult("用户信息错误", resultMessages);
//        }
//        if (!examinationRecord.getSex().equals(examinationUser.getSex())) {
//            resultMessages.add("性别与体检用户内记录的信息不一致");
//            return ResponseResult.generateFailResult("用户信息错误", resultMessages);
//        }

        super.save(examinationRecord);

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
            if(!StringUtils.isEmpty(currItem.getSampleCode())||!StringUtils.isEmpty(currItem.getResultFlag())){
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

            examinationRecordItemService.save(item);
        }


//        List<String> itemIdList = new ArrayList<String>();
//        //若选择了套餐，则以套餐为准
//        if (StringUtils.isNotBlank(examinationRecord.getPackageId())) {
//            //清除原有体检项目
//            ExaminationRecordItem recordItem = new ExaminationRecordItem();
//            recordItem.setRecordId(examinationRecord.getId());
//            examinationRecordItemDao.delete(recordItem);
//
//            //保存现有体检项目
//            List<ExaminationItem> itemList = examinationItemService.findListByPackage(examinationRecord.getPackageId());
//            for (ExaminationItem examinationItem : itemList) {
//                itemIdList.add(examinationItem.getId());
//
//                recordItem = new ExaminationRecordItem();
//                recordItem.setRecordId(examinationRecord.getId());
//                recordItem.setItemId(examinationItem.getId());
//                recordItem.setItemName(examinationItem.getName());
//                recordItem.setExaminationFlag("1");//初检
//                recordItem.setNeedSamples(examinationItem.getNeedSamples());
//                recordItem.setSpecimenId(examinationItem.getSpecimenId());
//                recordItem.setLastFlag("1");
//                recordItem.preInsert();
//                examinationRecordItemDao.insert(recordItem);
//            }
//        } else {
//            //自由选择体检项目
//            ExaminationItem examinationItem = null;
//            for (ExaminationRecordItem recordItem : examinationRecord.getItems()) {
//                if (recordItem.getId() == null) {
//                    continue;
//                }
//                if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(recordItem.getDelFlag())) {
//                    if (StringUtils.isBlank(recordItem.getId())) {
//                        recordItem.setRecordId(examinationRecord.getId());
//                        examinationItem = examinationItemService.get(recordItem.getId());
//                        if (examinationItem != null) {
//                            recordItem.setItemName(examinationItem.getName());
//                        }
//                        recordItem.setExaminationFlag("1");//初检
//                        recordItem.setNeedSamples(examinationItem.getNeedSamples());
//                        recordItem.setSpecimenId(examinationItem.getSpecimenId());
//                        recordItem.setLastFlag("1");
//                        recordItem.preInsert();
//                        examinationRecordItemDao.insert(recordItem);
//                    } else {
//                        recordItem.preUpdate();
//                        examinationRecordItemDao.update(recordItem);
//                    }
//                } else {
//                    examinationRecordItemDao.delete(recordItem);
//                }
//            }
//        }


        return RequestResult.generate(1,"保存成功",examinationRecord);
    }

//    @Transactional(readOnly = false)
//    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
//    public ResponseResult saveResult(String[] recordItemIds, String[] resultDictIds, String[] remarksArray) {
//        if (recordItemIds == null || recordItemIds.length < 1) {
//            return ResponseResult.generateFailResult("体检项目数据错误");
//        }
//        ExaminationResultDict resultDict = null;
//        ExaminationRecordItem recordItem = null;
//        for (int i = 0; i < recordItemIds.length; i++) {
//            recordItem = examinationRecordItemService.get(recordItemIds[i]);
//            if (recordItem == null) {
//                continue;
//            }
//            resultDict = resultDictService.get(resultDictIds[i]);
//            if (resultDict == null) {
//                continue;
//            }
//            examinationRecordItemService.saveRecordResult(recordItemIds[i], null, resultDictIds[i], resultDict.getName(), resultDict.getFlag(), remarksArray[i]);
//
//            //如果涉及样本，则同步更新样本的检验结果
//            if (StringUtils.isNotBlank(recordItem.getSampleCode())) {
//                examinationSamplesDao.updateResultByCode(recordItem.getSampleCode(), resultDict.getId(), resultDict.getFlag(), remarksArray[i]);
//            }
//        }
//
//        //刷新体检记录状态
//        if (recordItem != null) {
//            refreshStatus(recordItem.getRecordId());
//        }
//
//        ResponseResult responseResult = ResponseResult.generateSuccessResult("保存成功");
//        return responseResult;
//    }


    public List<ExaminationRecord> getList4Result(String startDate, String endDate, String examinationCode, String organId) {
        List<ExaminationRecord> recordList = this.dao.getList4Result(startDate, endDate, examinationCode, organId);
        return recordList;
    }


    public List<Map> getList4CertForm(String startDate, String endDate
            , String code, String organId, String name, String status) {
        List<Map> recordList = this.dao.getList4CertForm(startDate, endDate, code, organId, name, status);
        return recordList;
    }

    public List<Map> getItemListMap4Result(String recordId) {
        List<Map> mapList = new ArrayList<Map>();
        if (StringUtils.isBlank(recordId)) {
            return mapList;
        }
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(recordId);
        recordItem.setDelFlag(ExaminationRecordItem.DEL_FLAG_NORMAL);
//                recordItem.setExaminationFlag(examinationFlag);
        List<ExaminationRecordItem> recordItems = examinationRecordItemService.findList(recordItem);
        if (recordItems == null) {
            return mapList;
        }
        Map itemMap = null;
        ExaminationResultDict examinationResultDict = new ExaminationResultDict();
        for (ExaminationRecordItem recordItem1 : recordItems) {
            itemMap = new HashMap();
            itemMap.put("recordItem", recordItem1);

            //项目结果字典
            examinationResultDict.setItemId(recordItem1.getItemId());
            examinationResultDict.setDelFlag(ExaminationResultDict.DEL_FLAG_NORMAL);
            List<ExaminationResultDict> dictList = resultDictService.findList(examinationResultDict);

            itemMap.put("resultDictList", dictList);

            itemMap.put("recordId", recordId);

            mapList.add(itemMap);

        }

        return mapList;
    }


    @Transactional(readOnly = false)
    //@CacheEvict(value = "examinationRecordCache",allEntries = true)
    public void refreshStatus(String recordId) {
        if (StringUtils.isBlank(recordId)) {
            return;
        }

        //不存在或已删除不处理
        ExaminationRecord record = get(recordId);
        if (record == null || "1".equals(record.getDelFlag())) {
            return;
        }

        //已制证返回不处理
        if (ExaminationRecordConstant.STATUS50.equals(record.getStatus())) {
            return;
        }

        //未体检完数量
        int count10 = 0;
        //体检不合格数量
        int count20 = 0;
        //复检合格数量
        int count30 = 0;
        //初检合格数量
        int count40 = 0;


        //查询出所有检查项目
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(recordId);
        recordItem.setLastFlag("1");
        recordItem.setDelFlag(ExaminationRecordItem.DEL_FLAG_NORMAL);
        List<ExaminationRecordItem> itemList = examinationRecordItemService.findList(recordItem);
        for (int i = 0; i < itemList.size(); i++) {
            recordItem = itemList.get(i);
            if (StringUtils.isBlank(recordItem.getResultDictId())) {  //未录入项目体检结果
                count10++;
            } else {
                if ("1".equals(recordItem.getResultFlag())) {  //合格
                    //初检合格
                    if ("1".equals(recordItem.getExaminationFlag())) {
                        count40++;
                    } else {  //复检合格
                        count30++;
                    }
                } else {  //不合格
                    count20++;
                }
            }
        }

        String status = null;
        if (count10 > 0) {    //未体检完
            if (count10 == itemList.size()) {   //未体检
                status = ExaminationRecordConstant.STATUS0;
            } else {  //未体检完
                status = ExaminationRecordConstant.STATUS10;
            }

        } else if (count20 > 0) {  //体检不合格
            status = ExaminationRecordConstant.STATUS20;
        } else if (count30 > 0) {  //复检合格
            status = ExaminationRecordConstant.STATUS30;
        } else {  //初检合格，可制证
            status = ExaminationRecordConstant.STATUS40;
        }

        this.updateRecordStatus(recordId, status);
    }

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
    public ResponseResult startFujian(ExaminationRecord examinationRecord) {
        if(examinationRecord==null || StringUtils.isBlank(examinationRecord.getId())){
            return ResponseResult.generateFailResult("复检记录错误");
        }
        examinationRecord = get(examinationRecord.getId());
        if (examinationRecord==null
                || (!ExaminationRecordConstant.STATUS20.equals(examinationRecord.getStatus())
                && !ExaminationRecordConstant.STATUS30.equals(examinationRecord.getStatus()))){
            return ResponseResult.generateFailResult("复检记录错误");
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

        // 3 设置每个不合格的项目 sample_code 、result_flag 为 null   examinstaion_flag 为复检 并保存。
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
        }

        // 4 刷新体检记录的状态。
        this.updateStatus(examinationRecord);

        return ResponseResult.generateSuccessResult("启动复检成功");
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
}
