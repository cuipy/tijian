/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;

/**
 * 检查标本类型Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class Specimen extends DataEntity<Specimen> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 名称
	private String namePinyin;		// 名字拼音
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心

	private String resultDeptId;
	private String grabDeptId;

	private String prefix;
	private Integer orderNumb;

	public String getResultDeptId() {
		return resultDeptId;
	}

	public void setResultDeptId(String resultDeptId) {
		this.resultDeptId = resultDeptId;
	}

	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}
	public Specimen() {
		super();
	}

	public Specimen(String id){
		super(id);
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
	@NotNull(message = "标本类型编号不允许为空")
	@ExpressSequence(express = "BBLX{yyyy}[3]",describe = "标本类型编号")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	@NotNull(message = "标本类型名称不允许为空")
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

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getGrabDeptId() {
		return grabDeptId;
	}

	public void setGrabDeptId(String grabDeptId) {
		this.grabDeptId = grabDeptId;
	}

	@JsonIgnore
	public String getGrabDeptName(){
		OfficeService officeService=SpringContextHolder.getBean(OfficeService.class);
		Office dept = officeService.get(grabDeptId);

		if(dept==null){
			return "";
		}
		return dept.getName();
	}
}