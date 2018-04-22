/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

/**
 * 检查项目Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class ExaminationItem extends DataEntity<ExaminationItem> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 名称
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心
	private String typeId;		// 检查项目类型
	private String unit;		// 单位
	private String price;		// 价格
	private String rangeMax;		// 参考范围最大值
	private String rangeMin;		// 参考范围最小值
	private String specimenId;		// 所需标本
	private String permission;
	private String needSamples;		//是否需要样本：0-否，1-是
	
	public ExaminationItem() {
		super();
	}

	public ExaminationItem(String id){
		super(id);
	}

	@ExpressSequence(express = "JCXM{yyyy}[4]",describe = "检查项目编号")
	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
    @NotNull(message = "检修项目编号必须填写")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
    @NotNull(message = "名称必须填写")
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
	
	@Length(min=0, max=64, message="检查项目类型长度必须介于 1 和 64 之间")
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	@Length(min=1, max=64, message="单位长度必须介于 1 和 64 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	@Length(min=0, max=45, message="价格长度必须介于 0 和 45 之间")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=0, max=45, message="参考范围最大值长度必须介于 0 和 45 之间")
	public String getRangeMax() {
		return rangeMax;
	}

	public void setRangeMax(String rangeMax) {
		this.rangeMax = rangeMax;
	}
	
	@Length(min=0, max=45, message="参考范围最小值长度必须介于 0 和 45 之间")
	public String getRangeMin() {
		return rangeMin;
	}

	public void setRangeMin(String rangeMin) {
		this.rangeMin = rangeMin;
	}
	
	@Length(min=0, max=64, message="所需标本长度必须介于 0 和 64 之间")
    @NotNull(message = "标本类型必须选择")
	public String getSpecimenId() {
		return specimenId;
	}

	public void setSpecimenId(String specimenId) {
		this.specimenId = specimenId;
	}

	@Length(min=0, max=200)
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getNeedSamples() {
		return needSamples;
	}

	public void setNeedSamples(String needSamples) {
		this.needSamples = needSamples;
	}
}