<%@page pageEncoding="UTF-8"%>
<template id="mapDisplay">
    <div>
        <canvas id="mapCanvas" width="1000" height="500"></canvas>
        <br/>
        <br/>
        <img src="../../static/images/MapBase.png">
        <img src="../../static/images/MapAGV1.png">
        <el-button @click="displayStop">停止</el-button>>
    </div>
</template>