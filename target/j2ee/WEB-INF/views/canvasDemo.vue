<%@page pageEncoding="UTF-8"%>
<template id="canvasDemo">
    <div>
        <canvas id="canvas" width="1000" height="500"></canvas>
        <el-button type="info" @click='change("yellow")'>Yellow</el-button>
        <el-button type="info" @click='change("blue")'>Blue</el-button>
    </div>
</template>