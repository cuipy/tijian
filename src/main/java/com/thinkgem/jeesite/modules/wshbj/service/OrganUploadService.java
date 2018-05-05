/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.common.utils.HttpResponseUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.OrganDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Organ;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 体检单位Service
 * @author zhxl
 * @version 2018-03-12
 */
@Service
public class OrganUploadService extends CrudService<OrganDao, Organ> {

	@Transactional(readOnly = false)
	public int doUpload(Organ organ){
		String ownerId=GlobalSetUtils.getGlobalSet().getOwner();
		String token=GlobalSetUtils.getGlobalSet().getToken();

		Map<String,String> params= new HashMap();

		params.put("ownerId",ownerId);
		params.put("token",token);
		params.put("id",organ.getId());
		params.put("code",organ.getCode());
		params.put("name",organ.getName());
		params.put("owner",organ.getOwner());
		params.put("ownerName",organ.getOwnerName());

		String url = Global.getCenterServerUrl()+"/rest/organ/save";

		RequestResult rr = HttpRequestUtils.doPost(url, params);
		if(rr!=null&&rr.getState()==1){
			updateUploadDate(organ);
		}

		return 1;
	}

	public List<Organ> listNeedUpload(Organ organ) {
 		return dao.listNeedUpload(organ);
	}

	@Transactional(readOnly = false)
	public void updateUploadDate(Organ organ) {
		dao.updateUploadDate(organ);
	}
	
}