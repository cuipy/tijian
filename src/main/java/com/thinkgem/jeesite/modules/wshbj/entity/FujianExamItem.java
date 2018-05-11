/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.entity;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 检查项目Entity
 * @author zhxl
 * @version 2018-03-07
 */
public class FujianExamItem extends DataEntity<FujianExamItem> {

	private static final long serialVersionUID = 1L;
	private String mainId;		// 主体检项目id
	private String fujianId;		// 复检项目id


	public FujianExamItem() {
		super();
	}

	public FujianExamItem(String id){
		super(id);
	}

	public String getMainId() {
		return mainId;
	}

	public void setMainId(String mainId) {
		this.mainId = mainId;
	}

	public String getFujianId() {
		return fujianId;
	}

	public void setFujianId(String fujianId) {
		this.fujianId = fujianId;
	}
}