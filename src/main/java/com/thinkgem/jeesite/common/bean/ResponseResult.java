package com.thinkgem.jeesite.common.bean;

import com.thinkgem.jeesite.modules.wshbj.bean.RequestResult;

import java.io.Serializable;

public class ResponseResult implements Serializable {

    public static final String SUCCESS = "0";

    public static final String FAIL = "1";

    public static final String DOUBTFUL = "2";

    /**
     * 状态  0成功
     */
    private String code;

    private String msg;

    private Object data;

    public ResponseResult(){

    }

    public ResponseResult(String _code,String _msg,Object _data){
        code=_code;
        msg=_msg;
        data=_data;
    }

    public static ResponseResult generate(String code, String msg){
        ResponseResult rr = new ResponseResult();
        rr.code = code;
        rr.msg = msg;
        return rr;
    }

    public static ResponseResult generate(String code, String msg, Object data){
        ResponseResult rr = new ResponseResult();
        rr.code = code;
        rr.msg = msg;
        rr.data = data;
        return rr;
    }

    public static ResponseResult generateFailResult(String code, Exception e){
        ResponseResult rr = new ResponseResult();
        rr.msg = "捕获到异常信息:" + e.getMessage();
        rr.code = code;
        return rr;
    }

    public static ResponseResult generateSuccessResult(String msg){
        ResponseResult rr = new ResponseResult();
        rr.code = SUCCESS;
        rr.msg = msg;
        return rr;
    }

    public static ResponseResult generateSuccessResult(String msg, Object data){
        ResponseResult rr = new ResponseResult();
        rr.code = SUCCESS;
        rr.msg = msg;
        rr.data = data;
        return rr;
    }

    public static ResponseResult generateFailResult(String msg){
        ResponseResult rr = new ResponseResult();
        rr.code = FAIL;
        rr.msg = msg;

        return rr;
    }

    public static ResponseResult generateFailResult(String msg, Object data){
        ResponseResult rr = new ResponseResult();
        rr.code = FAIL;
        rr.msg = msg;
        rr.data = data;
        return rr;
    }


    public static ResponseResult generateDoubtfulResult(String msg){
        ResponseResult rr = new ResponseResult();
        rr.code = DOUBTFUL;
        rr.msg = msg;
        return rr;
    }

    public static ResponseResult generateDoubtfulResult(String msg, Object data){
        ResponseResult rr = new ResponseResult();
        rr.code = DOUBTFUL;
        rr.msg = msg;
        rr.data = data;
        return rr;
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
