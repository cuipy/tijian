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
 * 体检记录Entity
 * @author zhxl
 * @version 2018-03-17
 */
public class ExaminationRecordItem extends DataEntity<ExaminationRecordItem> {
	
	private static final long serialVersionUID = 1L;
	private String recordId;		// 检查记录 父类
	private String itemId;		// 检查项目
	private String resultDictId;		// 体检结果
	
	public ExaminationRecordItem() {
		super();
	}

	public ExaminationRecordItem(String id){
		super(id);
	}


	@Length(min=1, max=64, message="检查记录长度必须介于 1 和 64 之间")
	@ExcelField(value="recordId",title="检查记录",type=0,sort=20)
	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	@Length(min=1, max=64, message="检查项目长度必须介于 1 和 64 之间")
	@ExcelField(value="itemId",title="检查项目",type=0,sort=30)
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	
	@Length(min=1, max=64, message="体检结果长度必须介于 1 和 64 之间")
	@ExcelField(value="resultDictId",title="体检结果",type=0,sort=50)
	public String getResultDictId() {
		return resultDictId;
	}

	public void setResultDictId(String resultDictId) {
		this.resultDictId = resultDictId;
	}
	
}