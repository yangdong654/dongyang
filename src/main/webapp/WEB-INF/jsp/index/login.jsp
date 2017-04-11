<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>  
  <head>  
    <title>index</title>  
    <%@include file="/WEB-INF/jsp/header.jsp" %> 
 
<script>
	function login(){
		var userName=$("#userName").val().trim();
		var password=$("#password").val();
		if(userName=='' || password==''){
			alert("请输入账号和密码！");
			return false;
		}else{
			$.ajax({
				url:"<%=contextPath%>/checkLoginUser",
				dataType:"json",
				async:true,
				data:{userName:userName,password:password},
				type:"POST",
				success:function(data){
					if(data.success){
						alert(data.msg);
						window.location=("homePage");
					}else{
						jbox_notice({content:data.msg,autoClose:2000 ,className:"warning"});
					}
				}
			});
		}
	}
</script>
  </head>  
    
  <body>  
  		账号：<input id="userName" name="userName"/>
  		密码：<input id="password" name="password"  type="password"/>
  		<br>
  		<input type="button" onclick="login()" value="登录">
  </body>  
</html>  