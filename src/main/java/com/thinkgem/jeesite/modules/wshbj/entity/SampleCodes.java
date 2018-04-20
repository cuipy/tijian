/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 样本编号库Entity
 * @author cuipengyu
 * @version 2018-04-20
 */
public class SampleCodes extends DataEntity<SampleCodes> {
	
	private static final long serialVersionUID = 1L;
	private String specimenId;		// 样本类型ID
	private String specimenName;		// 样本类型名称
	private String packId;		// 批次id
	private String sampleCode;		// 样本编号
	private String isUsed;		// 是否使用，0未使用 1已使用
	private String authId;		// auth_id
	private String authName;		// 作者

	private String owner;			// 所属公司Id
	
	public SampleCodes() {
		super();
	}

	public SampleCodes(String id){
		super(id);
	}

	@Length(min=1, max=128, message="样本类型ID长度必须介于 1 和 128 之间")
	public String getSpecimenId() {
		return specimenId;
	}

	public void setSpecimenId(String specimenId) {
		this.specimenId = specimenId;
	}
	
	@Length(min=1, max=64, message="样本类型名称长度必须介于 1 和 64 之间")
	@ExcelField(value="specimenName",title="样本类型",type=1,sort=10)
	public String getSpecimenName() {
		return specimenName;
	}

	public void setSpecimenName(String specimenName) {
		this.specimenName = specimenName;
	}
	
	@Length(min=0, max=64, message="批次id长度必须介于 0 和 64 之间")
	public String getPackId() {
		return packId;
	}

	public void setPackId(String packId) {
		this.packId = packId;
	}

	@ExpressSequence(express = "{yyyyMMdd}[4]",describe = "样本编号")
	@Length(min=1, max=64, message="样本编号长度必须介于 1 和 64 之间")
	@ExcelField(value="sampleCode",title="样本编号",type=1,sort=20)
	public String getSampleCode() {
		return sampleCode;
	}

	public void setSampleCode(String sampleCode) {
		this.sampleCode = sampleCode;
	}
	
	@Length(min=1, max=1, message="是否使用，0未使用 1已使用长度必须介于 1 和 1 之间")
	public String getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}

	@ExcelField(value="strIsUsed",title="是否使用",type=1,sort=30)
	public String getStrIsUsed(){
		if("1".equals(isUsed)){
			return "已使用";
		}
		return "未使用";
	}
	
	@Length(min=1, max=64, message="auth_id长度必须介于 1 和 64 之间")
	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}
	
	@Length(min=0, max=64, message="作者长度必须介于 0 和 64 之间")
	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
}