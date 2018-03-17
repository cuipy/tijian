/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.bean.ResponseResult;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;

/**
 * 体检记录Service
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
	
	public ExaminationRecord get(String id) {
		ExaminationRecord examinationRecord = super.get(id);
		if (examinationRecord!=null){
			ExaminationRecordItem recordItem = new ExaminationRecordItem();
			recordItem.setRecordId(id);
			examinationRecord.setExaminationRecordItemList(examinationRecordItemDao.findList(recordItem));
		}

		return examinationRecord;
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
		for (ExaminationRecordItem examinationRecordItem : examinationRecord.getExaminationRecordItemList()){
			if (examinationRecordItem.getId() == null){
				continue;
			}
			if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(examinationRecordItem.getDelFlag())){
				if (StringUtils.isBlank(examinationRecordItem.getId())){
					examinationRecordItem.setRecordId(examinationRecord.getId());
					examinationRecordItem.preInsert();
					examinationRecordItemDao.insert(examinationRecordItem);
				}else{
					examinationRecordItem.preUpdate();
					examinationRecordItemDao.update(examinationRecordItem);
				}
			}else{
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
		resultMessages.add( "数据验证失败：");
		ExaminationUser examinationUser = null;
		if (StringUtils.isNotBlank(examinationRecord.getUser().getId())){
			examinationUser = examinationUserService.get(examinationRecord.getUser().getId());
			if (examinationUser==null){
				resultMessages.add("体检用户信息错误");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
			}
		}

		//
		if (examinationUser!=null){
			if (!examinationRecord.getIdNumber().equals(examinationUser.getIdNumber())){
				resultMessages.add("身份证与系统内信息不一致");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
			}
			if (!examinationRecord.getName().equals(examinationUser.getName())){
				resultMessages.add("名称与系统内信息不一致");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
			}
			if (!examinationRecord.getSex().equals(examinationUser.getSex())){
				resultMessages.add("性别与系统内信息不一致");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
			}
			if (!examinationRecord.getBirthday().equals(examinationUser.getBirthday())){
				resultMessages.add("出生日期与系统内信息不一致");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
			}
		}else{
			//验证是否存在相同身份证用户
			examinationUser = examinationUserService.getByIdNumberAndOwner(examinationRecord.getIdNumber(),examinationRecord.getOwner());
			if (examinationUser!=null){
				resultMessages.add("系统内已存在该身份证信息，请选择用户或进行身份证核实");
				return ResponseResult.generateFailResult("用户信息错误",resultMessages);
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

		examinationRecord.setStatus("1");
		super.save(examinationRecord);

		//保存检查项目
		for (ExaminationRecordItem examinationRecordItem : examinationRecord.getExaminationRecordItemList()){
			if (examinationRecordItem.getId() == null){
				continue;
			}
			if (ExaminationRecordItem.DEL_FLAG_NORMAL.equals(examinationRecordItem.getDelFlag())){
				if (StringUtils.isBlank(examinationRecordItem.getId())){
					examinationRecordItem.setRecordId(examinationRecord.getId());
					examinationRecordItem.preInsert();
					examinationRecordItemDao.insert(examinationRecordItem);
				}else{
					examinationRecordItem.preUpdate();
					examinationRecordItemDao.update(examinationRecordItem);
				}
			}else{
				examinationRecordItemDao.delete(examinationRecordItem);
			}
		}
		resultMessages.remove(0);
		resultMessages.add("保存成功");
		return ResponseResult.generateSuccessResult("保存成功",resultMessages);
	}
}