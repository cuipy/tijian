/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检结果字典Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class ExaminationResultDict extends DataEntity<ExaminationResultDict> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String itemId;		// 检查项目
	private String defaultFlag;		// 是否默认：0-否，1-是
	
	public ExaminationResultDict() {
		super();
	}

	public ExaminationResultDict(String id){
		super(id);
	}

	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=64, message="检查项目长度必须介于 1 和 64 之间")
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	@Length(min=1, max=1, message="是否默认：0-否，1-是长度必须介于 1 和 1 之间")
	public String getDefaultFlag() {
		return defaultFlag;
	}

	public void setDefaultFlag(String defaultFlag) {
		this.defaultFlag = defaultFlag;
	}
	
}