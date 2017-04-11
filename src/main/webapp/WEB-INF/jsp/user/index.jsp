<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <title>用户列表</title>  
    <%@include file="/WEB-INF/jsp/header.jsp" %> 
    <link rel="stylesheet" href="<%=contextPath%>/web/res/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="<%=contextPath%>/web/res/style/css/style.css">
    <link rel="stylesheet" href="<%=contextPath%>/web/res/my97/skin/WdatePicker.css"/>
    <script src="<%=contextPath%>/web/res/bootstrap-table/bootstrap-table.js"></script>
    <script src="<%=contextPath%>/web/res/bootstrap-table/locale/bootstrap-table-zh-CN.js" ></script>
    <script src="<%=contextPath%>/web/res/my97/WdatePicker.js"></script>
  	<script src="<%=contextPath%>/web/res/my97/xdate.dev.js"></script>
  <script >
    function doInit(){
      $('#table-bootstrap').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded;charset=UTF-8",
        url: "<%=contextPath%>/userController/getUserList",
        classes: 'table table-hover',
        height:getHeight(),
        toolbar:"#toolbar",
        pageSize:2,
        queryParams: queryParams,
        columns: [
          {
            field: 'state',
            checkbox: true,
            align: 'center',
            valign: 'middle'
          },
          {
            field: 'userName',
            title: '用户名',
            align: 'center',
            valign: 'middle',
            sortable:true
          },
          {
            field: 'name',
            title: '名称',
            align: 'center',
            valign: 'middle'
          },
          {
            field: 'entryTime',
            title: '入职时间',
            align: 'center',
            valign: 'middle',
            formatter: function (value, row) {
              return getFormatDateTimeStr(value, 'yyyy-MM-dd HH:mm:ss')
            }
          },
          {
            field: '_opt_',
            title: '操作',
            align: 'center',
            valign: 'middle',
            formatter:function(value,row){
            	return [
				'<a href="javascript:void(0)" onclick="createOrUpdate(' + row.id + ');">'+'编辑</a>&nbsp;&nbsp;&nbsp;',
				'<a href="javascript:void(0)" onclick="deleteById(' + row.id + ');">'+'删除</a>'
				].join('');
            }
           }
        ]
      });
    }
    
    //传递的参数
    function queryParams(params) {
      var name =$("input[name='name']").val();
      var beginTime = $("#beginTime").val();  //起始时间
      var endTime = $("#endTime").val();    //结束时间
      if(!params){
        params = {};
      }
      params["name"]=name; 
      params["beginTime"]=beginTime;
      params["endTime"]=endTime;
      return params;
    }
    function refresh(){
      $('#table-bootstrap').bootstrapTable('refresh', {query:{a:1,b:2}});
    }
    $(window).resize(function () {
      $('#table-bootstrap').bootstrapTable('resetView', {
        height: getHeight()
      });
    });
    function getHeight() {
      return $(window).height() - $('h2').outerHeight(true);
    }
    function detailFormatter(index, row) {
      var html = [];
      $.each(row, function (key, value) {
        html.push('<p><b>' + key + ':</b> ' + value + '</p>');
      });
      return html.join('');
    }

    /**
     *点击查询
     */
    function  doQuery(flag){
      if(flag){
        $('#table-bootstrap').bootstrapTable('refreshOptions', {pageNumber:  1});
      }else{
    	  $('#table-bootstrap').bootstrapTable('refresh', {query:  queryParams});
      }
    }
    
    
    /**
     * 创建或者更新
      */
     function createOrUpdate(id){
         var title = "添加"
             if(id) title = "编辑";
             var url = "<%=contextPath%>/userController/toAddOrUpdate?id=" + id;
             bsWindow(url,title,{height:330,width:550,submit:function(v,h){
                 var cw = h[0].contentWindow;
                 cw.doSave(function(json){
                     if(json.success){
                         window.BSWINDOW.modal("hide");
                         jbox_notice({content:"保存成功",autoClose:2000 ,className:"success"});
                        // doQuery();
                         $('#table-bootstrap').bootstrapTable('refresh',{silent: true});
                     }else{
                         alert( json.msg || "保存出错");
                     }
                     console.log(json);
                 });
             }});
     }

    

     /**
      * 删除选中项
      * */
     var jboxObj;
     function deleteById(id){
         var option = {width:400,content:"确定要删除所选中的数据，删除后将不可恢复？",confrimFunc:function(){
             delById(id);
         },
             draggable: 'title',
             closeButton: 'box',
             animation: {
                 open: 'slide:left',
                 close: 'slide:right'
             }
         };
       jboxObj=   jbox_confirm(option);

     }
     /**
     * 根据id删除
     */
     function delById(id){
    	 var param={ids:id}
         var obj = tools.requestRs("<%=contextPath%>/userController/deleteById" , param , 'post');
         if(obj.success){
             jbox_notice({content:"删除成功",autoClose:2000 ,className:"success"});
             jboxObj.close();
            // doQuery();
             $('#table-bootstrap').bootstrapTable('refresh',{silent: true});
         }
     }
    
     /**
     *获取所有选中的，并删除
     */
	function getIdSelections(){
		 var ids = $.map($('#table-bootstrap').bootstrapTable('getSelections'), function (row) {
             return row.id
         });
         if (ids.length <= 0) {
             jbox_notice({content: "至少选择一项进行删除！", autoClose: 2000, className: "warning"});
             return;
         }
         var option = {width:400,content:"确定要删除所选中的数据，删除后将不可恢复？",confrimFunc:function(){
        	 deleteSelectionsById(ids);
         },
             draggable: 'title',
             closeButton: 'box',
             animation: {
                 open: 'slide:left',
                 close: 'slide:right'
             }
         };
         jboxObj=   jbox_confirm(option);
     }
     /**
     *批量删除
     */
     
     function deleteSelectionsById(ids){
    	 var param={ids:ids.join(",")}
         var obj = tools.requestRs("<%=contextPath%>/userController/deleteById" , param , 'post');
         if(obj.success){
                     jbox_notice({content:"删除成功",autoClose:2000 ,className:"success"});
                     jboxObj.close();
                     //doQuery();
                     $('#table-bootstrap').bootstrapTable('refresh',{silent: true});
         }
     }
     
  </script>
  
  </head>  
    
  <body onload="doInit();">  
    <div class="container" style="width:97%;margin-top:10px">
  <h2>
    用户列表
    </form>
  </h2>
  <div id="toolbar">
    <form class="form-horizontal" id="form1" name="form1">
    <label>入职时间：</label>
    <input  type="text" class="Wdate form-control" id="beginTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'twoer',charset:'gb2312',maxDate:'#F{$dp.$D(\'endTime\')}'})" style="width: 120px;display: inline-block;"/>
          至<input  type="text" class="Wdate form-control" id="endTime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'twoer',charset:'gb2312',minDate:'#F{$dp.$D(\'beginTime\')}'})" style="width: 120px;display: inline-block;"/>
 
    <label>名称：</label>
    <input type="text" class="form-control" name="name" autocomplete="off" placeholder="名称" placeholder="" style="width: 220px;display: inline-block;">
     
     <button type="button"   class="btn btn-primary"  onclick="createOrUpdate(0);">
         <i class="glyphicon glyphicon-plus"  ></i> 新增
     </button>
     <button type="button"  class="btn btn-danger" onclick="getIdSelections();">
         <i class="glyphicon glyphicon-remove"></i> 批量删除
     </button>
     
     <button type="button" class="btn btn-info"  onclick="doQuery(true);">
       <i class=" glyphicon glyphicon-search"></i> 查询
     </button>
      <input type="reset"class="btn btn-warning"  value="重置"/>
      </form>
  </div>
  <table id="table-bootstrap"
         data-pagination="true"
         data-side-pagination="server"
         data-page-list="[10, 20, 50, 100,ALL]"
         data-show-refresh="true"
         data-show-toggle="true"
         data-show-columns="true"

  <%--        data-detail-view="true"
          data-detail-formatter="detailFormatter"--%>
         data-show-pagination-switch="true"
          >
  </table>
</div>

    
  </body>  
  <script>
//  var mydate = new Date();
//  var Year = mydate.getFullYear();
//  var Mon = mydate.getMonth() + 1;
//  if(Mon < 10)Mon="0"+Mon;
//  var Day = mydate.getDate();
//  var hh = mydate.getHours();
//  if(hh<10) hh="0"+hh;
//  var mm = mydate.getMinutes();
//  if(mm<10) mm="0"+mm;
//  var ss = mydate.getSeconds();
//  if(ss<10) ss="0"+ss;
//  var all = Year + "-" + Mon + "-" + Day ;   //默认时间为 当月 当天
  var firstDate = new Date();
  firstDate.setDate(1);
  var first=new XDate(firstDate).toString('yyyy-MM-dd'); //第一天
  var endDate = new Date(firstDate);
  endDate.setMonth(firstDate.getMonth()+1);
  endDate.setDate(0);
  var lastDay = new XDate(endDate).toString('yyyy-MM-dd');
  $("#beginTime").val(first)  //获取当月第一天
  $("#endTime").val(lastDay);//默认时间为 当月 最后一天
</script>
</html>  