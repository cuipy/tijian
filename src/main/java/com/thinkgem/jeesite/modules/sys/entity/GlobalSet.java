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

	public GlobalSet() {
		super();
	}

	public GlobalSet(String id){
		super(id);
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
}