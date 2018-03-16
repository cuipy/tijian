/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationItem;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationPackage;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationItemService;
import com.thinkgem.jeesite.modules.wshbj.service.ExaminationPackageService;
import com.thinkgem.jeesite.modules.wshbj.service.OrganService;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public class EntityUtils {
	
	private static OrganService organService = SpringContextHolder.getBean(OrganService.class);

	private static ExaminationPackageService packageService = SpringContextHolder.getBean(ExaminationPackageService.class);

	private static ExaminationItemService itemService = SpringContextHolder.getBean(ExaminationItemService.class);
	
	public static String getEntityName(String entityName, String id, String defaultValue){
		if (StringUtils.isBlank(entityName) || StringUtils.isBlank(id)){
			return defaultValue;
		}

		if (entityName.equals(Organ.class.getSimpleName())){
			Organ entity = organService.get(id);
			return  entity!=null?entity.getName():defaultValue;
		}else if (entityName.equals(ExaminationPackage.class.getSimpleName())){
			ExaminationPackage entity = packageService.get(id);
			return  entity!=null?entity.getName():defaultValue;
		}else if (entityName.equals(ExaminationItem.class.getSimpleName())){
			ExaminationItem entity = itemService.get(id);
			return  entity!=null?entity.getName():defaultValue;
		}
		return defaultValue;
	}

	
}
