/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.*;
import com.thinkgem.jeesite.modules.sys.entity.*;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * 全局配置单元
 * @author ThinkGem
 * @version 2013-12-05
 */
public class GlobalSetUtils {

	private static GlobalSetDao globalSetDao = SpringContextHolder.getBean(GlobalSetDao.class);

	public static GlobalSet getGlobalSet(){
		List<GlobalSet> lst = globalSetDao.findList(new GlobalSet());
		if(lst==null||lst.size()==0){
			return null;
		}

		return  lst.get(0);

	}

	
}
