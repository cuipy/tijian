/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordItemDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecordItem;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 体检人员Service
 * @author cuipengyu
 * @version 2018-05-05
 */
@Service
public class ExaminationRecordItemUploadService extends CrudService<ExaminationRecordItemDao, ExaminationRecordItem> {

	@Transactional(readOnly = false)
	public int doUpload(ExaminationRecordItem examinationRecordItem){
		String ownerId=GlobalSetUtils.getGlobalSet().getOwner();
		String token=GlobalSetUtils.getGlobalSet().getToken();

		Map<String,String> params= new HashMap();

		params.put("ownerId",ownerId);
		params.put("token",token);
		params.putAll(examinationRecordItem.getMap());

		String url = Global.getCenterServerUrl()+"/rest/examination_record_item/save";

		RequestResult rr = HttpRequestUtils.doHttpPost(url, params);
		if(rr!=null&&rr.getState()==1){
			updateUploadDate(examinationRecordItem);
		}

		return 1;
	}

	public List<ExaminationRecordItem> listNeedUpload(ExaminationRecordItem examinationRecordItem) {
 		return dao.listNeedUpload(examinationRecordItem);
	}

	@Transactional(readOnly = false)
	public void updateUploadDate(ExaminationRecordItem examinationRecordItem) {
		dao.updateUploadDate(examinationRecordItem);
	}
	
}