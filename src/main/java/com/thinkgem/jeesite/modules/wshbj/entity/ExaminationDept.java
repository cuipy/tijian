/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 检查部门Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class ExaminationDept extends DataEntity<ExaminationDept> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心
	
	public ExaminationDept() {
		super();
	}

	public ExaminationDept(String id){
		super(id);
	}

	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=1, message="参考标识：0-否，1-是长度必须介于 1 和 1 之间")
	public String getReferenceFlag() {
		return referenceFlag;
	}

	public void setReferenceFlag(String referenceFlag) {
		this.referenceFlag = referenceFlag;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
}