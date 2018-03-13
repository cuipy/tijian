/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检套餐Entity
 * @author zhxl
 * @version 2018-03-12
 */
public class PackageItem extends DataEntity<PackageItem> {
	
	private static final long serialVersionUID = 1L;
	private ExaminationPackage examinationPackage;		// 检查套餐 父类
	private String itemId;		// 检查项目
	
	public PackageItem() {
		super();
	}

	public PackageItem(String id){
		super(id);
	}

	public PackageItem(ExaminationPackage examinationPackage){
		this.examinationPackage = examinationPackage;
	}

	@Length(min=1, max=64, message="检查套餐长度必须介于 1 和 64 之间")
	public ExaminationPackage getExaminationPackage() {
		return examinationPackage;
	}

	public void setExaminationPackage(ExaminationPackage examinationPackage) {
		this.examinationPackage = examinationPackage;
	}
	
	@Length(min=1, max=64, message="检查项目长度必须介于 1 和 64 之间")
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
}