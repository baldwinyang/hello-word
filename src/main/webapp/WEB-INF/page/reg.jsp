<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
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
    
        <title>- 装备编码系统 -</title>
    </head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        <div>
        <center>
            <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;<small>&nbsp;&nbsp;&nbsp;欢迎登录空军航空维修保障设备编码系统</small></h1>
      <table height='100' style="border-collapse:separate; border-spacing:0px 10px;">
      <form id="zc_form" method = 'post'  action = 'zc_user' >
        <tr>
         <td>用户名：</td>
         <td><input type="text" name="name" id="name" size="30" class="form-control" placeholder="请输入用户名" required oninvalid="setCustomValidity('请输入用户名');" oninput="setCustomValidity('')" /></td>
         </tr>
         <td>密 码：</td>
         <td><input type="password" name="password" id="password" size="31" class="form-control" placeholder="请输入密码" required oninvalid="setCustomValidity('请输入密码');" oninput="setCustomValidity('')" /></td>
        </tr>
        <td>确认密码：</td>
         <td><input type="password" name="password2" id="password2" size="31" class="form-control" placeholder="请再次输入密码" required oninvalid="setCustomValidity('请再次输入密码');" oninput="setCustomValidity('')" /></td>
        </tr>
      </table><br><br>
                <button type="submit" style="margin-right:70px;"class="btn btn-primary" id="btn-login"  >注册</button>
                </form>
                <button type="button" class="btn btn-primary" id="btn-reg" onclick="window.location.href='hello'" >返回登录</button>
                </center>
        </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
</div>

</body>
</html>