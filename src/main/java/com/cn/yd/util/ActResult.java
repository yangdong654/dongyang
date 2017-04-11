package com.cn.yd.util;

import java.io.Serializable;

public class ActResult<T> implements Serializable{
	private boolean success=true;
	private T data;
	private String msg="";
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
