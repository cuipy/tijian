/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.thinkgem.jeesite.common.bean.ResponseResult;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	public List<ExaminationItem> findListByPackage(String packageId) {
		if (StringUtils.isBlank(packageId)){
			return new ArrayList<ExaminationItem>();
		}
		return this.dao.findListByPackage(packageId);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationItem examinationItem) {
		String permission = null;
		if (com.thinkgem.jeesite.common.utils.StringUtils.isBlank(examinationItem.getPermission())){
			permission = genSeqNumberService.genSeqNumber1(UserUtils.getUser().getCompany().getCode()+"ITEM_",1);
			examinationItem.setPermission(permission);
			examinationItem.setOwner(UserUtils.getUser().getCompany().getId());
			examinationItem.setReferenceFlag("0");
		}
		super.save(examinationItem);

		//创建或修改项目菜单
	}

	@Transactional(readOnly = false)
	public void saveByCenter(ExaminationItem examinationItem) {
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
			newExaminationItem.setNeedSamples(examinationItem.getNeedSamples());

			newExaminationItem.setPermission(keyCode+genSeqNumberService.genSeqNumber1(keyCode,1));

			super.save(newExaminationItem);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}


	@Transactional(readOnly = false)
	public ResponseResult saveAssigning(String roleId, String[] itemIds) {
		if (StringUtils.isBlank(roleId)){
			return ResponseResult.generateFailResult("缺少角色信息");
		}

		if (itemIds==null || itemIds.length==0){
			return ResponseResult.generateFailResult("缺少项目信息");
		}

		//删除原有角色项目
		this.dao.deleteRoleItem(roleId);

		this.dao.insertRoleItem(roleId, Arrays.asList(itemIds));

		return ResponseResult.generateSuccessResult("保存成功");
	}

	public List<ExaminationItem> findAuthorisedList(String roleId) {
		if (StringUtils.isBlank(roleId)){
			return new ArrayList<ExaminationItem>();
		}
		return this.dao.findAuthorisedList(roleId);
	}
}