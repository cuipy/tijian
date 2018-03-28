/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检样本Entity
 * @author zhxl
 * @version 2018-03-25
 */
public class ExaminationSamples extends DataEntity<ExaminationSamples> {
	
	private static final long serialVersionUID = 1L;
	private String examinationCode;		// 体检编号
	private String code;		// 编号
	private String itemId;		// 项目id
	private String userId;		// 体检用户
	private String owner;		// 所属体检中心
	private String examinationFlag;		// 1-初检，2-复检
	
	public ExaminationSamples() {
		super();
	}

	public ExaminationSamples(String id){
		super(id);
	}

	@Length(min=0, max=50, message="体检编号长度必须介于 0 和 50 之间")
	@ExcelField(value="examinationCode",title="体检编号",type=0,sort=20)
	public String getExaminationCode() {
		return examinationCode;
	}

	public void setExaminationCode(String examinationCode) {
		this.examinationCode = examinationCode;
	}
	
	@Length(min=0, max=50, message="编号长度必须介于 0 和 50 之间")
	@ExcelField(value="code",title="编号",type=0,sort=30)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=64, message="项目id长度必须介于 1 和 64 之间")
	@ExcelField(value="itemId",title="项目id",type=0,sort=40)
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	@Length(min=1, max=64, message="体检用户长度必须介于 1 和 64 之间")
	@ExcelField(value="userId",title="体检用户",type=0,sort=50)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=120)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=1, message="1-初检，2-复检长度必须介于 0 和 1 之间")
	@ExcelField(value="examinationFlag",title="1-初检，2-复检",type=0,sort=130)
	public String getExaminationFlag() {
		return examinationFlag;
	}

	public void setExaminationFlag(String examinationFlag) {
		this.examinationFlag = examinationFlag;
	}
	
}