package com.thinkgem.jeesite.modules.wshbj.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.HttpRequestUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
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
 *
 * @author wangjiawei
 * @version 2018-07-23
 */
@Service
public class GlobalUploadService extends CrudService<ZhizhengAddRecordDao, ZhizhengAddRecord> {

    private String salt="pingbukeji1234";

    @Autowired
    private ZhizhengAddRecordDao zhizhengAddRecordDao;

    @Transactional(readOnly = false)
    public int doUpload() {
        String ownerId = GlobalSetUtils.getGlobalSet().getOwner();
        String token = GlobalSetUtils.getGlobalSet().getToken();
        String centerName = GlobalSetUtils.getGlobalSet().getCenterName();

        Map<String, String> params = new HashMap();

        params.put("ownerId", ownerId);
        params.put("token", token);

        // 获取最后一条 制证数的记录
        List<ZhizhengAddRecord> lst = zhizhengAddRecordDao.getLast2();
        if(lst!=null&&lst.size()>0){
            ZhizhengAddRecord record=lst.get(0);
            String lastAddCode = record.getAddCode();
            Integer lastResultCount=record.getResultCount();

            params.put("lastAddCode", lastAddCode);

        }

        String url = Global.getCenterServerUrl() + "/rest/jkz/find";
        try {
            RequestResult rr = HttpRequestUtils.doHttpsPost(url, params);

            logger.info(JSON.toJSONString(rr));

            if ( rr.getState() == 1) {

                if(rr.getData() == null ){
                    logger.warn("在获取新增的制证数编码是，未能获得data参数");
                    return 0;
                }

                Map<String, Object> data = ((JSONObject) rr.getData()).getInnerMap();
                Object newAddCode = data.get("addCode");

                if(newAddCode == null){
                    logger.warn("在获取新增的制证数编码时，未能获得addCode参数");
                    return 0;
                }

                Object addCount = data.get("addCount");
                if(addCount == null){
                    logger.warn("在获取新增的制证数编码时，未能获得addCount参数");
                    return 0;
                }

                Integer newAddCount = Integer.parseInt(data.get("addCount").toString());

                String newAddCode2 = buildNewCode(ownerId, newAddCount);

                if (newAddCode.equals(newAddCode2)) {
                    addCode(ownerId, newAddCode2 , newAddCount);
                }else{
                    logger.warn("从服务器端获取的编码是无效的，无法增加制证数量");
                }
            }else{
                logger.debug("state:"+rr.getState()+"  msg:"+rr.getMsg() );
            }
        } catch (Exception e) {
            logger.error("在获取新增的制证数量的时候，出现了错误，可能是无法与运营端链接");
        }
        return 1;
    }


    /**
     * 减一可制证次数
     *
     * @return
     */
    @Transactional(readOnly = false)
    public void decrementZhizhengCount(String ownerId) {
        List<ZhizhengAddRecord> lst = this.dao.getLast2();
        if (lst != null && lst.size() > 0) {
            Integer count = lst.get(0).getResultCount();
            String newCode = buildNewCode(ownerId, -count);
            addCode(ownerId, newCode, -count);
        }

    }

    /**
     * 生成新的add_code
     *
     * @param addCount
     * @return
     */
    public String buildNewCode(String ownerId, Integer addCount) {

        String lastAddCode = "";
        Integer currResultCount = 0;

        // 1 获取最后一次 add_code
        List<ZhizhengAddRecord> lst = this.dao.getLast2();
        if (lst != null && lst.size() > 0) {
            ZhizhengAddRecord record = lst.get(0);
            lastAddCode = record.getAddCode();
            currResultCount = record.getResultCount();
        }

        if(addCount == 0 ){
            return null;
        }

        Integer resultCount = currResultCount + addCount;
        // 2 组装新的add_code  ownerId+ 最后一次add_code + 可制证数量 + salt + 结果数量 => md5加密
        String newCodeMing = ownerId + lastAddCode + currResultCount + salt + resultCount;
        String newCode = Encodes.md5(newCodeMing);

        return newCode;
    }


    /**
     * 新增code和制证数量
     *
     * @param newCode
     * @param addCount
     * @return
     */
    @Transactional(readOnly = false)
    public boolean addCode(String ownerId, String newCode, Integer addCount) {
        Integer currResultCount = 0;

        // 1 获取最后一次 add_code
        List<ZhizhengAddRecord> lst = this.dao.getLast2();
        if (lst != null && lst.size() > 0) {
            ZhizhengAddRecord record = lst.get(0);
            currResultCount = record.getResultCount();
        }

        ZhizhengAddRecord record = new ZhizhengAddRecord();
        record.setAddCode(newCode);
        record.setAddCount(addCount);
        record.setResultCount(currResultCount + addCount);
        record.setUpdateTime(new java.util.Date());
        record.setUpdateType(1);

        super.save(record);
        return true;
    }
}
