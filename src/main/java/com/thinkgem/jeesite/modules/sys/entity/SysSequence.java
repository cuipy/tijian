/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 区域Entity
 * @author ThinkGem
 * @version 2013-05-15
 */
public class SysSequence extends DataEntity<SysSequence> {

	private static final long serialVersionUID = 1L;

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