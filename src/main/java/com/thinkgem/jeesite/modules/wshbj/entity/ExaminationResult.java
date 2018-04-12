/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检结果Entity
 * @author zhxl
 * @version 2018-03-25
 */
public class ExaminationResult extends DataEntity<ExaminationResult> {
	
	private static final long serialVersionUID = 1L;
	private String examinationCode;		// 体检编号
	private String sampleCode;		// 样本编号
	private String itemName;		// 项目
	private String itemId;		// 项目id
	private User userId;		// 体检用户
	private String resultDictId;		// 体检结果
	private String resultFlag;		// 体检合格标识：0-否，1-是
	private String owner;		// 所属体检中心
	
	public ExaminationResult() {
		super();
	}

	public ExaminationResult(String id){
		super(id);
	}

	@Length(min=0, max=50, message="体检编号长度必须介于 0 和 50 之间")
	@ExcelField(value="examinationCode",title="体检编号",type=0,sort=20)
	public String getExaminationCode() {
		return examinationCode;
	}

	public void setExaminationCode(String examinationCode) {
		this.examinationCode = examinationCode;
	}
	
	@Length(min=0, max=50, message="样本编号长度必须介于 0 和 50 之间")
	@ExcelField(value="sampleCode",title="样本编号",type=0,sort=30)
	public String getSampleCode() {
		return sampleCode;
	}

	public void setSampleCode(String sampleCode) {
		this.sampleCode = sampleCode;
	}
	
	@Length(min=1, max=100, message="项目长度必须介于 1 和 100 之间")
	@ExcelField(value="itemName",title="项目",type=0,sort=40)
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	@Length(min=1, max=64, message="项目id长度必须介于 1 和 64 之间")
	@ExcelField(value="itemId",title="项目id",type=0,sort=50)
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	@NotNull(message="体检用户不能为空")
	@ExcelField(value="userId",title="体检用户",type=0,sort=60)
	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}
	
	@Length(min=1, max=64, message="体检结果长度必须介于 1 和 64 之间")
	@ExcelField(value="resultDictId",title="体检结果",type=0,sort=70)
	public String getResultDictId() {
		return resultDictId;
	}

	public void setResultDictId(String resultDictId) {
		this.resultDictId = resultDictId;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=140)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getResultFlag() {
		return resultFlag;
	}

	public void setResultFlag(String resultFlag) {
		this.resultFlag = resultFlag;
	}
}