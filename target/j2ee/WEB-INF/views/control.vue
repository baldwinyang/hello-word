<%@page pageEncoding="UTF-8"%>
<template id="formDemo">
    <div>
        <span>通信端口</span>
        <el-select placeholder="请选择端口" v-model="port">
            <el-option v-for="(portlist,idx) in portlists" :label="portlist" :key="idx" :value="portlist">
                <span>{{portlist}}</span>
            </el-option>
        </el-select>
        <br/>
        <br/>
        <span>波特率</span>
        <el-select placeholder="请选择波特率" v-model="baudRate">
            <el-option v-for="(baudRatelist,idx) in baudRatelists" :label="baudRatelist" :key="idx" :value="baudRatelist">
            </el-option>
        </el-select>
        <el-button @click="portStart">开始</el-button>
        <el-button @click="portStart">停止</el-button>
        <br/>
        <br/>
        <div>
            <span>回传数据</span>
            <textarea v-model="receiveData"></textarea>
        </div>
        <br/>
        <br/>
        <span>基本功能键</span>
        <el-button icon="el-icon-arrow-up" @click="agvUp">前进</el-button>
        <el-button icon="el-icon-arrow-down" @click="agvDown">后退</el-button>
        <el-button @click="agvStop">急停</el-button>
        <el-button icon="el-icon-caret-top">升起</el-button>
        <el-button icon="el-icon-caret-bottom">下降</el-button>
        <el-button @click="agvLeft">左转</el-button>
        <el-button @click="agvRight">右转</el-button>
    </div>
</template>