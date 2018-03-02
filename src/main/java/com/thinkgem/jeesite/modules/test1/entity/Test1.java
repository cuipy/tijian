/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 测试一下从test1表生成类Entity
 * @author 崔鹏宇
 * @version 2018-03-03
 */
public class Test1 extends DataEntity<Test1> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 内容
	private String authName;		// 作者
	
	public Test1() {
		super();
	}

	public Test1(String id){
		super(id);
	}

	@Length(min=0, max=128, message="标题长度必须介于 0 和 128 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=20000, message="内容长度必须介于 0 和 20000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="作者长度必须介于 0 和 64 之间")
	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}
	
}