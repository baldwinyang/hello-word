<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AGV测试</title>
    <link rel="stylesheet" href="/static/Element-UI/index.css">
</head>

<body>
<script src="/static/js/vue.js"></script>
<script src="/static/Element-UI/index.js"></script>
<script src="/static/js/vue-resource.js"></script>
<script src="/static/vue-router/dist/vue-router.js"></script>
<script src="https://unpkg.com/vue-amap/dist/index.js"></script>
<script src="/static/js/mainapp.js"></script>
    <div id="app">
        <header class="header header-fixed">
            <el-menu background-color="#545c64" text-color="#fff" active-text-color="#ffd04b" class="el-menu-demo " mode="horizontal" :router="true">
                <el-menu-item index="/agv/queryAgvAll">Vehicles</el-menu-item>
                <el-menu-item index="/task/queryTaskAll">Orders</el-menu-item>
                <el-menu-item index="/controlDemo">Control</el-menu-item>
                <el-menu-item index="/canvasDemo">黑板</el-menu-item>
                <el-menu-item index="/map">Map</el-menu-item>
                <el-menu-item :style="{float:'right'}">
                    <%--<router-link v-show="!user.name" to="/login">登录</router-link>--%>
                    <el-button type="text" @click="loginInFormVisible = true" v-show="!user.name">登录</el-button>
                        <el-dialog title="登录" :visible.sync="loginInFormVisible">
                            <el-form :model="loginIn">
                                <el-form-item label="用户名:">
                                    <el-input></el-input>
                                </el-form-item>
                            </el-form>
                        </el-dialog>
                    <el-dropdown @command="loginOut">
                        <span :style="{color:'#FFF'}" v-show="user.name">
                            {{user.name}}<i class="el-icon-caret-bottom el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item command>登出</el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </el-menu-item>
            </el-menu>
        </header>
        <div style="position: relative;height: 60px;width: 100%;"></div>
        <main>
            <div class="main-left bottom">
                <el-menu class="el-menu-vertical-demo" :router="true" default-active="/index">
                    <el-menu-item index="/agv/queryAgvAll">Vehicles</el-menu-item>
                    <el-menu-item index="/task/queryTaskAll">Orders</el-menu-item>
                    <el-menu-item index="/controlDemo">Control</el-menu-item>
                    <el-menu-item index="/canvasDemo">黑板</el-menu-item>
                    <el-menu-item index="/map">Map</el-menu-item>
                </el-menu>
            </div>
            <div class="main-right">
                <router-view></router-view>
            </div>
        </main>
        <div id="container" style="height: 102px"></div>
        <footer>
            <p>&copy; Copyright by CroyQian</p>
        </footer>
    </div>

    <!--                      地图扩展功能                                -->
    <%--<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.3&key=57cc014f5981422c1cde94e44e35be22"></script>--%>
    <%--<script type="text/javascript">--%>
        <%--var map = new AMap.Map('container',{--%>
            <%--resizeEnable: true,--%>
            <%--zoom: 10,--%>
            <%--center: [116.480983, 40.0958]--%>
        <%--});--%>
    <%--</script>--%>

    <%--查询所有Agv页面--%>
    <%@include file="queryAllVehicles.vue"%>

    <%--查询任务页面--%>
    <%@include file="queryAllOrders.vue"%>

    <%--控制demo--%>
    <%@include file="control.vue"%>

    <%--画图的demo--%>
    <%@include file="canvasDemo.vue"%>

    <%--地图--%>
    <%@include file="mapDisplay.vue"%>


    <style>
        /* 头部导航 */
        header{z-index: 1000;min-width: 1200px;transition: all 0.5s ease;  border-top: solid 4px #3091F2;  background-color: #fff;  box-shadow: 0 2px 4px 0 rgba(0,0,0,.12),0 0 6px 0 rgba(0,0,0,.04);  }
        header.header-fixed{position: fixed;top: 0;left: 0;right: 0;}
        header .el-menu-demo{padding-left: 300px!important;}

        /* 主内容区 */
        main{    display: -webkit-box;  display: -ms-flexbox;  display: flex;  min-height: 800px;  border: solid 40px #E9ECF1;  background-color: #FCFCFC;  }
        main .main-left{text-align: center;width: 200px;float: left;}
        main .main-right{-webkit-box-flex: 1;  -ms-flex: 1;  flex: 1;  background-color: #fff; padding: 50px 70px; }
        main .el-menu{background-color: transparent!important;}
    </style>

</body>
</html>