package com.cn.yd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cn.yd.dto.UserDto;
import com.cn.yd.model.User;
import com.cn.yd.util.ActResult;
import com.cn.yd.util.page.DatagridRequestModel;

public interface UserService {
	User getUserById(Long id);
	
	void create(User user);

	ActResult checkLoginUser(HttpServletRequest request,String userName, String password);

	List<UserDto> selectPage(UserDto userDto) throws Exception;
	void update(User user);

	void deleteById(String ids);
	
}
