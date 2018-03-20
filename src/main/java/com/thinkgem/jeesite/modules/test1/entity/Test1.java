/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.common.annotation.Unique;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 测试1 描述Entity
 * @author 崔鹏宇
 * @version 2018-03-13
 */
public class Test1 extends DataEntity<Test1> {
	
	private static final long serialVersionUID = 1L;
	private String testNo;		// 测编号
	private String headImg;		// 头像
	private String title;		// 标题
	private String userPwd;		// 文档密码
	private String content;		// 内容
	private User auth;		// 作者id
	private String danwei;		// 发布单位
	
	public Test1() {
		super();
	}

	public Test1(String id){
		super(id);
	}

	@ExpressSequence(express="T1{yyyyMM}[8]")
	@Length(min=0, max=64, message="测编号必须介于 0 和 128 之间")
	@ExcelField(value="testNo",title="测编号",type=0,sort=8)
	public String getTestNo() {
		return testNo;
	}

	public void setTestNo(String testNo) {
		this.testNo = testNo;
	}

	@Length(min=0, max=128, message="头像长度必须介于 0 和 128 之间")
	@ExcelField(value="headImg",title="头像",type=0,sort=15)
	public String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	
	@Length(min=1, max=128, message="标题长度必须介于 1 和 128 之间")
	@ExcelField(value="title",title="标题",type=0,sort=20)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="文档密码长度必须介于 0 和 64 之间")
	@ExcelField(value="userPwd",title="文档密码",type=0,sort=25)
	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	@Length(min=1, max=20000, message="内容长度必须介于 1 和 20000 之间")
	@ExcelField(value="content",title="内容",type=0,sort=30)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@NotNull(message="作者id不能为空")
	@ExcelField(value="auth.id",title="作者id",type=0,sort=40)
	public User getAuth() {
		return auth;
	}

	public void setAuth(User auth) {
		this.auth = auth;
	}
	
	@ExcelField(value="auth.name",title="作者名",type=0,sort=42)
	public String getAuthName() {
		return getAuth().getName();
	}
	public void setAuthName(String _val) {
		if(null == getAuth()){ return; }getAuth().setName(_val);
	}
	@Unique
	@ExcelField(value="auth.no",title="作者工号",type=0,sort=45)
	public String getAuthNo() {
		return getAuth().getNo();
	}
	public void setAuthNo(String _val) {
		if(null == getAuth()){ return; }getAuth().setNo(_val);
	}
	@Length(min=0, max=64, message="发布单位长度必须介于 0 和 64 之间")
	@ExcelField(value="danwei",title="发布单位",type=0,sort=50)
	public String getDanwei() {
		return danwei;
	}

	public void setDanwei(String danwei) {
		this.danwei = danwei;
	}
	
}