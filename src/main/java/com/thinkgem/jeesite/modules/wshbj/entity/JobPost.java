/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * 工作岗位Entity
 * @author zhxl
 * @version 2018-03-11
 */
public class JobPost extends DataEntity<JobPost> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 名称
	private String namePinyin;		// 名字拼音
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心
	private Integer orderNumb;

	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}
	public JobPost() {
		super();
	}

	public JobPost(String id){
		super(id);
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
	@NotNull(message = "岗位编号不允许为空")
	@ExpressSequence(express = "GW{yyyy}[3]",describe = "岗位编号")
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


	public Map<String,String> getMap(){
		Map<String,String> map=new HashMap();

		map.put("id",id);
		map.put("code",code);
		map.put("name",name);

		map.put("value",name);
		map.put("label",name+"("+namePinyin+")");


		return map;
	}
}