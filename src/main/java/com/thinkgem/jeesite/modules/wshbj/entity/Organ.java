/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检单位Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class Organ extends DataEntity<Organ> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	
	public Organ() {
		super();
	}

	public Organ(String id){
		super(id);
	}

	@Length(min=1, max=50, message="名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}