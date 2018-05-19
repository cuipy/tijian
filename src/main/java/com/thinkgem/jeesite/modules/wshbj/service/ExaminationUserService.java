/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import java.util.List;

import com.thinkgem.jeesite.common.utils.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationUserDao;

/**
 * 体检用户Service
 * @author zhxl
 * @version 2018-03-07
 */
@Service
@Transactional(readOnly = true)
public class ExaminationUserService extends CrudService<ExaminationUserDao, ExaminationUser> {

	@Cacheable(value = "examinationUserCache",key="'examinationUser_get_'+#id")
	public ExaminationUser get(String id) {
		return super.get(id);
	}

	@Cacheable(value = "examinationUserCache",key="'examinationUser_getHeadImg_'+#id")
	public String getHeadImg(String id) {
		return dao.getHeadImg(id);
	}

	/**
	 * 根据身份证与体检中心查询体检用户
	 * @param idNumber
	 * @param owner
	 * @return
	 */
	@Cacheable(value = "examinationUserCache",key="'examinationUser_getByIdNumberAndOwner_'+#idNumber+#owner")
	public ExaminationUser getByIdNumberAndOwner(String idNumber,String owner){
		if (StringUtils.isBlank(idNumber) || StringUtils.isBlank(owner)){
			return null;
		}
		return this.dao.getByIdNumberAndOwner(idNumber,owner);
	}

	@Cacheable(value = "examinationUserCache",key="'examinationUser_findList_'+#examinationUser.likeField+#examinationUser.name+#examinationUser.code+#examinationUser.idNumber+#examinationUser.phoneNumber")
	public List<ExaminationUser> findList(ExaminationUser examinationUser) {
		return super.findList(examinationUser);
	}

	@Cacheable(value = "examinationUserCache",key="'examinationUser_findPage_'+#page.pageNo+#page.pageSize+#examinationUser.likeField" +
			"+#examinationUser.name+#examinationUser.code+#examinationUser.idNumber+#examinationUser.phoneNumber")
	public Page<ExaminationUser> findPage(Page<ExaminationUser> page, ExaminationUser examinationUser) {
		return super.findPage(page, examinationUser);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "examinationUserCache",allEntries = true)
	public void save(ExaminationUser examinationUser) {
		super.save(examinationUser);
	}
	
	@Transactional(readOnly = false)
	@CacheEvict(value = "examinationUserCache",allEntries = true)
	public void delete(ExaminationUser examinationUser) {
		super.delete(examinationUser);
	}
	
}