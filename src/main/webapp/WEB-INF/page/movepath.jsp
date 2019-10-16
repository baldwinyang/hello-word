<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/18 0018
  Time: 下午 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <title>Title</title>
    <script src="http://demo.qunee.com/lib/qunee-min.js"></script>
</head>
<body>
<div style="height: 600px;" id="canvas"/>
<script type="text/javascript">

    if(!window.getI18NString){getI18NString = function(s){return s;}}
    var graph = new Q.Graph(canvas);//显示图层
    var path = new Q.Path();//路径


    path.moveTo(0, 0);
    //放置圆圈
    path.lineTo(100, 0);
    //放置圆圈
    path.lineTo(200, 0);
    //放置圆圈
    path.lineTo(200, 100);
    //放置圆圈
    path.lineTo(200, 200);
    path.lineTo(100, 200);
    path.lineTo(0, 200);
    path.lineTo(0, 100);
    path.lineTo(0, -10);
    path.moveTo(0,0);
    path.lineTo(100,0);
    path.lineTo(100,100);
    path.lineTo(100,200);
    path.moveTo(0,100);
    path.lineTo(100,100);
    path.lineTo(200,100);
    path.validate();
    var nodeShape = graph.createNode();
    nodeShape.setStyle(Q.Styles.SHAPE_STROKE, 20);//道路宽度
    nodeShape.setStyle(Q.Styles.SHAPE_STROKE_STYLE, "#cca597");//线的颜色
    nodeShape.setStyle(Q.Styles.SHAPE_FILL_COLOR,"#f8fffd");//包围颜色
    nodeShape.setStyle(Q.Styles.LAYOUT_BY_PATH, true);//未知
    nodeShape.image = path;
    nodeShape.movable = false;

    var line = graph.createNode(null, 0, 0);
    line.setStyle(Q.Styles.SHAPE_STROKE, 1);
    line.setStyle(Q.Styles.SHAPE_STROKE_STYLE, "#e7eebd");//线的颜色
    line.setStyle(Q.Styles.SHAPE_FILL_COLOR, null);//包围颜色
    line.setStyle(Q.Styles.SHAPE_LINE_DASH, [5, 2]);//间断线
    line.image = path;
    line.movable = false;
    line.zIndex = 10;
    //地图的绘制
    //创建小车
    function createCar(color, location){
        var car = graph.createNode(null, 150 - path.bounds.cx, -path.bounds.cy);
        car.setStyle(Q.Styles.SHAPE_FILL_COLOR, color);
        car.image = Q.Shapes.getRect(10, 10, 20,20);//调整小车大小、形状
        car.zIndex = 2000;
        car.movable = false;
        car.set('location', location);
        return car;
    }
    var car = createCar('#51e27f',1200);

    var L = path.length;
    var x = 0;
    //更改：未收到当前位置坐标时候闪烁，收到点坐标之后开始move移动
    function move(car){
        var x = car.get('location') || 0;
        x += 10;
        x %= L;
        car.set('location', x);
        var p = path.getLocation(x);
        car.location = new Q.Point(p.x-path.bounds.cx, p.y-path.bounds.cy);
        car.rotate = p.rotate;
    }
    //尝试原地移动的方式来闪烁  没有效果（后面尝试显示和隐藏）
    function moveself(car){
        var x = car.get('location') || 0;
        x += 0;
        x %= L;
        car.set('location', x);
        var p = path.getLocation(x);
        car.location = new Q.Point(p.x-path.bounds.cx, p.y-path.bounds.cy);
        car.rotate = p.rotate;
    }

    function movebyposition(car){

        var x = car.get('location') || 0;
        x += 0;
        x %= L;
        car.set('location', x);
        var p = path.getLocation(x);
        car.location = new Q.Point(p.x-path.bounds.cx, p.y-path.bounds.cy);
        car.rotate = p.rotate;
    }
    //不解的是为什么能不停地循环呢？每次又能从开始的位置（更改move方法）
    //从末尾移出之后就直接出现在了前面 中间没有时间间隔？？？？？怎么处理的？？、、
    var INTERVAL = 100;//调节更新速度
    setTimeout(function MOVE(){
        move(car);
        setTimeout(MOVE, INTERVAL);
    }, INTERVAL);
</script>
</body>
</html>
