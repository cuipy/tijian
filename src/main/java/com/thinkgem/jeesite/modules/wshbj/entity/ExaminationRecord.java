/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.annotation.SequenceBean;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.wshbj.constant.ExaminationRecordConstant;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationItemDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
import com.thinkgem.jeesite.modules.wshbj.service.IndustryService;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	private User user;		// 体检用户
	private String code;		// 编号
	private String name;		// 姓名
	private String phoneNumber;		// 联系电话
	private String sex;		// 性别
	private String industryId;		// 行业
	private String postId;		// 岗位
	private String birthday;		// 出生日期
	private String organId;		// 单位
	private String owner;		// 所属体检中心
	private String packageId;		// 体检套餐
	private String packagePrice;		// 套餐价格
	private String idNumber;		// 身份证号
	//体检状态：10-未体检完，20-体检不合格，30-复检合格，40-可制证，50-已制证
	private String status;
	private String itemType; 	//体检项目方式:1-体检套餐，2-自由选择

	/**
	 * 获取行业
	 * @return
	 */
	public Industry getIndustry(){
		IndustryService industryService = SpringContextHolder.getBean(IndustryService.class);
		return industryService.get(industryId);
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
	@ExcelField(value="user.id",title="体检用户",type=0,sort=20)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ExpressSequence(express="TJJL{yyyyMMmm}[5]",describe = "编号")
	@Length(min=1, max=50, message="编号长度必须介于 1 和 50 之间")
	@ExcelField(value="code",title="编号",type=0,sort=30)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=50, message="姓名长度必须介于 1 和 50 之间")
	@ExcelField(value="name",title="姓名",type=0,sort=40)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=45, message="联系电话长度必须介于 1 和 45 之间")
	@ExcelField(value="phoneNumber",title="联系电话",type=0,sort=50)
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@Length(min=1, max=64, message="性别长度必须介于 1 和 64 之间")
	@ExcelField(value="sex",title="性别",type=0,sort=60)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=64, message="行业长度必须介于 1 和 64 之间")
	@ExcelField(value="industryId",title="行业",type=0,sort=70)
	public String getIndustryId() {
		return industryId;
	}

	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}
	
	@Length(min=1, max=64, message="岗位长度必须介于 1 和 64 之间")
	@ExcelField(value="postId",title="岗位",type=0,sort=80)
	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}
	
	@Length(min=1, max=10, message="出生日期长度必须介于 1 和 10 之间")
	@ExcelField(value="birthday",title="出生日期",type=0,sort=90)
	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	@Length(min=1, max=64, message="单位长度必须介于 1 和 64 之间")
	@ExcelField(value="organId",title="单位",type=0,sort=100)
	public String getOrganId() {
		return organId;
	}

	public void setOrganId(String organId) {
		this.organId = organId;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=170)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=64, message="体检套餐长度必须介于 0 和 64 之间")
	@ExcelField(value="packageId",title="体检套餐",type=0,sort=180)
	public String getPackageId() {
		return packageId;
	}

	public void setPackageId(String packageId) {
		this.packageId = packageId;
	}
	
	@Length(min=0, max=64, message="套餐价格长度必须介于 0 和 64 之间")
	@ExcelField(value="packagePrice",title="套餐价格",type=0,sort=190)
	public String getPackagePrice() {
		return packagePrice;
	}

	public void setPackagePrice(String packagePrice) {
		this.packagePrice = packagePrice;
	}
	
	@Length(min=0, max=20, message="身份证号长度必须介于 0 和 20 之间")
	@ExcelField(value="idNumber",title="身份证号",type=0,sort=200)
	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	@Length(min=0, max=64, message="体检状态，对应examination_record_status字典长度必须介于 0 和 64 之间")
	@ExcelField(value="status",title="体检状态，对应examination_record_status字典",type=0,sort=210)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ExaminationRecordItem> getExaminationRecordItemList() {
		return examinationRecordItemList;
	}

	public List<ExaminationRecordItem> getItems() {
		if(itemListLoaded){
			return examinationRecordItemList;
		}

		if(StringUtils.isEmpty(getId())){
			return null;
		}

		itemListLoaded=true;

		ExaminationRecordItemDao examinationRecordItemDao=SpringContextHolder.getBean(ExaminationRecordItemDao.class);
		ExaminationRecordItem eri=new ExaminationRecordItem();
		eri.setRecordId(id);
		examinationRecordItemList = examinationRecordItemDao.findList(eri);
		return examinationRecordItemList;
	}

	public void setExaminationRecordItemList(List<ExaminationRecordItem> examinationRecordItemList) {
		this.examinationRecordItemList = examinationRecordItemList;
	}

	@Length(min=0, max=64, message="体检项目方式长度必须介于 0 和 64 之间")
	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}


	public String getSexStr(){
		return DictUtils.getDictLabel(sex,"sex","未设置");
	}

	public Set<String> getItemIds(){
		if(!ExaminationRecordConstant.ITEM_TYPE_2.equals(this.getItemType())||getItems()==null||getItems().size()<=0){
			return null;
		}

		Set<String> sets=new HashSet();
		for(ExaminationRecordItem ri:getItems()){
			sets.add(ri.getItemId());
		}
		return sets;
	}

}