package com.cn.yd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.yd.dto.UserDto;
import com.cn.yd.model.User;
import com.cn.yd.service.UserService;
import com.cn.yd.util.ActResult;
import com.cn.yd.util.page.DatagridRequestModel;
import com.cn.yd.util.page.DatagridResponseModel;

@Controller
@RequestMapping("userController")
public class UserController {
	
	@Autowired
	UserService userService;
	
	/**
	 * 用户页面
	 * @param request
	 * @return
	 */
    @RequestMapping("/index")  
    public ModelAndView index(HttpServletRequest request){ 
    	ModelAndView m=new ModelAndView("user/index");
        return m;
    }
    
    /**
     * 跳转至添加或编辑页面
     * @param id
     * @return
     */
    @RequestMapping("/toAddOrUpdate")
    public ModelAndView toAddOrUpdate(Long id){
    	ModelAndView model=new ModelAndView("user/addOrUpdate");
    	model.addObject("id", id);
    	return model;
    }
    
    
    /**
     * 获取用户列表
     * @param datagridRequestModel
     * @param userDto
     * @return
     */
    @RequestMapping(value="/getUserList",method=RequestMethod.POST)
    @ResponseBody
    public DatagridResponseModel getUserList(DatagridRequestModel datagridRequestModel,UserDto userDto) throws Exception{
    	userDto.setPagebegin(datagridRequestModel.getOffset());
    	userDto.setPagesize(datagridRequestModel.getLimit());
    	
    	DatagridResponseModel model=new DatagridResponseModel();
    	model.setRows(userService.selectPage(userDto));
    	System.out.println("-u.getCount()------"+userDto.getCount());
    	System.out.println("-u.getPagebegin()------"+userDto.getPagebegin());
    	model.setTotal(userDto.getCount());
    	return model;
    }
    
    /**
     * 根据id删除
     * @param ids
     * @return
     */
    @RequestMapping(value="/deleteById",method=RequestMethod.POST)
    @ResponseBody
    public ActResult deleteById(String ids){
    	ActResult actResult=new ActResult();
    	userService.deleteById(ids);
    	return actResult;
    }
    
    /**
     * 根据id查询
     * @param id
     * @return
     */
    @RequestMapping(value="/getUserById",method=RequestMethod.GET)
    @ResponseBody
    public ActResult getUserById(Long id){
    	ActResult actResult=new ActResult();
    	actResult.setData(userService.getUserById(id));
    	return actResult;
    }
    
    /**
     * 添加或修改
     * @param request
     * @param user
     * @return
     */
    @RequestMapping(value="/doSaveAndUpdate",method=RequestMethod.POST)
    @ResponseBody
    public ActResult doSaveAndUpdate(HttpServletRequest request, @RequestBody User user){
    	ActResult actResult=new ActResult();
    	if(user.getId()!=null && user.getId()>0 ){  //修改
    		userService.update(user);
    	}else{  //添加
    		userService.create(user);
    	}
    	return actResult;
    }
    
    
    

}
