package com.thinkgem.jeesite.modules.wshbj.bean;

import java.io.Serializable;

public class RequestResult implements Serializable {

	public static final int SUCCESS = 1;

	public static final int FAIL = 2;

	public static final int DOUBTFUL = 3;

	/**
	 * 响应的状态
	 */
	private Integer state;
	/**
	 * 响应的消息
	 */
	private String msg;

	private Object data;

	private RequestResult(){

	}

	public static RequestResult generate(Integer state, String msg){
		RequestResult rr = new RequestResult();
		rr.state = state;
		rr.msg = msg;
		return rr;
	}

	public static RequestResult generate(Integer state, String msg, Object data){
		RequestResult rr = new RequestResult();
		rr.state = state;
		rr.msg = msg;
		rr.data = data;
		return rr;
	}

	public static RequestResult generateFailResult(Integer state, Exception e){
		RequestResult rr = new RequestResult();
		rr.msg = "捕获到异常信息:" + e.getMessage();
		rr.state = state;
		return rr;
	}

	public static RequestResult generateSuccessResult(String msg){
		RequestResult rr = new RequestResult();
		rr.state = SUCCESS;
		rr.msg = msg;
		return rr;
	}

	public static RequestResult generateSuccessResult(String msg, Object data){
		RequestResult rr = new RequestResult();
		rr.state = SUCCESS;
		rr.msg = msg;
		rr.data = data;
		return rr;
	}

	public static RequestResult generateFailResult(String msg){
		RequestResult rr = new RequestResult();
		rr.state = FAIL;
		rr.msg = msg;

		return rr;
	}

	public static RequestResult generateDoubtfulResult(String msg){
		RequestResult rr = new RequestResult();
		rr.state = DOUBTFUL;
		rr.msg = msg;
		return rr;
	}

	public static RequestResult generateFailResult(String msg, Object data){
		RequestResult rr = new RequestResult();
		rr.state = FAIL;
		rr.msg = msg;
		rr.data = data;
		return rr;
	}

	public Integer getState(){
		return state;
	}

	public String getMsg(){
		return msg;
	}

	public Object getData(){
		return data;
	}

	public void setState(Integer state){
		this.state = state;
	}

	public void setMsg(String msg){
		this.msg = msg;
	}

	public void setData(Object data){
		this.data = data;
	}

	@Override
	public String toString(){
		return state + ":" + msg;
	}

}
