/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.annotation.SequenceBean;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.service.*;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import java.util.*;

import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检记录Entity
 * @author zhxl
 * @version 2018-03-17
 */
@SequenceBean
public class ExaminationRecord extends DataEntity<ExaminationRecord> {
	
	private static final long serialVersionUID = 1L;
	private ExaminationUser user;		// 体检用户
	private String headImg;			// 头像图片
	private String code;		// 编号
	private String name;		// 姓名
	private String namePinyin;		// 名字拼音
	private String phoneNumber;		// 联系电话
	private String sex;		// 性别
	private String age;			// 年龄
	private String industryId;		// 行业
	private String postId;		// 岗位
	private String birthday;		// 出生日期
	private String organId;		// 单位
	private String owner;		// 所属体检中心
	private String packageId;		// 体检套餐
	private String packagePrice;		// 套餐价格
	private String idNumber;		// 身份证号

	private String idNumberPicHead;
	private String idNumberPicFore;
	private String idNumberPicBack;


	//体检状态：10-未体检完，20-体检不合格，30-复检合格，40-可制证，50-已制证
	private String status;
	private String itemType; 	//体检项目方式:1-体检套餐，2-自由选择
	private Date uploadDate;   // 提交到运营服务中心的时间

	private Date examTime;		// 体检时间
	private Date successTime;    // 体检成功的时间
	private Date failTime;		// 体检失败的时间
	private Date zhizhengTime;	// 制证时间

	private Integer orderNumb;	//排序
	private Integer uploadJkz; 	//是否同步健康证的信息 1：已同步

	private String orderField;
	private String orderDirect;


	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
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

	public Date getSuccessTime() {
		return successTime;
	}

	public void setSuccessTime(Date successTime) {
		this.successTime = successTime;
	}

	public Date getFailTime() {
		return failTime;
	}

	public void setFailTime(Date failTime) {
		this.failTime = failTime;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}

	/**
	 * 获取行业
	 * @return
	 */
	@JsonIgnore
	public Industry getIndustry(){
		Industry _industry;
		IndustryService industryService = SpringContextHolder.getBean(IndustryService.class);
		_industry = industryService.get(industryId);
		return _industry;
	}

	/**
	 * 获取岗位
	 * @return
	 */
	@JsonIgnore
	public JobPost getJobPost(){
		JobPost _jobPost;
		JobPostService jobPostService = SpringContextHolder.getBean(JobPostService.class);
		_jobPost = jobPostService.get(postId);
		return _jobPost;
	}


	@JsonIgnore
	public Organ getOrgan(){
		OrganService organService=SpringContextHolder.getBean(OrganService.class);
		return organService.get(organId);
	}


	private Boolean itemListLoaded=false;

	private List<ExaminationRecordItem> examinationRecordItemList = Lists.newArrayList();		// 子表列表
	
	public ExaminationRecord() {
		super();
	}

	public ExaminationRecord(String id){
		super(id);
	}

	@NotNull(message="体检用户不能为空")
	public ExaminationUser getUser() {
		return user;
	}

	public void setUser(ExaminationUser user) {
		this.user = user;
	}

	@ExpressSequence(express="10{yyyyMMdd}[4]",describe = "编号")
	@Length(min=1, max=50, message="编号长度必须介于 1 和 50 之间")
	@ExcelField(value="code",title="编号",type=0,sort=30)
	@NotNull(message="体检编号不允许为空")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="姓名长度必须介于 1 和 50 之间")
	@ExcelField(value="name",title="姓名",type=0,sort=40)
	@NotNull(message="用户名不允许为空")
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
	
	public String getSex() {
		return sex;
	}

	public String getStrSex(){
		return DictUtils.getDictLabel(sex,"sex","");
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=64, message="行业长度必须介于 1 和 64 之间")
	@NotNull(message = "行业必须填写")
	public String getIndustryId() {
		return industryId;
	}

	@ExcelField(value="industryName",title="行业",type=0,sort=70)
	public String getIndustryName(){
		Industry ind = getIndustry();
		if(ind==null){
			return "";
		}

		return ind.getName();
	}
	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}
	
	@Length(min=1, max=64, message="岗位长度必须介于 1 和 64 之间")
	@NotNull(message = "岗位必须填写")
	public String getPostId() {
		return postId;
	}

	@ExcelField(value="postName",title="岗位",type=0,sort=80)
	public String getPostName(){
		JobPost jp = getJobPost();

		if(jp==null||jp.getName()==null){
			return "";
		}
		return jp.getName();
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

	public String getOrganName(){
		Organ organ = getOrgan();
		if(organ==null||organ.getName()==null){
			return "";
		}
		return organ.getName();
	}

	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getPackageId() {
		return packageId;
	}

	public void setPackageId(String packageId) {
		this.packageId = packageId;
	}

	public String getPackageName(){
		ExaminationPackage p = getExaminationPackage();
		if(p==null||p.getName()==null){
			return "";
		}

		return p.getName();

	}

	@Length(min=1, max=10, message="体检价格长度必须介于 1 和 10 之间")
	@NotNull(message = "体检价格不允许为空")
	@ExcelField(value="packagePrice",title="套餐价格",type=0,sort=190)
	public String getPackagePrice() {
		return packagePrice;
	}

	public void setPackagePrice(String packagePrice) {
		this.packagePrice = packagePrice;
	}
	
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@Length(min=1, max=5, message="体检状态，对应examination_record_status字典长度必须介于 1 和 5 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@ExcelField(value="strStatus",title="体检状态",type=0,sort=210)
	public String getStrStatus(){
		return DictUtils.getDictLabel(status,"examination_record_status","");
	}

	@JsonIgnore
	public List<ExaminationRecordItem> getExaminationRecordItemList() {
		return examinationRecordItemList;
	}

	@JsonIgnore
	public ExaminationPackage getExaminationPackage(){

		ExaminationPackage _examinationPackage=null;

		if("2".equals(this.itemType)){
			return null;
		}
		if(_examinationPackage==null&&this.packageId!=null&&"1".equals(this.itemType)){
			ExaminationPackageService examinationPackageService=SpringContextHolder.getBean(ExaminationPackageService.class);
			_examinationPackage=examinationPackageService.get(packageId);
		}
		return _examinationPackage;
	}

	/**
	 * 获取体检细项列表，只有采用自定义方式体检，才能获得这个列表
	 * @auth cuipengyu  20180418
	 * @return
	 */
	public List<ExaminationRecordItem> getItems() {

		// 调用spring管理的对象，获得列表
		ExaminationRecordItemService examinationRecordItemService=SpringContextHolder.getBean(ExaminationRecordItemService.class);
		return  examinationRecordItemService.listByRecordId(id);
	}

	public void setExaminationRecordItemList(List<ExaminationRecordItem> examinationRecordItemList) {
		this.examinationRecordItemList = examinationRecordItemList;
	}

	@Length(min=0, max=64, message="体检项目方式长度必须介于 0 和 64 之间")
	@NotNull(message = "体检类型必须填写")
	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	@ExcelField(value="strItemType",title="体检类型",type=0,sort=210)
	public String getStrItemType(){
		if("1".equals(itemType)){
			return "体检套餐";
		}
		if("2".equals(itemType)){
			return "自由选择";
		}
		return "";
	}


	public Set<String> getItemIds(){


		Set<String> sets=new HashSet();
		List<ExaminationRecordItem> lst = getItems();

		if(lst!=null) {
			for (ExaminationRecordItem ri : lst) {
				sets.add(ri.getItemId());
			}
		}
		return sets;
	}

	@ExcelField(value="itemNames",title="体检细项",type=0,sort=210)
	public String getItemNames(){
		String res="";

		List<ExaminationRecordItem> items = getItems();

		if(items==null||items.size()<=0){
			return res;
		}

		for(ExaminationRecordItem ri:items){
			res+=ri.getItemName()+" | ";

		}
		if(res.length()>0){
			StringUtils.substring(res,0,res.length()-3);
		}
		return res;
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

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getExamTime() {
		return examTime;
	}

	public void setExamTime(Date examTime) {
		this.examTime = examTime;
	}

	public Date getZhizhengTime() {
		return zhizhengTime;
	}

	public void setZhizhengTime(Date zhizhengTime) {
		this.zhizhengTime = zhizhengTime;
	}

	public Date getZhizhengEndTime(){
		if(zhizhengTime==null){
			return null;
		}

		Calendar c=Calendar.getInstance();
		c.setTime(zhizhengTime);
		c.add(Calendar.YEAR,1);
		return c.getTime();
	}

	@JsonIgnore
	public Map<String,String> getMap(){
		Map<String,String > m=new HashMap();
		m.put("id",id);
		m.put("userId",this.getUser().getId());
		m.put("name",name);
		m.put("organId",organId);
		m.put("organName",getOrganName());
		m.put("industryId",industryId);
		m.put("industryName",getIndustryName());
		m.put("industryId",industryId);
		m.put("industryName",getIndustryName());
		m.put("postId",postId);
		m.put("postName",this.getPostName());
		m.put("idNumber",idNumber);

		m.put("phoneNumber",phoneNumber);
		m.put("birthday",this.birthday);
		m.put("age",this.age);
		m.put("sex",this.sex);
		m.put("strSex",this.getStrSex());
		m.put("code",this.code);
		m.put("owner",this.owner);
		m.put("ownerName",this.getOwnerName());

		m.put("status",this.getStatus());
		m.put("strStatus",this.getStrStatus());

		m.put("itemType",this.getItemType());
		m.put("strItemType",this.getStrItemType());

		m.put("packagePrice",this.getPackagePrice());

		m.put("createById",getCreateBy().getId());
		m.put("createByName",getCreateBy().getName());
		m.put("updateById",getUpdateBy().getId());
		m.put("updateByName",getUpdateBy().getName());

		m.put("examTime",examTime==null?null:DateUtils.formatDate(examTime,"yyyy-MM-dd HH:mm:ss"));
		m.put("successTime",successTime==null?null:DateUtils.formatDate(successTime,"yyyy-MM-dd HH:mm:ss"));
		m.put("failTime",failTime==null?null:DateUtils.formatDate(failTime,"yyyy-MM-dd HH:mm:ss"));
		m.put("zhizhengTime",zhizhengTime==null?null:DateUtils.formatDate(zhizhengTime,"yyyy-MM-dd HH:mm:ss"));

		m.put("idNumberPicHead",this.idNumberPicHead);
		m.put("idNumberPicFore",this.idNumberPicFore);
		m.put("idNumberPicBack",this.idNumberPicBack);

		return m;
	}

	public Integer getUploadJkz() {
		return uploadJkz;
	}

	public void setUploadJkz(Integer uploadJkz) {
		this.uploadJkz = uploadJkz;
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