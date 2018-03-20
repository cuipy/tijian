package com.thinkgem.jeesite.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * bean中文名注解
 */
@Target(ElementType.METHOD)  
@Retention(RetentionPolicy.RUNTIME)  
public @interface ExpressSequence {

    /**
     * 语法格式  XXX{日期格式}[长度]
     *   XXX 任意字符串
     *   {日期格式}  支持SimpleDateFormat支持的日期格式
     *   [长度]  顺序号，生成指定长度的序列号
     * @return
     */
	String express();
	
}
