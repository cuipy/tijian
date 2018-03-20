/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.Industry;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemDao;

/**
 * 检查项目Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationItemService extends CrudService<ExaminationItemDao, ExaminationItem> {

	@Autowired
	private GenSeqNumberService genSeqNumberService;

	public ExaminationItem get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationItem> findList(ExaminationItem examinationItem) {
		return super.findList(examinationItem);
	}
	
	public Page<ExaminationItem> findPage(Page<ExaminationItem> page, ExaminationItem examinationItem) {
		return super.findPage(page, examinationItem);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationItem examinationItem) {
		super.save(examinationItem);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationItem examinationItem) {
		super.delete(examinationItem);
	}

	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String examinationItemIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(examinationItemIds)){
			return RequestResult.generateFailResult("检查项目数据错误");
		}

		//TODO 数据来源
		String keyCode = UserUtils.getUser().getCompany().getCode()+"ITEM_";
		String[] examinationItemIdsArray = examinationItemIds.split(",");
		ExaminationItem examinationItem = null,newExaminationItem = null;
		for (String examinationItemId:examinationItemIdsArray) {
			examinationItem = get(examinationItemId);
			if (examinationItem==null){
				continue;
			}
			newExaminationItem = new ExaminationItem();
			newExaminationItem.setDelFlag("0");
			newExaminationItem.setCode(examinationItem.getCode());
			newExaminationItem.setName(examinationItem.getName());
			newExaminationItem.setRemarks(examinationItem.getRemarks());
			newExaminationItem.setReferenceFlag("0");
			newExaminationItem.setOwner(createBy.getCompany().getId());
			newExaminationItem.setUnit(examinationItem.getUnit());
			newExaminationItem.setPrice(examinationItem.getPrice());
			newExaminationItem.setRangeMin(examinationItem.getRangeMin());
			newExaminationItem.setRangeMax(examinationItem.getRangeMax());

			newExaminationItem.setPermission(keyCode+genSeqNumberService.genSeqNumber1(keyCode,1));

			super.save(newExaminationItem);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
	
}