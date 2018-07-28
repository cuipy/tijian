package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.Jkz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 健康证Service
 * @author wangjiawei
 * @version 2018-07-23
 */
@Service
public class JkzUploadService extends CrudService<ExaminationRecordDao, ExaminationRecord> {
    @Transactional(readOnly = false)

    public int doUpload(ExaminationRecord examinationRecord){
        String ownerId=GlobalSetUtils.getGlobalSet().getOwner();
        String token=GlobalSetUtils.getGlobalSet().getToken();
        String centerName=GlobalSetUtils.getGlobalSet().getCenterName();

        Map<String,String> params= new HashMap();

        params.put("ownerId",ownerId);
        params.put("token",token);
        //从examinationRecord查出健康证jkz需要的信息然后存入实体类
        Jkz jkz =new Jkz();
        jkz.setJkzCode(examinationRecord.getCode());
        jkz.setExamCenterOwner(examinationRecord.getOwner());
        jkz.setExamCenterName(centerName);
        jkz.setExamUserId(examinationRecord.getUser().getId());
        jkz.setExamUserName(examinationRecord.getName());
        jkz.setExamUserIdNumb(examinationRecord.getIdNumber());
        jkz.setExamUserPhoneNumb(examinationRecord.getPhoneNumber());
        jkz.setJkzTime(examinationRecord.getZhizhengTime());
        jkz.setDelFlag("0");
        params.putAll(jkz.getMap());

        String url = Global.getCenterServerUrl()+"/rest/jkz/save";

        RequestResult rr = HttpRequestUtils.doHttpsPost(url, params);
        //同步成功后改变本地标识 order_numb ：1是已经同步过的 0或者null 是没有同步的
        if(rr!=null&&rr.getState()==1){
            updateUploadDate(examinationRecord);
        }
        return 1;
    }
    //查询未同步过得健康证信息order_numb ：1是已经同步过的 0或者null 是没有同步的
    public List<ExaminationRecord> listJkzNeedUpload(ExaminationRecord examinationRecord) {
        return dao.listJkzNeedUpload(examinationRecord);
    }
    //改变同步成功的标识 order_numb ：1是已经同步过的 0或者null 是没有同步的
    @Transactional(readOnly = false)
    public void updateUploadDate(ExaminationRecord examinationRecord) {
         dao.updateOrderNumb(examinationRecord);
    }

}
