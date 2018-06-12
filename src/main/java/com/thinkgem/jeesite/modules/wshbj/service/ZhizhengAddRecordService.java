package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.modules.wshbj.dao.SpecimenDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ZhizhengAddRecordDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ZhizhengAddRecordService  extends CrudService<ZhizhengAddRecordDao, ZhizhengAddRecord> {

    private String salt="pingbukeji1234";

    @Autowired
    private ZhizhengAddRecordDao zhizhengAddRecordDao;


    public ZhizhengAddRecord getLastRecord(){
        List<ZhizhengAddRecord> lst = zhizhengAddRecordDao.getLast2();
        if(lst!=null&&lst.size()>0){
            return lst.get(0);
        }

        return null;
    }


    /**
     * 减一可制证次数
     * @return
     */
    public Integer decrementZhizhengCount(String ownerId){

        List<ZhizhengAddRecord> lst = zhizhengAddRecordDao.getLast2();

        return 0;
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
        List<ZhizhengAddRecord> lst = zhizhengAddRecordDao.getLast2();
        if(lst!=null&&lst.size()>0){
            ZhizhengAddRecord record=lst.get(0);
            lastAddCode = record.getAddCode();
            currResultCount=record.getResultCount();
        }

        Integer resultCount = currResultCount+addCount;
        // 2 组装新的add_code  ownerId+ 最后一次add_code + 可制证数量 + salt + 结果数量 => md5加密
        String newCodeMing  = ownerId + lastAddCode + currResultCount+salt+resultCount;
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
        List<ZhizhengAddRecord> lst = zhizhengAddRecordDao.getLast2();
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
