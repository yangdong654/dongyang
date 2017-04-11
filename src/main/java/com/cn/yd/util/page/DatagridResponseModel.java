package com.cn.yd.util.page;

import java.util.List;

public class DatagridResponseModel {
    private int total;// 总记录数
    private List rows;// 每行记录
    private Object ext;//扩展属性
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	public Object getExt() {
		return ext;
	}
	public void setExt(Object ext) {
		this.ext = ext;
	}
    
    
}
