package com.cn.yd.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.cn.yd.model.User;

public class UserDto extends User{
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date beginTime;  //查询条件（开始时间）
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date endTime;  //查询条件（结束时间）
	
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	
	
	
}
