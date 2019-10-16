<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
 <div style="text-align:center; height:100px;width:250px">
<select  id="AGV_select" style="width:150px;height:30px"/>
 <option></option>
 <c:forEach items="${sessionScope.allAgv}" var="agv">
 <option value="${agv.name}">${agv.name}</option>
 </c:forEach>
 </select> 

<input type="button" class="btn btn-primary" id="connect_btn" value="连接" onclick="connect()"/>

</div>
<center>
 <div style="float:left;text-align:center; width: 350px">
 <table style="width: 224px; height: 161px; ">
 <tr>
 <td></td>
 <td><img onmouseover="this.style.cursor='pointer'" src="image/1.png" style="cursor: hand;width: 68px; height: 66px;" onclick="showAtRight('motion/1')"></td>
 <td></td>
 </tr>
 <tr>
 <td style="width: 55px "> <img onmouseover="this.style.cursor='pointer'" src="image/4.png" style="cursor: hand;width: 68px; height: 66px;" onclick="showAtRight('motion/2')"></td>
 <td style="width: 55px "> <button type="button" class="btn btn-primary" id="btn-stop" onclick="showAtRight('motion/3')">运动停止</button></td>
 <td style="width: 55px "> <button type="button" class="btn btn-primary" id="btn-right" onclick="showAtRight('motion/4')">右转</button></td>
 </tr>
 <tr>
 <td></td>
 <td><button type="button" class="btn btn-primary" id="btn-back" onclick="showAtRight('motion/9')">后退</button></td>
 <td><button type="button" class="btn btn-primary" id="btn-turn" onclick="showAtRight('motion/5')">调头</button></td>
 </tr>
 </table>
 </div>
<div style="float:left; width: 50px">
 <table style="width: 224px;text-align:center; height: 161px; ">
 <tr>
 <td></td>
<!-- <td><button type="button" class="btn btn-primary" id="btn-around" onclick="showAtRight('motion/10')">升降停止</button></td>   --> 
 <td><button type="button" class="btn btn-primary" id="btn-up" onclick="showAtRight('motion/6')">上升</button></td>
 </tr>
 <tr>
 <td style="width: 55px "> </td>
 <td style="width: 55px "><button type="button" class="btn btn-primary" id="btn-around" onclick="showAtRight('motion/7')">旋转</button></td>
 <td style="width: 55px "> <button type="button" class="btn btn-primary" id="btn-aroundend" onclick="showAtRight('motion/11')">旋转停止</button></td>
 </tr>
 <tr>
 <td></td>
 <td><button type="button" class="btn btn-primary" id="btn-down" onclick="showAtRight('motion/8')">下降</button></td>
 <td></td>
 </tr>
 </table>
</div>

</center>
 </body>
 </html>