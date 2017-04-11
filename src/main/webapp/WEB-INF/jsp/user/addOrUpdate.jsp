<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="user">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1;text/html; charset=utf-8"/>
    <title>员工</title>
    <%@include file="/WEB-INF/jsp/header.jsp" %> 
    <link rel="stylesheet" href="<%=contextPath%>/web/res/my97/skin/default/datepicker.css"/>
    <link rel="stylesheet" href="<%=contextPath%>/web/res/my97/skin/WdatePicker.css"/>
    <link rel="stylesheet" type="text/css" href="<%=contextPath%>/web/res/my97/skin/whyGreen/datepicker.css"/>
    <script src="<%=contextPath%>/web/res/angular/angular.min.js"></script>
    <script src="<%=contextPath%>/web/res/my97/WdatePicker.js"></script>
    <script src="<%=contextPath%>/web/res/bootstrap/js/bootstrap3-validation.js"></script>
    <script src="<%=contextPath%>/web/res/angular/angular-messages.min.js"></script>  
    <script>
        var id = ${id};
        $(function(){
            //1. 简单写法：
            $("#form1").validation({icon:true});
        });
    </script>
    <script src="<%=contextPath%>/web/res/js/func/user/app.js"></script>
</head>
<body>
<div  style="margin:10px 0px 0px 0px; ">
    <form class="form-horizontal form-horizontal-my-from"  id="form1" name="myform" style="" ng-controller="task">
        <div class="form-group">
            <label class="col-sm-3 control-label">姓名：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="name"  ng-model="user.name" autocomplete="off" placeholder=""  check-type="required" maxlength="20">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">账号：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control"  name="userName"  ng-model="user.userName" autocomplete="off" placeholder=""  check-type="required" maxlength="20">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-3 control-label" >手机号：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="mobile" ng-model="user.mobile" autocomplete="off" placeholder="请输入手机号格式"  check-type="required mobile" maxlength="11">
            </div>
        </div>
 		<div class="form-group">
            <label  class="col-sm-3 control-label" >年龄：</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="age" ng-model="user.age" autocomplete="off" placeholder="请输入正整数"  check-type="required number" maxlength="3">
            </div>
        </div>
      <%--    <div class="form-group">
            <label class="col-sm-3 control-label">性别:</label>
            <div class="col-sm-6">
                <div class="checkbox">
                    <label>
                        <input type="radio" value="1" name="gender"  ng-model="employee.gender" /> &nbsp;男
                    </label>
                    <label>
                        <input type="radio" value="2" name="gender" ng-model="employee.gender"/> &nbsp;女
                    </label>
                </div>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label">岗位:</label>
            <div class="col-sm-6">
                <select class="form-control" ng-model="employee.positionId" ng-change="positionChange(employee.positionId)" ng-options="item.id  as item.name for item in positions" check-type="select_required" >
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
        
    

        <div class="form-group">
            <label class="col-sm-3 control-label">入职时间</label>
            <div class="col-sm-6">
                <input  type="text" class="Wdate form-control " id="createTime" name="createTime" ng-model="user.createTime | date:'yyyy-MM-dd'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'twoer',charset:'gb2312'})"  onchange="setDate(this);"/>
            </div>
        </div>
		--%>
        
        <div class="form-group">
            <label class="col-sm-3 control-label">入职日期:</label>
            <div class="col-sm-6">
                <input  type="text" class="Wdate form-control " id="entryTime" name="entryTime" ng-model="user.entryTime | date:'yyyy-MM-dd'" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'twoer',charset:'gb2312'})"  onchange="setDate(this);"/>
            </div>
        </div>

        
        
    </form>
</div>
</body>
</html>
