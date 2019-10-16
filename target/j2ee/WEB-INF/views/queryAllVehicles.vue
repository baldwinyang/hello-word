<%@page pageEncoding="UTF-8"%>
<template id="allAgv">
    <div>
        <el-row>
            <el-col :span="3">
                <p>车辆列表</p>
            </el-col>
            <el-col :span="3">
                <el-button type="primary">添加车辆</el-button>
            </el-col>
        </el-row>
        <el-table ref="multipleTable" :data="agvs" border style="width: 100%" :default-sort="{prop:'agvid',order:'ascending'}">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="agvid" label="ID" width="150" sortable></el-table-column>
            <el-table-column prop="agvName" label="名称" width="100" sortable></el-table-column>
            <el-table-column prop="agvStatus" label="状态" width="100" sortable></el-table-column>
            <el-table-column prop="isUsed" label="在线" width="100" sortable></el-table-column>
            <el-table-column prop="location" label="坐标" width="100"></el-table-column>
            <el-table-column prop="batteryCapacity" label="电量" width="100" sortable></el-table-column>
            <el-table-column prop="agvIP" label="IP" width="150"></el-table-column>
            <el-table-column prop="agvTask" label="订单" width="100"></el-table-column>
            <el-table-column prop="area" label="当前站点" width="100"></el-table-column>
            <%--<el-table-column label="是否为测试" width="150">--%>
            <%--<template slot-scope="scope">--%>
                <%--<p v-if="scope.row.isTest==0">是</p>--%>
                <%--<p v-else>否</p>--%>
                <%--</template>--%>
            <%--</el-table-column>--%>
            <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="text" size="small">详细信息</el-button>
                    <el-button type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                       :current-page="currentPage" :page-sizes="[10, 20, 30, 40]" :page-size="pagesize"
                       layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
    </div>
</template>