/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.annotation.ExpressSequence;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.SequenceDefineDao;
import com.thinkgem.jeesite.modules.sys.dao.SysSequenceDao;
import com.thinkgem.jeesite.modules.sys.entity.SequenceDefine;
import com.thinkgem.jeesite.modules.sys.entity.SysSequence;
import com.thinkgem.jeesite.modules.sys.utils.SysSequenceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Method;
import java.util.List;

/**
 * 日志Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class SequenceDefineService extends CrudService<SequenceDefineDao, SequenceDefine> {


	/**
	 * 列出序列编号定义
	 * 1 从注解中读取所有的序列定义
	 * 2 从数据库中读取对应的定义
	 * @return
	 */
	public List<SequenceDefine> list(){



		return null;

	}

	


	
}
