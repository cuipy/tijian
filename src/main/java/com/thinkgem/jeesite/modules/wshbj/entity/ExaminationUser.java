/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检用户Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class ExaminationUser extends DataEntity<ExaminationUser> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 姓名

	private String headImgPath;		// 真实照片
	private String phoneNumber;		// 联系电话
	private String idNumber;		// 身份证号
	private String sex;		// 性别
	private String industryId;		// 行业
	private String postId;		// 岗位
	private String birthday;		// 出生日期
	private String organId;		// 单位
	private String owner;		// 所属体检中心
	
	public ExaminationUser() {
		super();
	}

	public ExaminationUser(String id){
		super(id);
	}

	@Length(min=0, max=50, message="编号长度必须介于 1 和 50 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="姓名长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=45, message="联系电话长度必须介于 1 和 45 之间")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Length(min=1, max=20, message="身份证号长度必须介于 1 和 20 之间")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	@Length(min=1, max=64, message="性别长度必须介于 1 和 64 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=64, message="行业长度必须介于 1 和 64 之间")
	public String getIndustryId() {
		return industryId;
	}

	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}
	
	@Length(min=0, max=64, message="岗位长度必须介于 1 和 64 之间")
	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}
	
	@Length(min=1, max=10, message="出生日期长度必须介于 1 和 10 之间")
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=0, max=64, message="单位长度必须介于 1 和 64 之间")
	public String getOrganId() {
		return organId;
	}

	public void setOrganId(String organId) {
		this.organId = organId;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	@Length(min=0, max=128, message="真实照片图片地址字符长度必须介于 0 和 128 之间")
	public String getHeadImgPath() {
		return headImgPath;
	}

	public void setHeadImgPath(String headImgPath) {
		this.headImgPath = headImgPath;
	}
}