/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationCategory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationDept;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationDeptDao;

/**
 * 检查部门Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationDeptService extends CrudService<ExaminationDeptDao, ExaminationDept> {

	public ExaminationDept get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationDept> findList(ExaminationDept examinationDept) {
		return super.findList(examinationDept);
	}
	
	public Page<ExaminationDept> findPage(Page<ExaminationDept> page, ExaminationDept examinationDept) {
		return super.findPage(page, examinationDept);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationDept examinationDept) {
		super.save(examinationDept);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationDept examinationDept) {
		super.delete(examinationDept);
	}

	@Transactional(readOnly = false)
	public RequestResult saveByPull(User createBy, String examinationDeptIds) {
		if (createBy==null){
			return RequestResult.generateFailResult("权限不足");
		}

		if (StringUtils.isBlank(examinationDeptIds)){
			return RequestResult.generateFailResult("检查部门数据错误");
		}

		//TODO 数据来源

		String[] deptIdsArray = examinationDeptIds.split(",");
		ExaminationDept dept = null,newDept = null;
		for (String deptId:deptIdsArray) {
			dept = get(deptId);
			if (dept==null){
				continue;
			}
			newDept = new ExaminationDept();
			newDept.setDelFlag("0");
			newDept.setName(dept.getName());
			newDept.setRemarks(dept.getRemarks());
			newDept.setReferenceFlag("0");
			newDept.setOwner(createBy.getCompany().getId());

			super.save(newDept);
		}

		return RequestResult.generateSuccessResult("保存成功");
	}
}