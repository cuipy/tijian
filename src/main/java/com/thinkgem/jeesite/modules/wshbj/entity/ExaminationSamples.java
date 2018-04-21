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

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 体检样本Entity
 * @author zhxl
 * @version 2018-03-25
 */
public class ExaminationSamples extends DataEntity<ExaminationSamples> {
	
	private static final long serialVersionUID = 1L;
	private String recordId;		// 检查记录
	private String recordItemId;		// 检查记录项目id
	private String examinationCode;		// 体检记录编号
	private String code;		// 编号
	private String itemId;		// 项目id
	private String resultDictId;		// 结果id
	private String resultFlag;		// 体检合格标识：0-否，1-是
    private String resultRemarks;		// 体检结果备注
	private String userId;		// 体检用户
	private String owner;		// 所属体检中心
	private String examinationFlag;		// 1-初检，2-复检
	
	public ExaminationSamples() {
		super();
	}

	public ExaminationSamples(String id){
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
	
	@Length(min=0, max=50, message="编号长度必须介于 0 和 50 之间")
	@ExcelField(value="code",title="编号",type=0,sort=30)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=1, max=64, message="项目id长度必须介于 1 和 64 之间")
	@ExcelField(value="itemId",title="项目id",type=0,sort=40)
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	@Length(min=1, max=64, message="体检用户长度必须介于 1 和 64 之间")
	@ExcelField(value="userId",title="体检用户",type=0,sort=50)
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Length(min=0, max=64, message="所属体检中心长度必须介于 0 和 64 之间")
	@ExcelField(value="owner",title="所属体检中心",type=0,sort=120)
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	@Length(min=0, max=1, message="1-初检，2-复检长度必须介于 0 和 1 之间")
	@ExcelField(value="examinationFlag",title="1-初检，2-复检",type=0,sort=130)
	public String getExaminationFlag() {
		return examinationFlag;
	}

	public void setExaminationFlag(String examinationFlag) {
		this.examinationFlag = examinationFlag;
	}

	public String getResultDictId() {
		return resultDictId;
	}

	public void setResultDictId(String resultDictId) {
		this.resultDictId = resultDictId;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
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

	public String getRecordItemId() {
		return recordItemId;
	}

	public void setRecordItemId(String recordItemId) {
		this.recordItemId = recordItemId;
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
		if(StringUtils.isEmpty(this.code)){
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

	@JsonIgnore
	public ExaminationRecord getRecord(){
		ExaminationRecordService ers=SpringContextHolder.getBean(ExaminationRecordService.class);
		ExaminationRecord r = ers.get(recordId);

		return r;
	}

}