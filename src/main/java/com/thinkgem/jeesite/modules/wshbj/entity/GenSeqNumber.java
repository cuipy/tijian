/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 序列号生成Entity
 * @author zhxl
 * @version 2018-03-19
 */
public class GenSeqNumber extends DataEntity<GenSeqNumber> {
	
	private static final long serialVersionUID = 1L;
	private String noid;		// noid
	private String keyCode;		// key_code
	private String currVal;		// 当前值，取一个，增加一个
	
	public GenSeqNumber() {
		super();
	}

	public GenSeqNumber(String id){
		super(id);
	}

	@Length(min=1, max=32, message="noid长度必须介于 1 和 32 之间")
	@ExcelField(value="noid",title="noid",type=0,sort=10)
	public String getNoid() {
		return noid;
	}

	public void setNoid(String noid) {
		this.noid = noid;
	}
	
	@Length(min=1, max=32, message="key_code长度必须介于 1 和 32 之间")
	@ExcelField(value="keyCode",title="key_code",type=0,sort=20)
	public String getKeyCode() {
		return keyCode;
	}

	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}
	
	@Length(min=1, max=11, message="当前值，取一个，增加一个长度必须介于 1 和 11 之间")
	@ExcelField(value="currVal",title="当前值，取一个，增加一个",type=0,sort=30)
	public String getCurrVal() {
		return currVal;
	}

	public void setCurrVal(String currVal) {
		this.currVal = currVal;
	}
	
}