/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test1.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import com.thinkgem.jeesite.modules.sys.service.SysSequenceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test1.entity.Test1;
import com.thinkgem.jeesite.modules.test1.dao.Test1Dao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;

/**
 * 测试1 描述Service
 * @author 崔鹏宇
 * @version 2018-03-13
 */
@Service
@Transactional(readOnly = true)
public class Test1Service extends CrudService<Test1Dao, Test1> {

	@Autowired
	private UserDao userDao;

	@Autowired
	private SysSequenceService sysSequenceService;

	public Test1 get(String id) {
		return super.get(id);
	}
	
	public List<Test1> findList(Test1 test1) {
		return super.findList(test1);
	}
	
	public Page<Test1> findPage(Page<Test1> page, Test1 test1) {
		return super.findPage(page, test1);
	}
	
	@Transactional(readOnly = false)
	public void save(Test1 test1) {

		// 如果外键对象的id没有值，则从外键对象的唯一值读取id值
		if(test1.getAuth()!=null&&StringUtils.isEmpty(test1.getAuth().getId())){
			List<String> uniqFields=test1.getAuth().getUniqueFields();

			for(String fieldName:uniqFields){
				String methodName="get"+StringUtils.upCaseFirst(fieldName);
                User auth1=null;

                try {
                    Method method = userDao.getClass().getMethod(methodName, User.class);
                    auth1= (User) method.invoke(userDao,test1.getAuth());
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

		        if(auth1!=null){
		            test1.getAuth().setId(auth1.getId());
		            break;
                }
            }
		}

		// 如果是保存或编号为空，则生成编号
		if(test1.getIsNewRecord()||StringUtils.isEmpty(test1.getTestNo())){

			// 刷新获取新的顺序编号
			String newTestNo= sysSequenceService.nextSequence(Test1.class,"testNo");
			test1.setTestNo(newTestNo);
		}

		super.save(test1);
	}
	
	@Transactional(readOnly = false)
	public void delete(Test1 test1) {
		super.delete(test1);
	}

	protected Test1 refreshBean(Test1 test1) {

		// 如果外键对象的id没有值，则从外键对象的唯一值读取id值
		if(test1.getAuth()!=null&&StringUtils.isEmpty(test1.getAuth().getId())){
			List<String> uniqFields=test1.getAuth().getUniqueFields();

			for(String fieldName:uniqFields){
				String methodName="get"+StringUtils.upCaseFirst(fieldName);
                User auth1=null;

                try {
                    Method method = userDao.getClass().getMethod(methodName, User.class);
                    auth1= (User) method.invoke(userDao,test1.getAuth());
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

		        if(auth1!=null){
		            test1.getAuth().setId(auth1.getId());
		            break;
                }
            }
		}

		return test1;
	}
	
}