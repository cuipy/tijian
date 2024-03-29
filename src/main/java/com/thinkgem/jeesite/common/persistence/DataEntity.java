/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.persistence;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.thinkgem.jeesite.common.annotation.Unique;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 数据Entity类
 * @author ThinkGem
 * @version 2014-05-16
 */
public abstract class DataEntity<T> extends BaseEntity<T> {

	private static final long serialVersionUID = 1L;
	
	protected String remarks;	// 备注
	protected User createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected User updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
	/**
	 * 缺省记录，不可删除
	 * 默认 0
	 * 0 不是默认记录，可删除   1 默认记录 不可删除
	 */
	protected String defaultRecord ;

	protected String likeField;

	@JsonIgnore
	public String getLikeField() {
		return likeField;
	}

	public void setLikeField(String likeField) {
		this.likeField = likeField;
	}

	public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	public DataEntity(String id) {
		super(id);
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (!this.isNewRecord){
			setId(IdGen.uuid());
		}
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user;
			this.createBy = user;
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}
	
	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){
		User user = UserUtils.getUser();
		if (StringUtils.isNotBlank(user.getId())){
			this.updateBy = user;
		}
		this.updateDate = new Date();
	}
	
	@Length(min=0, max=255)
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@JsonIgnore
	public User getCreateBy() {
		return createBy;
	}

	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonIgnore
	public User getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(User updateBy) {
		this.updateBy = updateBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@JsonIgnore
	@Length(min=1, max=1)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	/**
	 * 获取所有的唯一字段
	 * @return
	 */
	public List<String> getUniqueFields(){
		List<String> fields= Lists.newArrayList();

		Set<String> sets= Sets.newHashSet();

		Field[] fs = getClass().getDeclaredFields();
		for(Field f:fs){
			Unique an = f.getAnnotation(Unique.class);
			if(an==null){
				continue;
			}

			String fieldName=f.getName();
			fieldName=com.thinkgem.jeesite.common.utils.StringUtils.lowerCaseFirst(fieldName);

			sets.add(fieldName);
		}


		Method[] ms = getClass().getDeclaredMethods();
		for(Method m:ms){
			Unique an = m.getAnnotation(Unique.class);
			if(an==null){
				continue;
			}

			String methodName=m.getName();
			String fieldName=null;
			if(methodName.startsWith("get")){
				fieldName=methodName.substring(3);
			}else{
				continue;
			}

			fieldName=com.thinkgem.jeesite.common.utils.StringUtils.lowerCaseFirst(fieldName);

			sets.add(fieldName);
		}
		fields.addAll(sets);
		return fields;
	}
	@Length(min=1, max=1)
	public String getDefaultRecord() {
		return defaultRecord;
	}

	public void setDefaultRecord(String defaultRecord) {
		this.defaultRecord = defaultRecord;
	}
}
