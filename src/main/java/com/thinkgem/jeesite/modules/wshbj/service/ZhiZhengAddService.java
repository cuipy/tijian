package com.thinkgem.jeesite.modules.wshbj.service;

public class ZhiZhengAddService {

    private String salt="pingbukeji1234";

    /**
     * 验证当前可制证次数
     * add_code的算法： ownerId + 前一次add_code + 增加数 + salt + 结果值 进行md5 加密
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

        // 3 组装新的add_code  ownerId+ 最后一次add_code+ addCount+ salt + 结果数量 => md5加密


        return null;
    }

}
