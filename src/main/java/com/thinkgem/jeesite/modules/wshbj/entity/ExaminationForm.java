/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检流程表模板Entity
 * @author zhxl
 * @version 2018-03-14
 */
public class ExaminationForm extends DataEntity<ExaminationForm> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 名称
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心
	private String templatePath;		// 模板路径
	
	public ExaminationForm() {
		super();
	}

	public ExaminationForm(String id){
		super(id);
	}

	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
	@ExcelField(value="code",title="编号",type=0,sort=20)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	@ExcelField(value="name",title="名称",type=0,sort=30)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="参考标识：0-否，1-是长度必须介于 0 和 1 之间")
	@ExcelField(value="referenceFlag",title="参考标识：0-否，1-是",type=0,sort=100)
	public String getReferenceFlag() {
		return referenceFlag;
	}

	public void setReferenceFlag(String referenceFlag) {
		this.referenceFlag = referenceFlag;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=110)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=64, message="模板路径长度必须介于 0 和 64 之间")
	@ExcelField(value="templatePath",title="模板路径",type=0,sort=120)
	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}
	
}