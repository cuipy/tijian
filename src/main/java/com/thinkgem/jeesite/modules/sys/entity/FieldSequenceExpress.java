/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 字段序列生成的表达式
 * @author cuipengyu
 * @version 2018-03-20
 */
public class FieldSequenceExpress extends DataEntity<FieldSequenceExpress> {

	private static final long serialVersionUID = 1L;

	/**
	 * 表名
	 */
	private String tableName;

	/**
	 * 字段名
	 */
	private String fieldName;

	/**
	 * 序列生成表达式
	 */
	private String sequenceExpress;

	public FieldSequenceExpress(){
		super();
	}

	public FieldSequenceExpress(String id){
		super(id);
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getSequenceExpress() {
		return sequenceExpress;
	}

	public void setSequenceExpress(String sequenceExpress) {
		this.sequenceExpress = sequenceExpress;
	}
}