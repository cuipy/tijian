/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 制卡记录Entity
 * @author zhxl
 * @version 2018-03-25
 */
public class CertRecord extends DataEntity<CertRecord> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 卡号
	private String examinationCode;		// 体检编号
	private String userId;		// 体检用户
	private String idNumber;		// 身份证号
	private String userName;		// 姓名
	private String sex;		// 性别
	private String industryId;		// 行业
	private String postId;		// 岗位
	private String birthday;		// 出生日期
	private String organId;		// 单位
	private String owner;		// 所属体检中心
	
	public CertRecord() {
		super();
	}

	public CertRecord(String id){
		super(id);
	}

	@Length(min=0, max=50, message="卡号长度必须介于 0 和 50 之间")
	@ExcelField(value="code",title="卡号",type=0,sort=20)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="体检编号长度必须介于 1 和 50 之间")
	@ExcelField(value="examinationCode",title="体检编号",type=0,sort=30)
	public String getExaminationCode() {
		return examinationCode;
	}

	public void setExaminationCode(String examinationCode) {
		this.examinationCode = examinationCode;
	}
	
	@Length(min=1, max=64, message="体检用户长度必须介于 1 和 64 之间")
	@ExcelField(value="userId",title="体检用户",type=0,sort=40)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=0, max=20, message="身份证号长度必须介于 0 和 20 之间")
	@ExcelField(value="idNumber",title="身份证号",type=0,sort=50)
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@Length(min=1, max=50, message="姓名长度必须介于 1 和 50 之间")
	@ExcelField(value="userName",title="姓名",type=0,sort=60)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=130)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIndustryId() {
		return industryId;
	}

	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getOrganId() {
		return organId;
	}

	public void setOrganId(String organId) {
		this.organId = organId;
	}
}