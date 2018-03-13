package com.thinkgem.jeesite.common.bean;

import java.io.Serializable;

public class ResponseResult implements Serializable {

    /**
     * 状态  0成功
     */
    private String code;

    private String msg;

    private Object data;

    public ResponseResult(String _code,String _msg,Object _data){
        code=_code;
        msg=_msg;
        data=_data;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Object getData() {
        return data;
    }
}
