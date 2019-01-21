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
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationUserService;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;
import com.thinkgem.jeesite.modules.wshbj.service.JobPostService;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 体检用户Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class ExaminationUser extends DataEntity<ExaminationUser> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 编号
	private String name;		// 姓名
	private String idNumberPicHead;
	private String idNumberPicFore;
	private String idNumberPicBack;

	private String namePinyin;		// 姓名拼音
	private String headImgPath;		// 真实照片
	private String phoneNumber;		// 联系电话
	private String idNumber;		// 身份证号
	private String sex;		// 性别
	private String age;
	private String industryId;		// 行业
	private String postId;		// 岗位
	private String birthday;		// 出生日期
	private String organId;		// 单位
	private String owner;		// 所属体检中心
	private Date uploadDate;
    private Integer orderNumb;

	private String orderField;
	private String orderDirect;

    public Integer getOrderNumb() {
        return orderNumb;
    }

    public void setOrderNumb(Integer orderNumb) {
        this.orderNumb = orderNumb;
    }

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public ExaminationUser() {
		super();
	}

	public ExaminationUser(String id){
		super(id);
	}

	public String getIdNumberPicHead() {
		return idNumberPicHead;
	}

	public void setIdNumberPicHead(String idNumberPicHead) {
		this.idNumberPicHead = idNumberPicHead;
	}

	public String getIdNumberPicFore() {
		return idNumberPicFore;
	}

	public void setIdNumberPicFore(String idNumberPicFore) {
		this.idNumberPicFore = idNumberPicFore;
	}

	public String getIdNumberPicBack() {
		return idNumberPicBack;
	}

	public void setIdNumberPicBack(String idNumberPicBack) {
		this.idNumberPicBack = idNumberPicBack;
	}

	@Length(min=0, max=50, message="编号长度必须介于 1 和 50 之间")
	@ExpressSequence(express = "TJYH{yyMMdd}[4]",describe = "体检用户编号")
	@NotNull(message = "体检用户编号不允许为空")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=2, max=50, message="姓名长度必须介于 2 和 50 之间")
	@NotNull(message = "姓名禁止为空")
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Pattern(regexp = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)" +
			"|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$)|(^\\s*$)" ,message = "身份证格式不合法")
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
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
	
	@Length(min=0, max=64, message="岗位长度必须介于 1 和 64 之间")
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
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@NotNull(message="体检中心必须填写")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	@JsonIgnore
	public String getHeadImgPath() {
    	if(StringUtils.isEmpty(headImgPath)){
			ExaminationUserService examinationUserService=SpringContextHolder.getBean(ExaminationUserService.class);
			headImgPath=examinationUserService.getHeadImg(id);
		}
		return headImgPath;
	}

	public void setHeadImgPath(String headImgPath) {
		this.headImgPath = headImgPath;
	}

	@JsonIgnore
	public Organ getOrgan(){
		OrganService organService=SpringContextHolder.getBean(OrganService.class);
		return organService.get(organId);
	}

	public String getOrganName(){
		Organ organ=getOrgan();
		if(organ==null){
			return "";
		}
		return organ.getName();
	}

	@JsonIgnore
	public Industry getIndustry(){
		IndustryService service=SpringContextHolder.getBean(IndustryService.class);
		return service.get(industryId);
	}

	public String getIndustryName(){
		Industry entity=getIndustry();
		if(entity==null){
			return "";
		}
		return entity.getName();
	}

	@JsonIgnore
	public JobPost getJobPost(){
		JobPostService service=SpringContextHolder.getBean(JobPostService.class);
		return service.get(postId);
	}

	public String getJobPostName(){
		JobPost entity=getJobPost();
		if(entity==null){
			return "";
		}
		return entity.getName();
	}

	public String getStrSex(){
		return DictUtils.getDictLabel(sex,"sex","");
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
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

	@JsonIgnore
	public String getCreateByName(){
		UserService userService = SpringContextHolder.getBean(UserService.class);
		User user = userService.getUser(createBy.getId());
		if(user==null){
			return "";
		}
		return user.getName();
	}
	@JsonIgnore
	public String getUpdateByName(){
		UserService userService = SpringContextHolder.getBean(UserService.class);
		User user = userService.getUser(updateBy.getId());
		if(user==null){
			return "";
		}
		return user.getName();
	}

	@JsonIgnore
	public Map<String,String> getMap(){
		Map<String,String> m=new HashMap();
		m.put("id",id);
		m.put("name",name); m.put("headImgPath",headImgPath);
		m.put("organId",organId);
		m.put("organName",getOrganName());
		m.put("industryId",industryId);
		m.put("industryName",getIndustryName());
		m.put("industryId",industryId);
		m.put("industryName",getIndustryName());
		m.put("postId",postId);
		m.put("jobPostName",getJobPostName());
		m.put("postName",getJobPostName());
		m.put("idNumber",idNumber);

		m.put("phoneNumber",phoneNumber);
		m.put("birthday",this.birthday);
		m.put("age",this.age);
		m.put("sex",this.sex);
		m.put("strSex",this.getStrSex());
		m.put("code",this.code);
		m.put("owner",this.owner);
		m.put("ownerName",this.getOwnerName());

		m.put("createById",getCreateBy().getId());
		m.put("createByName",getCreateByName());
		m.put("updateById",getUpdateBy().getId());
		m.put("updateByName",getUpdateByName());

		m.put("value",idNumber);
		m.put("label",idNumber+"/"+phoneNumber+"("+getName()+")");

		return m;
	}

	@JsonIgnore
	public Map<String,String> getMapForAutoCompleter(){
		Map<String,String> m=new HashMap();
		m.put("id",id);

		m.put("value",idNumber);
		m.put("label",idNumber+"/"+phoneNumber+"("+getName()+")");

		return m;
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderDirect() {
		return orderDirect;
	}

	public void setOrderDirect(String orderDirect) {
		this.orderDirect = orderDirect;
	}
}