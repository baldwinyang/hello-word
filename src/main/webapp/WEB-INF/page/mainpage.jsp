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
    	<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
        <script src="http://demo.qunee.com/lib/qunee-min.js"></script>
        <title>- AGV控制系统 -</title>
    </head>
    
    <body>
    <!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
              <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                      <a class="navbar-brand" >AGV控制系统</a>
                </div>
                
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                   <li><a href="###" onclick="window.location.href='hello'">退出</a></li>                           
                       
                    </ul>  
                </div>
              </div>
        </nav>

    <!-- 左侧菜单选项========================================= -->
        <div class="container-fluid">
            <div class="row-fluie">
                <div class="col-sm-3 col-md-2 sidebar">        
                    <ul class="nav nav-sidebar">
                        <!-- 一级菜单 -->
                        <li class="active"><a href="#equipMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                            <i class="fa fa-globe"></i>&nbsp; AGV控制 <span class="sr-only">(current)</span></a>
                        </li> 
                        <!-- 二级菜单 -->
                        <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                        <ul id="equipMeun" class="nav nav-list collapse menu-second">
                            <li><a href="###" onclick="showAtRight('information_management')"><i class="fa fa-list-alt"></i> 车辆管理</a></li>
                             <li><a href="###" onclick="showAtRight('motion_control')"><i class="fa fa-list-alt"></i> 单机控制</a></li>
                              <li><a href="###" onclick="showAtRight('task_management')"><i class="fa fa-list-alt"></i>任务状态</a></li>
                             <li><a href="###" onclick="showAtRight('task_control')"><i class="fa fa-list-alt"></i>任务发布</a></li>
                                    
                        </ul>
                        <li><a href="#Equipmentarchives" class="nav-header menu-first collapsed" data-toggle="collapse" onclick="showAtRight('movepath')">
                            <i class="fa fa-user"></i>&nbsp; 运动轨迹<span class="sr-only">(current)</span></a>
                        </li>
                        <li><a href="#systemMeun" class="nav-header menu-first collapsed" data-toggle="collapse" onclick="showAtRight('systemmanage')">
                            <i class="fa fa-user"></i>&nbsp; 用户管理 <span class="sr-only">(current)</span></a>
                        </li> 

                         
                            
                    </ul>
                    
                </div>
            </div>
        </div>

<!-- 右侧内容展示==================================================   -->           
                 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;<small>&nbsp;&nbsp;&nbsp;欢迎使用AGV控制系统</small></h1>
                       
                        <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
                          <div id="content" >
               
                               <h4>                    
                                   <strong></strong><br>
                                   <br><br>
                               </h4>                                 
                              
                          </div>
                          
                </div> 
        
        
        <script type="text/javascript">
        
        /*
         * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
         * （实现左侧菜单中的标签点击后变色的效果）
         */
        $(document).ready(function () {
            $('ul.nav > li').click(function (e) {
                //e.preventDefault();    加上这句则导航的<a>标签会失效
                $('ul.nav > li').removeClass('active');
                $(this).addClass('active');
            });
        });
     
     function connect(){
		var btn=document.getElementById("connect_btn");
		var btn_on=btn.value;
		if(btn_on=="连接"){
		btn.value="断开";
		document.getElementById("AGV_select").style.backgroundColor="#EEEEEE";
		document.getElementById("AGV_select").disabled="disabled";
		}else{
		btn.value="连接";
		document.getElementById("AGV_select").style.backgroundColor="#FFFFFF";
		document.getElementById("AGV_select").disabled="";
		}
		
		}
		
		
		
        function executeScript(html)
        {
            
            var reg = /<script[^>]*>([^\x00]+)$/i;
            //对整段HTML片段按<\/script>拆分
            var htmlBlock = html.split("<\/script>");
            for (var i in htmlBlock) 
            {
                var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
                if (blocks = htmlBlock[i].match(reg)) 
                {
                    //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                    var code = blocks[1].replace(/<!--/, '');
                    try 
                    {
                        eval(code) //执行脚本
                    } 
                    catch (e) 
                    {
                    }
                }
            }
        }
        
   
       
        function showAtRight(url) {
            var xmlHttp;
            
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp=new XMLHttpRequest();    //创建 XMLHttpRequest对象
            }
            else {
                // code for IE6, IE5
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
        
            xmlHttp.onreadystatechange=function() {        
                //onreadystatechange — 当readystate变化时调用后面的方法
                
                if (xmlHttp.readyState == 4) {
                    //xmlHttp.readyState == 4    ——    finished downloading response
                    
                    if (xmlHttp.status == 200) {
                        //xmlHttp.status == 200        ——    服务器反馈正常            
                        
                        document.getElementById("content").innerHTML=xmlHttp.responseText;    //重设页面中id="content"的div里的内容
                        executeScript(xmlHttp.responseText);    //执行从服务器返回的页面内容里包含的JavaScript函数
                    }
                    //错误状态处理
                   
                    else if (xmlHttp.status == 403) {  
                        alert("出错了☹   （错误代码：403 Forbidden），……"); 
                        /* 对403的处理  */ 
                        return;
                    }
                    else {
                        alert("出错了☹   （错误代码：" + request.status + "），……"); 
                        /* 对出现了其他错误代码所示错误的处理   */
                        return;
                    }   
                } 
                    
              }
              
          if(document.getElementById("useradd_name")){
          var useradd_name=document.getElementById("useradd_name").value;
          var useradd_password=document.getElementById("useradd_password").value;
          var useradd_type=document.getElementById("useradd_type").value;
       
         url=url+
          "?useradd_name="+useradd_name+
          "&useradd_password="+useradd_password+
          "&useradd_type="+useradd_type;
        
        }else if(document.getElementById("usermodify_name")){
        var usermodify_name=document.getElementById("usermodify_name").value;
        var usermodify_password=document.getElementById("usermodify_password").value;
        var usermodify_type=document.getElementById("usermodify_type").value;
        url=url+
        "?usermodify_name="+usermodify_name+
        "&usermodify_password="+usermodify_password+
        "&usermodify_type="+usermodify_type;
        }else if(document.getElementById("task_select")){
        var agv=document.getElementById("AGV_select").value;
        var task=document.getElementById("task_select").value;
        url=url+
        "?agv="+agv+
        "&task="+task;
        }else if(document.getElementById("AGV_select")){
        var agv=document.getElementById("AGV_select").value;
        url=url+
        "?AGV_select="+agv;        
        }else if(document.getElementById("agvadd_name")){
        var agv_name=document.getElementById("agvadd_name").value;
        var agv_ip=document.getElementById("agvadd_ip").value;
        url=url+
        "?agvadd_name="+agv_name+
        "&agvadd_ip="+agv_ip;
        }else if(document.getElementById("agvmodify_name")){
        var agvmodify_name=document.getElementById("agvmodify_name").value;
        var agvmodify_ip=document.getElementById("agvmodify_ip").value;
        url=url+
        "?agvmodify_name="+agvmodify_name+
        "&agvmodify_ip="+agvmodify_ip;
        
        }
        
        
            
            //把请求发送到服务器上的指定文件（url指向的文件）进行处理
            xmlHttp.open("GET", url, true);        //true表示异步处理
            xmlHttp.send();

        }
        /**
         * 获取路径（小车的位置是由location来确定的）
         * 前端当前location的值可以得到当前点的像素坐标（先列四个点））
         */
        //取回位置函数
        function location() {
            while(true){
                $.ajax({
                    type : "POST",
                    dataType:"json",
                    url :"getlocation?location=" + location,
                    success : function(data) {
                        /**
                        $("#zhonglei").append(
                            "<option value='"+""+"'>"+""+"</option>"
                        )
                        $.each(data,function(i,middle){
                            $("#zhonglei").append(
                                "<option value='"+middle+"'>"+middle+"</option>"
                            )
                        });
                         **/
                    }
                });
            }
            var location = $("#dalei").val();
            $.ajax({
                type : "POST",
                dataType:"json",
                url :"getpath?location=" + location,
                success : function(data) {
                    $("#zhonglei").append(
                        "<option value='"+""+"'>"+""+"</option>"
                    )
                    $.each(data,function(i,middle){
                        $("#zhonglei").append(
                            "<option value='"+middle+"'>"+middle+"</option>"
                        )
                    });
                }
            });
        }
        function initmiddle() {
            while(true){
                var location = $("#dalei").val();
            }
            var location = $("#dalei").val();
            $.ajax({
                type : "POST",
                dataType:"json",
                url :"getpath?location=" + location,
                success : function(data) {
                    $("#zhonglei").append(
                        "<option value='"+""+"'>"+""+"</option>"
                    )
                    $.each(data,function(i,middle){
                        $("#zhonglei").append(
                            "<option value='"+middle+"'>"+middle+"</option>"
                        )
                    });
                }
            });
        }
 
 
 
    		
 
  
   	</script>
    </body>
</html>