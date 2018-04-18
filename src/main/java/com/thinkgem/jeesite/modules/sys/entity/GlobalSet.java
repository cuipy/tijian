/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 全局参数配置Entity
 * @author cuipengyu
 * @version 2018-04-18
 */
public class GlobalSet extends DataEntity<GlobalSet> {
	
	private static final long serialVersionUID = 1L;
	private String owner;		// 所属的体检中心
	private String codePre;		// 当前体检中心编号前缀
	private String centerName;		// 体检中心名称，添加后，自动增加到部门的体检中心节点下
	
	public GlobalSet() {
		super();
	}

	public GlobalSet(String id){
		super(id);
	}

	@Length(min=1, max=64, message="所属的体检中心长度必须介于 1 和 64 之间")
	@ExcelField(value="owner",title="所属的体检中心",type=0,sort=20)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=16, message="当前体检中心编号前缀长度必须介于 0 和 16 之间")
	@ExcelField(value="codePre",title="当前体检中心编号前缀",type=0,sort=30)
	public String getCodePre() {
		return codePre;
	}

	public void setCodePre(String codePre) {
		this.codePre = codePre;
	}
	
	@Length(min=0, max=32, message="体检中心名称，添加后，自动增加到部门的体检中心节点下长度必须介于 0 和 32 之间")
	@ExcelField(value="centerName",title="体检中心名称，添加后，自动增加到部门的体检中心节点下",type=0,sort=40)
	public String getCenterName() {
		return centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	
}