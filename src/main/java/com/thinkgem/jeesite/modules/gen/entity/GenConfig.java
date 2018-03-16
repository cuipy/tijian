/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.gen.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 生成方案Entity
 * @author ThinkGem
 * @version 2013-10-15
 */
@XmlRootElement(name="config")
public class GenConfig implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private List<GenCategory> categoryList;	// 代码模板分类
	private List<Dict> javaTypeList;		// Java类型
	private List<Dict> queryTypeList;		// 查询类型
	private List<ShowTypeDict> showTypeList;		// 显示类型

	public GenConfig() {
		super();
	}

	@XmlElementWrapper(name = "category")
	@XmlElement(name = "category")
	public List<GenCategory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<GenCategory> categoryList) {
		this.categoryList = categoryList;
	}

	@XmlElementWrapper(name = "javaType")
	@XmlElement(name = "dict")
	public List<Dict> getJavaTypeList() {
		return javaTypeList;
	}

	/**
	 * 读取原生的java类
	 * @return
	 */
	public List<Dict> getNativeJavaTypeList(){
		List<Dict> lst=getJavaTypeList();
		List<Dict> lst2=new ArrayList();

		for(Dict d:lst){
			String val=d.getValue();
			if(val.equals("This")||val.equals("Custom")){
				continue;
			}
			if(val.startsWith("com.thinkgem.jeesite")){
				continue;
			}
			lst2.add(d);
		}

		return lst2;
	}

	public void setJavaTypeList(List<Dict> javaTypeList) {
		this.javaTypeList = javaTypeList;
	}

	@XmlElementWrapper(name = "queryType")
	@XmlElement(name = "dict")
	public List<Dict> getQueryTypeList() {
		return queryTypeList;
	}

	public void setQueryTypeList(List<Dict> queryTypeList) {
		this.queryTypeList = queryTypeList;
	}

	@XmlElementWrapper(name = "showType")
	@XmlElement(name = "dict")
	public List<ShowTypeDict> getShowTypeList() {
		return showTypeList;
	}

	public void setShowTypeList(List<ShowTypeDict> showTypeList) {
		this.showTypeList = showTypeList;
	}

	public ShowTypeDict findShowTypeByValue(String value){
		for(ShowTypeDict d:getShowTypeList()){
			if(d.getValue().equals(value)){
				return d;
			}
		}
		return null;
	}
	
}