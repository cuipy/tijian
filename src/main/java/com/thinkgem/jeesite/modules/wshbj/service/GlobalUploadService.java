package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.modules.sys.entity.GlobalSet;
import com.thinkgem.jeesite.modules.sys.utils.GlobalSetUtils;
import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;
import com.thinkgem.jeesite.modules.wshbj.dao.ExaminationRecordDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ZhizhengAddRecordDao;
import com.thinkgem.jeesite.modules.wshbj.entity.ExaminationRecord;
import com.thinkgem.jeesite.modules.wshbj.entity.Jkz;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */

/**
 * 健康证Service
 * @author wangjiawei
 * @version 2018-07-23
 */
@Service
public class GlobalUploadService extends CrudService<ZhizhengAddRecordDao, ZhizhengAddRecord> {



    @Transactional(readOnly = false)
     public int doUpload( ){
         String ownerId=GlobalSetUtils.getGlobalSet().getOwner();
        String token=GlobalSetUtils.getGlobalSet().getToken();
        String centerName=GlobalSetUtils.getGlobalSet().getCenterName();

        Map<String,String> params= new HashMap();

        params.put("ownerId",ownerId);
        params.put("token",token);
        //从examinationRecord查出健康证jkz需要的信息然后存入实体类
        Jkz jkz =new Jkz();
        params.putAll(jkz.getMap());

          String url = Global.getCenterServerUrl()+"/rest/jkz/find";
        try{
                RequestResult rr = HttpRequestUtils.doHttpsPost(url, params);

                if(rr!=null&&rr.getMsg().equals("2")){
                    decrementZhizhengCount(ownerId );
                }
        }catch (Exception e){
                System.out.println("无法与运营端链接");
            }
        return 1;
    }



    /**
     * 减一可制证次数
     * @return
     */
    @Transactional(readOnly = false)
    public void decrementZhizhengCount(String ownerId ){
        List<ZhizhengAddRecord> lst = this.dao.getLast2();
        if(lst!=null&&lst.size()>0){
            Integer count=  lst.get(0).getResultCount();
            String newCode=buildNewCode(ownerId,-count);
            addCode(ownerId,newCode,-count);
        }

    }

    /**
     * 生成新的add_code
     * @param addCount
     * @return
     */
    public String buildNewCode(String ownerId,Integer addCount){

        String lastAddCode="";
        Integer currResultCount=0;

        // 1 获取最后一次 add_code
        List<ZhizhengAddRecord> lst = this.dao.getLast2();
        if(lst!=null&&lst.size()>0){
            ZhizhengAddRecord record=lst.get(0);
            lastAddCode = record.getAddCode();
            currResultCount=record.getResultCount();
        }

        Integer resultCount = currResultCount+addCount;
        // 2 组装新的add_code  ownerId+ 最后一次add_code + 可制证数量 + salt + 结果数量 => md5加密
        String newCodeMing  = ownerId + lastAddCode + currResultCount+"pingbukeji1234"+resultCount;
        String newCode = Encodes.md5(newCodeMing);

        return newCode;
    }


    /**
     * 新增code和制证数量
     * @param newCode
     * @param addCount
     * @return
     */
    @Transactional(readOnly = false)
    public boolean addCode(String ownerId,String newCode,Integer addCount){
        Integer currResultCount=0;

        // 1 获取最后一次 add_code
        List<ZhizhengAddRecord> lst =this.dao.getLast2();
        if(lst!=null&&lst.size()>0){
            ZhizhengAddRecord record=lst.get(0);
            currResultCount=record.getResultCount();
        }

        ZhizhengAddRecord record=new ZhizhengAddRecord();
        record.setAddCode(newCode);
        record.setAddCount(addCount);
        record.setResultCount(currResultCount+addCount);
        record.setUpdateTime(new java.util.Date());
        record.setUpdateType(1);

        super.save(record);
        return true;
    }
}
