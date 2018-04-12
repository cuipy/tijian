/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationResultDict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationSamples;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationSamplesDao;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 体检样本Service
 * @author zhxl
 * @version 2018-03-25
 */
@Service
@Transactional(readOnly = true)
public class ExaminationSamplesService extends CrudService<ExaminationSamplesDao, ExaminationSamples> {

	@Autowired
	private ExaminationRecordItemDao recordItemDao;
	@Autowired
	private ExaminationResultDictService examinationResultDictService;

	public ExaminationSamples get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationSamples> findList(ExaminationSamples examinationSamples) {
		return super.findList(examinationSamples);
	}
	
	public Page<ExaminationSamples> findPage(Page<ExaminationSamples> page, ExaminationSamples examinationSamples) {
		return super.findPage(page, examinationSamples);
	}
	
	@Transactional(readOnly = false)
	public ResponseResult saveSamples(ExaminationSamples examinationSamples) {
        List<String> resultMessages = Lists.newArrayList();
        resultMessages.add("数据验证失败：");
        /**
         * 验证本次体检是否有通类型未录入检验结果采样
         */
        ExaminationSamples effectiveSamples = this.dao.getEffectiveSample(examinationSamples);
        if(effectiveSamples!=null){
            resultMessages.add("已录入该项目样本");
            return ResponseResult.generateFailResult("保存样本失败，已录入该项目样本", resultMessages);
        }

        effectiveSamples = this.dao.getByCode(examinationSamples.getCode());
        if(effectiveSamples!=null){
            resultMessages.add("已存在该编号样本");
            return ResponseResult.generateFailResult("保存样本失败，已存在该编号样本", resultMessages);
        }

		//保存样本信息到体检项目中
		ExaminationRecordItem recordItem = new ExaminationRecordItem();
		recordItem.setRecordId(examinationSamples.getRecordId());
		recordItem.setItemId(examinationSamples.getItemId());
		recordItem.setExaminationFlag(examinationSamples.getExaminationFlag());
		recordItem = recordItemDao.getEmptyResult(recordItem);
		if(recordItem==null){
			resultMessages.add("体检项目不存在");
			return ResponseResult.generateFailResult("保存样本失败，体检项目不存在", resultMessages);
		}
		recordItemDao.updateSampleCode(recordItem.getId(),examinationSamples.getCode());
		examinationSamples.setRecordItemId(recordItem.getId());
		super.save(examinationSamples);

        resultMessages.remove(0);
        resultMessages.add("保存成功");
        return ResponseResult.generateSuccessResult("保存成功", resultMessages);
	}


	@Transactional(readOnly = false)
	public void revoke(ExaminationSamples examinationSamples) {
		//撤销体检项目样本信息
		ExaminationRecordItem recordItem = new ExaminationRecordItem();
		recordItem.setRecordId(examinationSamples.getRecordId());
		recordItem.setItemId(examinationSamples.getItemId());
		recordItem.setExaminationFlag(examinationSamples.getExaminationFlag());
		recordItem = recordItemDao.getEmptyResult(recordItem);
		if(recordItem!=null){
			recordItemDao.revokeSampleCode(recordItem.getId());
		}

		super.delete(examinationSamples);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationSamples examinationSamples) {
		super.delete(examinationSamples);
	}

	protected ExaminationSamples refreshBean(ExaminationSamples examinationSamples) {

		return examinationSamples;
	}


	public List<Map> getListMap4Result(String startDate, String endDate, String startCode, String endCode, String orgId, String orgName,
							 String itemId, String sampleCode, String examinationCode) {

		List<Map> samplesList = this.dao.findMapList(startDate,endDate,startCode,endCode,orgId,orgName,itemId,sampleCode,examinationCode);
		if(samplesList!=null){
			ExaminationResultDict resultDict = null;
			for (Map map:samplesList) {
				resultDict = new ExaminationResultDict();
				resultDict.setItemId(map.get("itemId").toString());
				resultDict.setDelFlag(ExaminationResultDict.DEL_FLAG_NORMAL);
				//查询样本项目对应的结果字典
				List<ExaminationResultDict> dictList = examinationResultDictService.findList(resultDict);
				map.put("resultDictList",dictList);
			}
		}

		return samplesList;
	}

	/**
	* @author zhxl
	* @Description 保存样本检验结果
	* @Date 2018/4/12 23:02:43
	* @Param [samplesIdArray, resultDictIdArray, resultRemarksArray]
	* @return com.thinkgem.jeesite.common.bean.ResponseResult
	*/
    @Transactional(readOnly = false)
    public ResponseResult saveSamplesResult(String[] sampleIdArray,String[] resultDictIdArray
            ,String[] resultRemarksArray) {
        if(sampleIdArray==null || sampleIdArray.length<1){
            return ResponseResult.generateFailResult("样本数据错误");
        }

        ExaminationSamples examinationSamples = null;
        ExaminationResultDict resultDict = null;
        ExaminationRecordItem recordItem = null;
        for (int i=0;i<sampleIdArray.length;i++) {
            String sampleId = sampleIdArray[i];
            examinationSamples = get(sampleId);
            if (examinationSamples==null){
                continue;
            }
            resultDict = examinationResultDictService.get(resultDictIdArray[i]);
            if (resultDict==null){
                continue;
            }
            recordItem = recordItemDao.get(examinationSamples.getRecordItemId());
            if (recordItem==null){
                continue;
            }

            //样本中检验结果
            this.dao.updateResult(sampleId,resultDict.getId(),resultDict.getFlag(),resultRemarksArray[i]);

            //体检记录中检验结果
            recordItemDao.saveRecordResult(recordItem.getId(),examinationSamples.getCode(),resultDict.getId(),resultDict.getName(),resultDict.getFlag(),resultRemarksArray[i]);

        }

        return ResponseResult.generateSuccessResult("样本结果录入成功");
    }
}