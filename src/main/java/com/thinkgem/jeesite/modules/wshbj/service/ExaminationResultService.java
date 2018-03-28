/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationResult;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationResultDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;

/**
 * 体检结果Service
 * @author zhxl
 * @version 2018-03-25
 */
@Service
@Transactional(readOnly = true)
public class ExaminationResultService extends CrudService<ExaminationResultDao, ExaminationResult> {

	@Autowired
	private UserDao userDao;


	public ExaminationResult get(String id) {
		return super.get(id);
	}
	
	public List<ExaminationResult> findList(ExaminationResult examinationResult) {
		return super.findList(examinationResult);
	}
	
	public Page<ExaminationResult> findPage(Page<ExaminationResult> page, ExaminationResult examinationResult) {
		return super.findPage(page, examinationResult);
	}
	
	@Transactional(readOnly = false)
	public void save(ExaminationResult examinationResult) {

		// 如果外键对象的id没有值，则从外键对象的唯一值读取id值
		if(examinationResult.getUserId()!=null&&StringUtils.isEmpty(examinationResult.getUserId().getId())){
			List<String> uniqFields=examinationResult.getUserId().getUniqueFields();

			for(String fieldName:uniqFields){
				String methodName="get"+StringUtils.upCaseFirst(fieldName);
                User userId1=null;

                try {
                    Method method = userDao.getClass().getMethod(methodName, User.class);
                    userId1= (User) method.invoke(userDao,examinationResult.getUserId());
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

		        if(userId1!=null){
		            examinationResult.getUserId().setId(userId1.getId());
		            break;
                }
            }
		}


		super.save(examinationResult);
	}
	
	@Transactional(readOnly = false)
	public void delete(ExaminationResult examinationResult) {
		super.delete(examinationResult);
	}

	protected ExaminationResult refreshBean(ExaminationResult examinationResult) {

		// 如果外键对象的id没有值，则从外键对象的唯一值读取id值
		if(examinationResult.getUserId()!=null&&StringUtils.isEmpty(examinationResult.getUserId().getId())){
			List<String> uniqFields=examinationResult.getUserId().getUniqueFields();

			for(String fieldName:uniqFields){
				String methodName="get"+StringUtils.upCaseFirst(fieldName);
                User userId1=null;

                try {
                    Method method = userDao.getClass().getMethod(methodName, User.class);
                    userId1= (User) method.invoke(userDao,examinationResult.getUserId());
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

		        if(userId1!=null){
		            examinationResult.getUserId().setId(userId1.getId());
		            break;
                }
            }
		}

		return examinationResult;
	}
	
}