/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

import java.sql.Date;
import java.util.List;
import java.util.Map;

/**
 * 序列表操作类
 * @author cuipengyu
 * @version 2018-03-19
 */
public class SysSequenceUtils {

	/**
	 * 将表达式中{XXX}部分转换为真实的值
	 * @param express
	 * @return
	 */
	public static String toTemplate(String express){
		if(StringUtils.isEmpty(express)){
			return "";
		}

		String res=express;


		// 替换表达式{***}中的内容
		// 获取{的位置，获取非{前的 } 的位置
		while(true) {

			if(!res.matches("^.*\\{.*\\}.*$")){
				break;
			}

			String strLeft = StringUtils.substringBefore(res, "{");
			String strAllRight = StringUtils.substringAfter(res, "{");
			String strExp = StringUtils.substringBefore(strAllRight, "}");
			Integer rightLen = res.length() - strLeft.length() - strExp.length() - 2;
			String strRight = StringUtils.right(res, rightLen);

			String strMiddle="";
			strMiddle = DateUtils.formatDate(new java.util.Date(), strExp);

			res=strLeft+strMiddle+strRight;
		}

		return res;

	}

	/**
	 * 将模板中的[5]
	 * @param template
	 * @param val
	 */
	public static String toSequence(String template,Integer val){
		if(StringUtils.isEmpty(template)){
			return "";
		}

		if(!template.matches(".*\\[\\d+\\].*")){
			System.out.println("aksjd撒打发");
			return template;
		}

		if(val==null||val<1){
			val=1;
		}

		Integer pos1=StringUtils.indexOf(template,"[");
		Integer pos2=StringUtils.indexOf(template,"]");
		String strLeft=StringUtils.substringBefore(template,"[");
		String strRight=StringUtils.substringAfter(template,"]");

		String strLen=StringUtils.substring(template,pos1+1,pos2);
		Integer len=Integer.valueOf(strLen);
		String strMiddle=StringUtils.leftPad(val.toString(),len,"0");

		return strLeft+strMiddle+strRight;

	}

	public static void main(String ... argis){

		System.out.println(toSequence("2e[8]ss",33));

	}

	
}
