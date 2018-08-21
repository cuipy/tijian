/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationUserDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationUser;
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
public class ExamUserUploadService extends CrudService<ExaminationUserDao, ExaminationUser> {

	@Transactional(readOnly = false)
	public int doUpload(ExaminationUser examinationUser){
		String ownerId=GlobalSetUtils.getGlobalSet().getOwner();
		String token=GlobalSetUtils.getGlobalSet().getToken();

		Map<String,String> params= new HashMap();

		params.put("ownerId",ownerId);
		params.put("token",token);
		params.putAll(examinationUser.getMap());

		String url = Global.getCenterServerUrl()+"/rest/exam_user/save";
		try {
			RequestResult rr = HttpRequestUtils.doHttpsPost(url, params);
			if(rr!=null&&rr.getState()==1){
				updateUploadDate(examinationUser);
			}
		}catch (Exception e){
			System.out.println("无法与运营端链接");
		}


		return 1;
	}

	public List<ExaminationUser> listNeedUpload(ExaminationUser examinationUser) {
 		return dao.listNeedUpload(examinationUser);
	}

	@Transactional(readOnly = false)
	public void updateUploadDate(ExaminationUser examinationUser) {
		dao.updateUploadDate(examinationUser);
	}
	
}