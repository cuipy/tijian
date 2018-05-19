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
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
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

	@Autowired
	private ExaminationRecordService examinationRecordService;


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

		//体检记录处于未体检、体检不合格时才允许录入样本
		ExaminationRecord record = examinationRecordService.get(examinationSamples.getRecordId());
		if(record==null){
			resultMessages.add("体检记录错误");
			return ResponseResult.generateFailResult("保存样本失败，体检数据错误", resultMessages);
		}

		// 判断体检状态是否为可操作
		if(!ExaminationRecordConstant.STATUS10.equals(record.getStatus())&&!ExaminationRecordConstant.STATUS0.equals(record.getStatus())
				&&!ExaminationRecordConstant.STATUS20.equals(record.getStatus())&&!ExaminationRecordConstant.STATUS30.equals(record.getStatus())){
			resultMessages.add("该体检记录的状态值"+record.getStatus()+"不允许录入样本");
			return ResponseResult.generateFailResult("保存样本失败，该体检记录的状态值"+record.getStatus()+"不允许录入样本", resultMessages);
		}

		ExaminationSamples effectiveSamples = this.dao.getByCode(examinationSamples.getCode());
        if(effectiveSamples!=null){
            resultMessages.add("该样本编号已使用");
            return ResponseResult.generateFailResult("保存样本失败，该样本编号的状态为已使用，请更改为其他样本编号", resultMessages);
        }

        /**
         * 获取对应项目的最后有效项目
         */
		ExaminationRecordItem recordItem = recordItemDao.getLastRecordItem(examinationSamples.getRecordId(),examinationSamples.getItemId());
		if(recordItem==null){
			resultMessages.add("体检项目不存在");
			return ResponseResult.generateFailResult("保存样本失败，体检项目不存在", resultMessages);
		}

		/**
		 * 判断是否已经录入结果
		 */
		if(StringUtils.isNotBlank(recordItem.getResultDictId())){
			//如果体检项目被标记合格，则不重复采样
			if("1".equals(recordItem.getResultFlag())){
				resultMessages.add("该项目已标记合格，不能重复采样");
				return ResponseResult.generateFailResult("保存样本失败，该项目已标记合格，不能重复采样", resultMessages);
			}

			/**
			 * 标记不合格，则视为复检操作：
			 * 1、新增体检记录项目，并将之前相同项目的lastFlag置为"0"
			 * 2、新增样本记录，并将项目与样本关联
			 * 3、标记体检记录为 未体检完状态
			 */
			recordItem.setLastFlag("0");
			recordItemDao.update(recordItem);

			//新建体检记录项目
			ExaminationRecordItem newRecordItem = new ExaminationRecordItem();
			newRecordItem.preInsert();
			newRecordItem.setRecordId(recordItem.getRecordId());
			newRecordItem.setItemId(recordItem.getItemId());
			newRecordItem.setItemName(recordItem.getItemName());
			newRecordItem.setNeedSamples(recordItem.getNeedSamples());
			newRecordItem.setSampleCode(examinationSamples.getCode());
			newRecordItem.setExaminationFlag("2");
			newRecordItem.setLastFlag("1");
			recordItemDao.insert(newRecordItem);

			//保存样本记录
			examinationSamples.setRecordItemId(newRecordItem.getId());
			//复检
			examinationSamples.setExaminationFlag("2");
			super.save(examinationSamples);

			//标记体检记录为未体检完
			examinationRecordService.updateRecordStatus(newRecordItem.getRecordId(),ExaminationRecordConstant.STATUS10);
		}else{
			//判断体检项目是否已采集样本
			if(recordItem.getGrabSample()){
				resultMessages.add("该项目已采集样本，不能重复采样");
				return ResponseResult.generateFailResult("保存样本失败", resultMessages);
			}

			//保存样本
			examinationSamples.setRecordItemId(recordItem.getId());
			examinationSamples.setExaminationFlag(recordItem.getExaminationFlag());
			super.save(examinationSamples);

			/**
			 * 体检项目还未标记检验结果，直接将对应体检记录项目与样本关联
			 */
			recordItem.setSampleCode(examinationSamples.getCode());
			recordItemDao.update(recordItem);
		}

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

        List<String> recordIdList = new ArrayList<String>();
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

            if(!recordIdList.contains(recordItem.getRecordId())){
            	recordIdList.add(recordItem.getRecordId());
			}

					//样本中检验结果
            this.dao.updateResult(sampleId,resultDict.getId(),resultDict.getFlag(),resultRemarksArray[i]);

            //体检记录中检验结果
            recordItemDao.saveRecordResult(recordItem.getId(),examinationSamples.getCode(),resultDict.getId(),resultDict.getName(),resultDict.getFlag(),resultRemarksArray[i]);

        }

        //更新体检记录状态
		if (!recordIdList.isEmpty()){
			for (String recordId:recordIdList) {
				examinationRecordService.refreshStatus(recordId);
			}
		}


        return ResponseResult.generateSuccessResult("样本结果录入成功");
    }
}