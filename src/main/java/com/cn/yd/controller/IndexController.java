package com.cn.yd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.yd.service.UserService;
import com.cn.yd.util.ActResult;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	UserService userservice;
	
	@RequestMapping("login")
	public ModelAndView index(){
		System.out.println("----------------controller");
		return new ModelAndView("/index/login");
		
	}
	
	@RequestMapping(value="checkLoginUser",method=RequestMethod.POST)
	@ResponseBody
	public ActResult checkLoginUser(HttpServletRequest request,String userName,String password){
		ActResult result=userservice.checkLoginUser(request,userName,password);
		return result;
	}
	
	
	
	//首页
	@RequestMapping("homePage")
	public ModelAndView homePage(){
		ModelAndView model=new ModelAndView("/index/homePage");
		return model;
	}
	

}
