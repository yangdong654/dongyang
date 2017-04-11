package com.cn.yd.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cn.yd.dao.UserMapper;
import com.cn.yd.dto.UserDto;
import com.cn.yd.model.User;
import com.cn.yd.service.UserService;
import com.cn.yd.util.ActResult;
import com.cn.yd.util.DateFormat;
import com.cn.yd.util.page.DatagridRequestModel;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper; 
	
	@Transactional(readOnly = true)
	public User getUserById(Long id){
		return userMapper.getUserById(id);
	}
	
	@Transactional(rollbackFor =Exception.class)
	public void create(User user){
		user.setPassword("123456");
		user.setCreateTime(new Date());
		userMapper.create(user);
	}
	
	@Transactional(rollbackFor =Exception.class)
	public void update(User user){
		userMapper.update(user);
	}

	@Transactional(readOnly = true)
	public ActResult checkLoginUser(HttpServletRequest request, String userName, String password) {
		ActResult result=new ActResult();
		User user=userMapper.getUserByUserName(userName);
		if(user==null){
			result.setMsg("用户不存在!");
			result.setSuccess(false);
			return result;
		}else if(!user.getPassword().equals(password)){
			result.setMsg("密码错误!");
			result.setSuccess(false);
			return result;
		}else{
			request.getSession().setAttribute("user", user);
			result.setMsg("登陆成功!");
			result.setSuccess(true);
			return result;
		}
	}

	@Transactional(readOnly = true)
	public List<UserDto> selectPage( UserDto userDto) throws Exception {
		userDto.setEndTime(DateFormat.endDateFormat(userDto.getEndTime()));
		return userMapper.selectPage( userDto); 
	}

	
	@Transactional(rollbackFor =Exception.class)
	public void deleteById(String ids) {
		userMapper.deleteById(ids);
	};
	
	
}
