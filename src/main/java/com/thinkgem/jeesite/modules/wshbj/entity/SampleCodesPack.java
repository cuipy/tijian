/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;

/**
 * 样本编号包Entity
 * @author cuipengyu
 * @version 2018-04-20
 */
public class SampleCodesPack extends DataEntity<SampleCodesPack> {
	
	private static final long serialVersionUID = 1L;
	private String specimenId;		// 样本类型ID
	private String specimenName;		// 样本类型名称
	private Integer codeCount;		// 样本编号数量
	private String authId;		// auth_id
	private String authName;		// 作者

	private String owner;			// 所属公司Id
	
	public SampleCodesPack() {
		super();
	}

	public SampleCodesPack(String id){
		super(id);
	}

	@NotNull
	@Length(min=0, max=128, message="样本类型ID长度必须介于 0 和 128 之间")
	public String getSpecimenId() {
		return specimenId;
	}

	public void setSpecimenId(String specimenId) {
		this.specimenId = specimenId;
	}
	
	@Length(min=0, max=64, message="样本类型名称长度必须介于 0 和 64 之间")
	public String getSpecimenName() {
		return specimenName;
	}

	public void setSpecimenName(String specimenName) {
		this.specimenName = specimenName;
	}
	
	@NotNull
	public Integer getCodeCount() {
		return codeCount;
	}

	public void setCodeCount(Integer codeCount) {
		this.codeCount = codeCount;
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