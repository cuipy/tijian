/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationRecordService;
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
	private String specimenId;		// 体检标本类型ID  最终样本编号的specimenId必须与这个一致
	private String sampleCode;		// 样本编号
	private String resultDictId;		// 体检结果
	private String resultDictName;		// 体检结果
	private String resultFlag;		// 体检合格标识：0-否，1-是
	private String resultRemarks;		// 体检结果备注
	private String examinationFlag;		// 1-初检，2-复检
	private String lastFlag; //本次检查记录中同项目最后一次检查标识：0-否，1-是

	private String userName;     // 体检用户姓名
	
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

	@Length(min=1, max=64, message="体检样本id的长度必须介于 1 和 64 之间")
	public String getSpecimenId() {
		return specimenId;
	}

	public void setSpecimenId(String specimenId) {
		this.specimenId = specimenId;
	}

	public String getRecordUserName(){
		ExaminationRecord r = getRecord();
		if(r!=null){
			return r.getName();
		}
		return "";
	}

	public String getRecordOrganName(){
		ExaminationRecord r = getRecord();
		if(r!=null){
			return r.getOrganName();
		}
		return "";
	}

	/**
	 * 样本采集及处理状态  0 未采集  1 采集但未出结果 2 不合格 3合格  10 其他情况
	 * @return
	 */
	public Integer getStatus(){
		int res=10;
		if(StringUtils.isEmpty(this.sampleCode)){
			res=0;
		}else{
			if(StringUtils.isEmpty(resultFlag)){
				res=1;
			}else if("0".equals(resultFlag)){
				res = 2;
			}else  if("1".equals(resultFlag)){
				res = 3;
			}
		}

		return res;
	}

	public String getStrStatus(){
		int res=getStatus();
		String strRes="";
		switch (res){
			case 0:
				strRes="未采集";
				break;
			case 1:
				strRes="未出结果";
				break;

			case 2:
				strRes="不合格";
				break;
			case 3:
				strRes="合格";
				break;
			case 10:
				strRes="其他情况";
				break;
		}

		return strRes;

	}

	public String getStrExaminationFlag(){
		String flag = getExaminationFlag();

		if("1".equals(flag)){
			return "初检";
		}
		if("2".equals(flag)){
			return "复检";
		}
		return "未定义";
	}

	public String getExaminationCode(){
		ExaminationRecord record = getRecord();
		if(record==null){
			return "";
		}
		return record.getCode();
	}

	@JsonIgnore
	public ExaminationRecord getRecord(){
		ExaminationRecordService ers=SpringContextHolder.getBean(ExaminationRecordService.class);
		ExaminationRecord r = ers.get(recordId);

		return r;
	}

//	@JsonIgnore
//	public User getRecordUser(){
//		ExaminationRecord record = getRecord();
//
//		if(record==null){
//			return null;
//		}
//		return record.getUser();
//	}

	public String getRecordUserId(){
		ExaminationRecord record = getRecord();

		if(record==null){
			return "";
		}
		return record.getName();
	}

	public String getRecordUserSex(){
		ExaminationRecord record = getRecord();

		if(record==null){
			return "";
		}
		return record.getSex();
	}

	public String getRecordUserStrSex(){
		ExaminationRecord record = getRecord();

		if(record==null){
			return "";
		}
		return record.getStrSex();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}