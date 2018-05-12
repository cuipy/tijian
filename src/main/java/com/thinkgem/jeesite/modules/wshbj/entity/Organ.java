/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 体检单位Entity
 * @author zhxl
 * @version 2018-03-12
 */
public class Organ extends DataEntity<Organ> {
	
	private static final long serialVersionUID = 1L;

	private String code;
	private String name;		// 名称
	private String namePinyin;		// 名字拼音
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心

	private Date uploadDate;
	private Integer orderNumb;

	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}
	public Organ() {
		super();
	}

	public Organ(String id){
		super(id);
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	/**
	 * 获取owner的名称
	 * @return
	 */
	@JsonIgnore
	public String getOwnerName(){
		OfficeService officeService=SpringContextHolder.getBean(OfficeService.class);
		Office office = officeService.get(owner);

		if(office==null||StringUtils.isEmpty(office.getName())){
			return "";
		}
		return office.getName();
	}

	@Length(min=1, max=45, message="编号长度必须介于 1 和 45 之间")
	@NotNull(message = "单位编号不允许为空")
	@ExpressSequence(express = "DW{yyyyMM}[3]",describe = "单位编号")
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	@JsonIgnore
	public String getCreateByName(){
		SystemService systemService = SpringContextHolder.getBean(SystemService.class);
		User user = systemService.getUser(createBy.getId());
		if(user==null){
			return "";
		}
		return user.getName();
	}
	@JsonIgnore
	public String getUpdateByName(){
		SystemService systemService = SpringContextHolder.getBean(SystemService.class);
		User user = systemService.getUser(updateBy.getId());
		if(user==null){
			return "";
		}
		return user.getName();
	}

	public Map<String,String> getMap(){
		Map<String,String> map=new HashMap();

		map.put("id",id);
		map.put("code",code);
		map.put("name",name);
		map.put("owner",owner);
		map.put("ownerName",getOwnerName());
		map.put("createById",getCreateBy().getId());
		map.put("createByName",getCreateByName());
		//map.put("createDate",DateUtils.formatDateTime(getCreateDate()));
		map.put("updateById",getUpdateBy().getId());
		map.put("updateByName",getUpdateByName());
		//map.put("updateDate",DateUtils.formatDateTime(getUploadDate()));


		return map;
	}
}