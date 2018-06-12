/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.service.OfficeService;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

import javax.validation.constraints.NotNull;

/**
 * 全局参数配置Entity
 * @author cuipengyu
 * @version 2018-04-18
 */
public class GlobalSet extends DataEntity<GlobalSet> {
	
	private static final long serialVersionUID = 1L;
	private String codePre;		// 当前体检中心编号前缀
	private String token;		// 体检中心token

	private String printCardCount;					// 可制证次数

	private String mingPrintCardCount;				// 可制证次数

	private Integer sampleCodeCreatePoint;			// 样本编号生成阶段  1 创建体检记录时生成体检编号；2 在取样的时候生成样本编号

	private Integer sampleCodePrintPoint;			// 样本编号打印阶段  sampleCodeCreatePoint == 1 的时候生效  1 创建体检记录阶段打印  2 取样的时候打印


	public GlobalSet() {
		super();
	}

	public GlobalSet(String id){
		super(id);
	}

	public Integer getSampleCodeCreatePoint() {
		return sampleCodeCreatePoint;
	}

	public void setSampleCodeCreatePoint(Integer sampleCodeCreatePoint) {
		this.sampleCodeCreatePoint = sampleCodeCreatePoint;
	}

	public Integer getSampleCodePrintPoint() {
		return sampleCodePrintPoint;
	}

	public void setSampleCodePrintPoint(Integer sampleCodePrintPoint) {
		this.sampleCodePrintPoint = sampleCodePrintPoint;
	}

	public String getOwner() {

		OfficeService officeService=SpringContextHolder.getBean(OfficeService.class);
		Office company = officeService.getMyCompany();
		if(company==null){
			return "";
		}

		return company.getId();
	}


	
	@Length(min=0, max=16, message="当前体检中心编号前缀长度必须介于 0 和 16 之间")
	public String getCodePre() {
		return codePre;
	}

	public void setCodePre(String codePre) {
		this.codePre = codePre;
	}
	
	public String getCenterName() {
		OfficeService officeService=SpringContextHolder.getBean(OfficeService.class);
		Office company = officeService.getMyCompany();
		if(company==null){
			return "";
		}

		return company.getName();
	}

	@Length(min=0, max=64, message="体检中心Token长度必须介于 0 和 32 之间")
	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPrintCardCount() {
		return printCardCount;
	}

	public void setPrintCardCount(String printCardCount) {
		this.printCardCount = printCardCount;
	}

	/**
	 * 可制证次数的明文，  体检中心id + 次数值  。
	 * @return
	 */
	public String getMingPrintCardCount() {



		return mingPrintCardCount;
	}
}