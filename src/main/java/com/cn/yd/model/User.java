package com.cn.yd.model;

import java.io.Serializable;
import java.util.Date;

import com.cn.yd.util.page2.Common;

/**
 *
 * tablename:user
 */
public class User extends Common implements Serializable {
    /**
     *
     * id
     * 
     */
    private Long id;

    /**
     *
     * 账号
     * 
     */
    private String userName;

    /**
     *
     * 密码
     * 
     */
    private String password;
    
    /**
     * 姓名
     */
    private String name;

    /**
     *
     * 年龄
     * 
     */
    private Integer age;
    
    /**
     * 手机号码
     */
    private String mobile;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 入职时间
     */
    private Date entryTime;
    
    /**
     * 0:删除状态；1:正常状态
     */
    private String status;

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
    
    
    
}