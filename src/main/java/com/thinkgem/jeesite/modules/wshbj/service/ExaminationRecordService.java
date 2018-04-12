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
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;
import com.thinkgem.jeesite.modules.wshbj.entity.*;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import org.springframework.web.bind.annotation.RequestParam;

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
    private ExaminationRecordItemDao examinationRecordItemDao;
    @Autowired
    private ExaminationUserService examinationUserService;
    @Autowired
    private ExaminationItemService examinationItemService;
    @Autowired
    private ExaminationResultDictService resultDictService;
    @Autowired
    private ExaminationSamplesDao examinationSamplesDao;

    public ExaminationRecord get(String id) {
        ExaminationRecord examinationRecord = super.get(id);
        if (examinationRecord != null) {
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(id);
            examinationRecord.setExaminationRecordItemList(examinationRecordItemDao.findList(recordItem));
        }

        return examinationRecord;
    }

    public ExaminationRecord getByCode(String code) {
        ExaminationRecord examinationRecord = this.dao.getByCode(code);
        if (examinationRecord != null) {
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(examinationRecord.getId());
            examinationRecord.setExaminationRecordItemList(examinationRecordItemDao.findList(recordItem));
        }

        return examinationRecord;
    }

    public Map getMapByCode(String code) {
        if (StringUtils.isBlank(code)){
            new HashMap<String,Object>();
        }

        Map map = this.dao.getMapByCode(code);
        if (map!=null && map.containsKey("id")){
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(map.get("id").toString());
            map.put("examinationRecordItemList",examinationRecordItemDao.findList(recordItem));
        }

        return map;
    }

    public Map getMapByCode4Result(String code,String examinationFlag) {
        if (StringUtils.isBlank(code)){
            new HashMap<String,Object>();
        }

        Map map = this.dao.getMapByCode(code);
        if (map!=null && map.containsKey("id")){
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(map.get("id").toString());
            recordItem.setExaminationFlag(examinationFlag);
            List<ExaminationRecordItem> recordItems = examinationRecordItemDao.findList(recordItem);
            List<Map<String,Object>> examinationRecordItemList = new ArrayList<Map<String, Object>>();
            Map<String,Object> itemMap= null;
            ExaminationResultDict examinationResultDict = new ExaminationResultDict();
            if (recordItems!=null && recordItems.size()>0){
                for (ExaminationRecordItem recordItem1:recordItems) {
                    itemMap = new HashMap<String,Object>();
                    itemMap.put("recordItemId",recordItem1.getId());
                    itemMap.put("itemId",recordItem1.getItemId());
                    itemMap.put("itemName",recordItem1.getItemName());
                    itemMap.put("needSamples",recordItem1.getNeedSamples());
                    itemMap.put("sampleCode",recordItem1.getSampleCode());
                    itemMap.put("resultDictId",recordItem1.getResultDictId());
                    itemMap.put("examinationFlag",recordItem1.getExaminationFlag());
                    //项目结果字典
                    examinationResultDict.setItemId(recordItem1.getItemId());
                    List<ExaminationResultDict> dictList = resultDictService.findList(examinationResultDict);

                    itemMap.put("dictList",dictList);
                    examinationRecordItemList.add(itemMap);
                }
            }

            map.put("examinationRecordItemList",examinationRecordItemList);
        }

        return map;
    }

    public List<ExaminationRecord> findList(ExaminationRecord examinationRecord) {
        return super.findList(examinationRecord);
    }

    public Page<ExaminationRecord> findPage(Page<ExaminationRecord> page, ExaminationRecord examinationRecord) {
        return super.findPage(page, examinationRecord);
    }

    @Transactional(readOnly = false)
    public void save(ExaminationRecord examinationRecord) {
        super.save(examinationRecord);
        for (ExaminationRecordItem examinationRecordItem : examinationRecord.getExaminationRecordItemList()) {
            if (examinationRecordItem.getId() == null) {
                continue;
            }
            if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(examinationRecordItem.getDelFlag())) {
                if (StringUtils.isBlank(examinationRecordItem.getId())) {
                    examinationRecordItem.setRecordId(examinationRecord.getId());
                    examinationRecordItem.preInsert();
                    examinationRecordItemDao.insert(examinationRecordItem);
                } else {
                    examinationRecordItem.preUpdate();
                    examinationRecordItemDao.update(examinationRecordItem);
                }
            } else {
                examinationRecordItemDao.delete(examinationRecordItem);
            }
        }
    }

    @Transactional(readOnly = false)
    public void delete(ExaminationRecord examinationRecord) {
        super.delete(examinationRecord);
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(examinationRecord.getId());
        examinationRecordItemDao.delete(recordItem);
    }


    @Transactional(readOnly = false)
    public ResponseResult saveRecord(ExaminationRecord examinationRecord) {
        //验证用户名、身份证号是否与系统数据一致

        List<String> resultMessages = Lists.newArrayList();
        resultMessages.add("数据验证失败：");
        ExaminationUser examinationUser = null;
        if (StringUtils.isNotBlank(examinationRecord.getUser().getId())) {
            examinationUser = examinationUserService.get(examinationRecord.getUser().getId());
            if (examinationUser == null) {
                resultMessages.add("体检用户信息错误");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }
        }

        //
        if (examinationUser != null) {
            if (!examinationRecord.getIdNumber().equals(examinationUser.getIdNumber())) {
                resultMessages.add("身份证与系统内信息不一致");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }
            if (!examinationRecord.getName().equals(examinationUser.getName())) {
                resultMessages.add("名称与系统内信息不一致");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }
            if (!examinationRecord.getSex().equals(examinationUser.getSex())) {
                resultMessages.add("性别与系统内信息不一致");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }
            if (!examinationRecord.getBirthday().equals(examinationUser.getBirthday())) {
                resultMessages.add("出生日期与系统内信息不一致");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }
        } else {
            //验证是否存在相同身份证用户
            examinationUser = examinationUserService.getByIdNumberAndOwner(examinationRecord.getIdNumber(), examinationRecord.getOwner());
            if (examinationUser != null) {
                resultMessages.add("系统内已存在该身份证信息，请选择用户或进行身份证核实");
                return ResponseResult.generateFailResult("用户信息错误", resultMessages);
            }

            //将用户信息保存至数据库
            examinationUser = new ExaminationUser();
            examinationUser.setName(examinationRecord.getName());
            examinationUser.setIdNumber(examinationRecord.getIdNumber());
            examinationUser.setPhoneNumber(examinationRecord.getPhoneNumber());
            examinationUser.setSex(examinationRecord.getSex());
            examinationUser.setIndustryId(examinationRecord.getIndustryId());
            examinationUser.setPostId(examinationRecord.getPostId());
            examinationUser.setOrganId(examinationRecord.getOrganId());
            examinationUser.setBirthday(examinationRecord.getBirthday());
            examinationUser.setOwner(UserUtils.getUser().getCompany().getId());

            examinationUserService.save(examinationUser);
        }
        //未体检
        examinationRecord.setStatus("1");
        super.save(examinationRecord);

        /**
         * 保存检查项目
         */
        List<String> itemIdList = new ArrayList<String>();
        //若选择了套餐，则以套餐为准
        if (StringUtils.isNotBlank(examinationRecord.getPackageId())){
            //清除原有体检项目
            ExaminationRecordItem recordItem = new ExaminationRecordItem();
            recordItem.setRecordId(examinationRecord.getId());
            examinationRecordItemDao.delete(recordItem);

            //保存现有体检项目
            List<ExaminationItem> itemList = examinationItemService.findListByPackage(examinationRecord.getPackageId());
            for (ExaminationItem examinationItem:itemList ) {
                itemIdList.add(examinationItem.getId());

                recordItem = new ExaminationRecordItem();
                recordItem.setRecordId(examinationRecord.getId());
                recordItem.setItemId(examinationItem.getId());
                recordItem.setItemName(examinationItem.getName());
                recordItem.setExaminationFlag("1");//初检
                recordItem.setNeedSamples(examinationItem.getNeedSamples());
                recordItem.preInsert();
                examinationRecordItemDao.insert(recordItem);
            }
        }else{
            //自由选择体检项目
            ExaminationItem examinationItem = null;
            for (ExaminationRecordItem recordItem : examinationRecord.getExaminationRecordItemList()) {
                if (recordItem.getId() == null) {
                    continue;
                }
                if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(recordItem.getDelFlag())) {
                    if (StringUtils.isBlank(recordItem.getId())) {
                        recordItem.setRecordId(examinationRecord.getId());
                        examinationItem = examinationItemService.get(recordItem.getId());
                        if (examinationItem!=null){
                            recordItem.setItemName(examinationItem.getName());
                        }
                        recordItem.setExaminationFlag("1");//初检
                        recordItem.setNeedSamples(examinationItem.getNeedSamples());
                        recordItem.preInsert();
                        examinationRecordItemDao.insert(recordItem);
                    } else {
                        recordItem.preUpdate();
                        examinationRecordItemDao.update(recordItem);
                    }
                } else {
                    examinationRecordItemDao.delete(recordItem);
                }
            }
        }


        resultMessages.remove(0);
        resultMessages.add("保存成功");
        return ResponseResult.generateSuccessResult("保存成功", resultMessages);
    }

    @Transactional(readOnly = false)
    public String genCode() {
        try {
            String year = DateUtils.getYear().substring(2);
            String keyCode = UserUtils.getUser().getCompany().getCode() + year;
            return this.dao.genCode(keyCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    @Transactional(readOnly = false)
    public ResponseResult saveResult(String[] recordItemIds, String[] resultDictIds, String[] remarksArray) {
        if(recordItemIds==null || recordItemIds.length<1){
            return ResponseResult.generateFailResult("体检项目数据错误");
        }
        ExaminationResultDict resultDict = null;
        ExaminationRecordItem recordItem = null;
        for (int i = 0; i < recordItemIds.length; i++) {
            recordItem = examinationRecordItemDao.get(recordItemIds[i]);
            if (recordItem==null){
                continue;
            }
            resultDict = resultDictService.get(resultDictIds[i]);
            if (resultDict==null){
                continue;
            }
            examinationRecordItemDao.saveRecordResult(recordItemIds[i],null,resultDictIds[i],resultDict.getName(),resultDict.getFlag(), remarksArray[i]);

            //如果涉及样本，则同步更新样本的检验结果
            if(StringUtils.isNotBlank(recordItem.getSampleCode())){
                examinationSamplesDao.updateResultByCode(recordItem.getSampleCode(),resultDict.getId(),resultDict.getFlag(),remarksArray[i]);
            }
        }

        if (recordItem!=null){
            refreshStatus(recordItem.getRecordId());
        }

        ResponseResult responseResult = ResponseResult.generateSuccessResult("保存成功");
        return responseResult;
    }


    public List<ExaminationRecord> getList4Result(String startDate,String endDate,String examinationCode,String organId) {
        List<ExaminationRecord> recordList = this.dao.getList4Result(startDate,endDate,examinationCode,organId);
        return recordList;
    }


    public List<Map> getItemListMap4Result(String recordId) {
        List<Map> mapList = new ArrayList<Map>();
        if (StringUtils.isBlank(recordId)){
            return mapList;
        }
        ExaminationRecordItem recordItem = new ExaminationRecordItem();
        recordItem.setRecordId(recordId);
        recordItem.setDelFlag(ExaminationRecordItem.DEL_FLAG_NORMAL);
//                recordItem.setExaminationFlag(examinationFlag);
        List<ExaminationRecordItem> recordItems = examinationRecordItemDao.findList(recordItem);
        if(recordItems==null){
            return mapList;
        }
        Map itemMap = null;
        ExaminationResultDict examinationResultDict = new ExaminationResultDict();
        for (ExaminationRecordItem recordItem1: recordItems ) {
            itemMap = new HashMap();
            itemMap.put("recordItem",recordItem1);

            //项目结果字典
            examinationResultDict.setItemId(recordItem1.getItemId());
            examinationResultDict.setDelFlag(ExaminationResultDict.DEL_FLAG_NORMAL);
            List<ExaminationResultDict> dictList = resultDictService.findList(examinationResultDict);

            itemMap.put("resultDictList",dictList);
            mapList.add(itemMap);

        }

        return mapList;
    }


    @Transactional(readOnly = false)
    public void refreshStatus(String recordId){

    }
}