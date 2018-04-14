/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.annotation.SequenceBean;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.ReflectionUtils;
import com.thinkgem.jeesite.common.utils.Reflections;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.SequenceDefineDao;
import com.thinkgem.jeesite.modules.sys.entity.SequenceDefine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * 日志Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class SequenceDefineService extends CrudService<SequenceDefineDao, SequenceDefine> {

	// 静态遍历
	private static List<Class> lstSequenceBean;

	private static List<Method> lstSeqMethods;

	@Autowired
	private SequenceDefineDao sequenceDefineDao;

	/**
	 * 列出序列编号定义
	 * 1 从注解中读取所有的序列定义
	 * 2 从数据库中读取对应的定义
	 * @return
	 */
	@Override
	public List<SequenceDefine> findList(SequenceDefine sequenceDefine){

		if(lstSequenceBean==null) {
			lstSequenceBean = ReflectionUtils.listClassByAnnotations("com.thinkgem.jeesite.modules", SequenceBean.class);
		}

		if(lstSeqMethods==null) {
			lstSeqMethods=new ArrayList();
			// 循环所有类中的 ExpressSequence 注解方法
			for (Class clz : lstSequenceBean) {
				List<Method> ms = Reflections.getMethodsByAnnonation(clz, ExpressSequence.class);
				if (ms != null) {
					lstSeqMethods.addAll(ms);
				}
			}
		}

		// 序列号定义列表，先从注解上获得
		List<SequenceDefine> lstSeqDefine=new ArrayList();
		for(Method m:lstSeqMethods){
			SequenceDefine sd=new SequenceDefine();

			String clzName=m.getDeclaringClass().getName();
			String methodName=m.getName();

			ExpressSequence ann = m.getAnnotation(ExpressSequence.class);
			String annExpress=ann.express();
			String annDescribe=ann.describe();

			sd.setClassName(clzName);
			sd.setMethodName(methodName);
			sd.setAnnExpress(annExpress);
			sd.setAnnDescribe(annDescribe);
			lstSeqDefine.add(sd);

		}

		// 从数据库中读取所有的列表
		List<SequenceDefine> lst1 = sequenceDefineDao.findAllList(null);

		// 两个列表合并到一起
		for(SequenceDefine sd:lstSeqDefine){
			for(SequenceDefine sd2:lst1){
				if(sd.getClassName().equals(sd2.getClassName())&&sd.getMethodName().equals(sd2.getMethodName())){
					sd.setId(sd2.getId());
					sd.setCustomExpress(sd2.getCustomExpress());
					continue;
				}
			}
		}

		return lstSeqDefine;
	}

	/**
	 * 根据类名和方法名查找序列编号定义
	 * @param sequenceDefine
	 * @return
	 */
	public SequenceDefine getByClassMethod(SequenceDefine sequenceDefine){

		if(sequenceDefine==null){
			return null;
		}

		List<SequenceDefine> lst = findList(sequenceDefine);
		if(lst==null){
			return null;
		}
		for(SequenceDefine sd:lst){
			if(sd.getClassName().equals(sequenceDefine.getClassName())||sd.getMethodName().equals(sequenceDefine.getMethodName())){
				return sd;
			}
		}
		return null;
	}

	public SequenceDefine getByClassMethod(Class clz,String methodName){

		if(clz==null){
			return null;
		}

		String className=clz.getName();
		SequenceDefine sd=new SequenceDefine();
		sd.setClassName(className);
		sd.setMethodName(methodName);

		return getByClassMethod(sd);

	}
}
