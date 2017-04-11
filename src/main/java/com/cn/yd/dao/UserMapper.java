package com.cn.yd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.yd.dto.UserDto;
import com.cn.yd.model.User;
import com.cn.yd.util.page.DatagridRequestModel;

public interface UserMapper {

    User getUserById(@Param("id")Long id);
    
    void create(User user);

	User getUserByUserName(@Param("userName")String userName);

	List<UserDto> selectPage(UserDto userDto);

	
	void update(@Param("user")User user);

	void deleteById(@Param("ids")String ids);

    
}