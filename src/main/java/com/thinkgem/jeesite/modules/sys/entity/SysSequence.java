/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 系统编号对象实体
 * @author cuipengyu
 * @version 2018-03-20
 */
public class SysSequence extends DataEntity<SysSequence> {

	private static final long serialVersionUID = 1L;


	/**
	 * 序列编号表达式
	 */
	private String express;

	private String seqTemp;

	private Integer seqVal;

	public SysSequence(){
		super();
	}

	public SysSequence(String id){
		super(id);
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public String getSeqTemp() {
		return seqTemp;
	}

	public void setSeqTemp(String seqTemp) {
		this.seqTemp = seqTemp;
	}

	public Integer getSeqVal() {
		return seqVal;
	}

	public void setSeqVal(Integer seqVal) {
		this.seqVal = seqVal;
	}
}