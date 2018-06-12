package com.thinkgem.jeesite.modules.wshbj.service;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.modules.wshbj.dao.SpecimenDao;
import com.thinkgem.jeesite.modules.wshbj.dao.ZhizhengAddRecordDao;
import com.thinkgem.jeesite.modules.wshbj.entity.Specimen;
import com.thinkgem.jeesite.modules.wshbj.entity.ZhizhengAddRecord;

public class ZhizhengAddRecordService  extends CrudService<ZhizhengAddRecordDao, ZhizhengAddRecord> {

    private String salt="pingbukeji1234";

    /**
     * 初始化制证add_code  ownerId + salt + 结果值
     * @param ownerId
     */
    public void initAddCode(String ownerId,Integer count){

        // 验证当前是否没有记录
        String ming=ownerId+salt+count;
        String addCount=Encodes.md5(ming);

    }

    /**
     * 验证当前可制证次数
     * add_code的算法： ownerId + 前一次add_code + 上次可制证次数 + salt + 结果值 进行md5 加密
     */
    public Boolean validateLastZhizhengCount(String ownerId){


        return null;
    }


    /**
     * 减一可制证次数
     * @return
     */
    public Integer decrementZhizhengCount(String ownerId){

        return 0;
    }


    /**
     * 生成新的add_code
     * @param addCount
     * @return
     */
    private String buildNewCode(String ownerId,Integer addCount){
        // 1 获取最后一次 add_code


        // 1.1 验证最后一次可制证次数是否合法


        // 2 获取当前的可制证次数

        // 2.1 结果数量 = 可制证次数+ addCount

        // 3 组装新的add_code  ownerId+ 最后一次add_code + 可制证数量 + salt + 结果数量 => md5加密


        return null;
    }

}
