package com.cn.yd.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {
	/**
	 * 将结束日期设置为 yyyy-MM-dd 23:59:59 （结束时间查询条件）
	 * @param endTime 结束时间查询条件时间
	 * @return  yyyy-MM-dd 23:59:59
	 * @throws Exception
	 */
	public static Date endDateFormat(Date endTime) throws Exception{
		if(endTime==null){
			return null;
		}else{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.parse(sdf.format(endTime).substring(0,10)+" 23:59:59");
		}
	}
	
}
