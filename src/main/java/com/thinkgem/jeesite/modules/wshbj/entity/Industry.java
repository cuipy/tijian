/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationPackageService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;

/**
 * 行业基础数据管理Entity
 * @author zhxl
 * @version 2018-03-11
 */
public class Industry extends DataEntity<Industry> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 名称
	private String namePinyin;		// 名字拼音
	private String defaultPackageId;    // 缺省套餐Id

	private String prefixExamCode;				// 行业的体检编号生成规则

	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心
	private Integer orderNumb;
	private Integer defaultJkz;
	private Integer defaultHealth;

	public Integer getDefaultJkz() {
		return defaultJkz;
	}

	public void setDefaultJkz(Integer defaultJkz) {
		this.defaultJkz = defaultJkz;
	}

	public Integer getDefaultHealth() {
		return defaultHealth;
	}

	public void setDefaultHealth(Integer defaultHealth) {
		this.defaultHealth = defaultHealth;
	}

	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}
	public Industry() {
		super();
	}

	public Industry(String id){
		super(id);
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	public String getDefaultPackageId() {
		return defaultPackageId;
	}

	public void setDefaultPackageId(String defaultPackageId) {
		this.defaultPackageId = defaultPackageId;
	}

	public String getPrefixExamCode() {
		return prefixExamCode;
	}

	public void setPrefixExamCode(String prefixExamCode) {
		this.prefixExamCode = prefixExamCode;
	}

	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
	@NotNull(message = "行业编号不允许为空")
	@ExpressSequence(express = "HY{yyyy}[3]",describe = "行业编号")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="参考标识：0-否，1-是长度必须介于 0 和 1 之间")
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

	@JsonIgnore
	public String getDefaultPackageName(){
		if(StringUtils.isEmpty(defaultPackageId)){
			return "";
		}
		ExaminationPackageService examinationPackageService=SpringContextHolder.getBean(ExaminationPackageService.class);
		ExaminationPackage pack = examinationPackageService.get(defaultPackageId);
		if(pack==null){
			return "";
		}
		return pack.getName();
	}


	
}