/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.wshbj.dao.PackageItemDao;
import com.thinkgem.jeesite.modules.wshbj.service.PackageItemService;
import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检套餐Entity
 * @author zhxl
 * @version 2018-03-12
 */
public class ExaminationPackage extends DataEntity<ExaminationPackage> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String namePinyin;
	private String price;		// 价格
	private String categoryId;		// 检查大类
	private String referenceFlag;		// 参考标识：0-否，1-是
	private String owner;		// 所属体检中心

	private List<PackageItem> packageItemList = Lists.newArrayList();		// 子表列表

	private Integer orderNumb;

	public Integer getOrderNumb() {
		return orderNumb;
	}

	public void setOrderNumb(Integer orderNumb) {
		this.orderNumb = orderNumb;
	}

	public ExaminationPackage() {
		super();
	}

	public ExaminationPackage(String id){
		super(id);
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="价格长度必须介于 0 和 100 之间")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=1, max=64, message="检查大类长度必须介于 1 和 64 之间")
	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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
	public List<PackageItem> getPackageItemList() {
		return packageItemList;
	}

	public void setPackageItemList(List<PackageItem> packageItemList) {
		this.packageItemList = packageItemList;
	}

	@JsonIgnore
	public List<PackageItem> getItems(){
		PackageItemService packageItemService=SpringContextHolder.getBean(PackageItemService.class);
		if(packageItemService!=null){
			PackageItem pi=new PackageItem();
			pi.setPackageId(id);
			List<PackageItem> lst = packageItemService.findList(pi);
			return lst;
		}
		return null;
	}
}