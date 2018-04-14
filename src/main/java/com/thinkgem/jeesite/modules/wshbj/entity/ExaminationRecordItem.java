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
	private String itemName;		// 项目
	private String needSamples;		//是否需要样本：0-否，1-是
	private String sampleCode;		// 样本编号
	private String resultDictId;		// 体检结果
	private String resultDictName;		// 体检结果
	private String resultFlag;		// 体检合格标识：0-否，1-是
	private String resultRemarks;		// 体检结果备注
	private String examinationFlag;		// 1-初检，2-复检
	private String lastFlag; //本次检查记录中同项目最后一次检查标识：0-否，1-是
	
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

	public String getExaminationFlag() {
		return examinationFlag;
	}

	public void setExaminationFlag(String examinationFlag) {
		this.examinationFlag = examinationFlag;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getNeedSamples() {
		return needSamples;
	}

	public void setNeedSamples(String needSamples) {
		this.needSamples = needSamples;
	}

	public String getSampleCode() {
		return sampleCode;
	}

	public void setSampleCode(String sampleCode) {
		this.sampleCode = sampleCode;
	}

	public String getResultDictName() {
		return resultDictName;
	}

	public void setResultDictName(String resultDictName) {
		this.resultDictName = resultDictName;
	}

	public String getResultFlag() {
		return resultFlag;
	}

	public void setResultFlag(String resultFlag) {
		this.resultFlag = resultFlag;
	}

	public String getResultRemarks() {
		return resultRemarks;
	}

	public void setResultRemarks(String resultRemarks) {
		this.resultRemarks = resultRemarks;
	}

	public String getLastFlag() {
		return lastFlag;
	}

	public void setLastFlag(String lastFlag) {
		this.lastFlag = lastFlag;
	}
}