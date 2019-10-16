<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
        <meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
        <meta name="Author" content="Dreamer-1.">
        
        <!-- 引入各种CSS样式表 -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/index.css">    <!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
        <link rel="stylesheet" href="css/font-change.css">    <!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->        
        <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>


       
    <title>- AGV控制系统 -</title>
    </head>
<body>
<center>
<div style =margin-left:10%;>
    用户名<input id="useradd_name">
    密码<input  id="useradd_password">
    用户类型<input id="useradd_type">
	<button type="button" class="btn btn-primary" id="adduser" onclick="showAtRight('usershow')">添加用户</button>
	</div>
	
<!--
下方显示内容，ajax显示
-->

<div style="width:90%; height:300px; overflow:auto; "  id="userbelow">
<table  class="table" style="width: 95%" border="2" id="table">
            <tr>

             <th width="6%"><font size="2">用户名</font></th>
             <th width="4%"><font size="2">密码</font></th>
             <th width="4%"><font size="2">用户类型</font></th>
             <th width="4%"><font size="2">操作</font></th>
    </tr>

   <c:forEach items="${sessionScope.alluser}" var="user" varStatus="id1"> 
   <tr>
    <th width="6%"><font size="2">${user.getUser_name()}</font></th>
             <th width="4%"><font size="2">${user.getUser_password()}</font></th>
             <th width="4%"><font size="2">${user.getUser_type()}</font></th>
             <th width="4%">
             
             <button type="button" class="btn btn-primary"  onclick="showAtRight('usermodify1/${user.getUser_name()}') " >修改</button>
             <button type="button" class="btn btn-primary"  onclick="showAtRight('userdelete1/${user.getUser_name()}') " >删除</button>
            </th>
   </tr>
   
   </c:forEach>


</table>

            </div>




</center>

</body>
</html>