<%@page pageEncoding="UTF-8"%>
<template id="allTask">
    <div>
        <el-row>
            <el-col :span="3">
                <p>订单列表</p>
            </el-col>
            <el-col :span="3">
                <el-button type="primary" @click="taskDialogFormVisible=true">添加订单</el-button>
            </el-col>
            <el-col :span="3">
                <el-button type="primary">添加多订单</el-button>
            </el-col>
        </el-row>
        <el-dialog title="添加订单" :visible.sync="taskDialogFormVisible">
            <el-form :model="taskForm" ref="form" label-width="100px">
                <el-form-item label="类型">
                    <el-select v-model="taskForm.taskType" placeholder="请选择类型">
                        <el-option label="普通搬运任务(A->B)" value="0"></el-option>
                        <el-option label="拣货任务(A->B->C)" value="1"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="起始站点">
                    <el-input auto-complete="off" v-model="taskForm.beginPoint" suffix-icon="el-icon-edit"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-col :span="4">
                        <el-checkbox label="动作" v-model="taskForm.beginAct"></el-checkbox>
                    </el-col>
                    <el-col :span="8">
                        <el-input :disabled="taskForm.beginAct==false">
                            <template slot="append">动作ID</template>
                        </el-input>
                    </el-col>
                    <el-col :span="8" :offset="4">
                        <el-input :disabled="taskForm.beginAct==false">
                            <template slot="append">动作参数</template>
                        </el-input>
                    </el-col>
                </el-form-item>
                <el-form-item label="目标站点">
                    <el-input v-model="taskForm.endPoint" auto-complete="off" suffix-icon="el-icon-edit"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-col :span="4">
                        <el-checkbox label="动作" v-model="taskForm.endAct"></el-checkbox>
                    </el-col>
                    <el-col :span="8">
                        <el-input :disabled="taskForm.endAct==false">
                            <template slot="append">动作ID</template>
                        </el-input>
                    </el-col>
                    <el-col :span="8" :offset="4">
                        <el-input :disabled="taskForm.endAct==false">
                            <template slot="append">动作参数</template>
                        </el-input>
                    </el-col>
                </el-form-item>
                <el-form-item label="车辆类型">
                    <el-select v-model="taskForm.viclesType" placeholder="请选择类型">
                        <el-option label="不限" value="0"></el-option>
                        <el-option label="搬运式" value="1"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="指定执行时间">
                    <el-checkbox v-model="taskForm.selectTime"></el-checkbox>
                    <el-date-picker type="datetime" placeholder="选择日期时间" v-model="taskForm.time" :disabled="taskForm.selectTime==false"></el-date-picker>
                    <p>选中复选框可指定该订单的执行时间</p>
                </el-form-item>
                <el-form-item label="指定执行车辆">
                    <el-checkbox v-model="taskForm.selectAgv"></el-checkbox>
                    <el-select placeholder="请选择" :disabled="taskForm.selectAgv==false" v-model="taskForm.agv">
                        <el-option label="0" value="0"></el-option>
                        <el-option label="1" value="1"></el-option>
                    </el-select>
                    <p>选中复选框可指定该订单的执行车辆</p>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="taskDialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="taskDialogFormVisible = false">确 定</el-button>
            </div>
        </el-dialog>

        <el-table ref="multipleTable" :data="tasks" border style="width: 100%" :default-sort="{prop:'agvid',order:'ascending'}">
            <el-table-column type="selection" width="55"></el-table-column>
            <el-table-column prop="taskID" label="ID" width="100" sortable></el-table-column>
            <el-table-column prop="taskType" label="类型" width="150" sortable>
                <template slot-scope="scope">
                    <p v-if="scope.row.taskType==1">拣货任务(A->B->C)</p>
                </template>
            </el-table-column>
            <el-table-column prop="taskStatus" label="状态" width="150" sortable>
                <template slot-scope="scope">
                    <p v-if="scope.row.taskStatus==1">FINISHED</p>
                    <p v-else-if="scope.row.taskStatus==2">QUEUEING</p>
                    <p v-else-if="scope.row.taskStatus==3">acFINISHED</p>
                </template>
            </el-table-column>
            <el-table-column prop="taskStartTime" label="接收时间" width="250" sortable>
                <template slot-scope="scope">
                    <p>{{new Date(scope.row.taskStartTime) | TodateTime('yyyy-MM-dd hh:mm:ss')}}</p>
                </template>
            </el-table-column>
            <el-table-column label="车辆ID" width="150">
                <template slot-scope="scope">
                    <p v-if="scope.row.taskAgvID==null" style="color:red">没有分配车辆</p>
                    <P v-else style="color: green">{{scope.row.taskAgvID}}</P>
                </template>
            </el-table-column>
            <el-table-column prop="taskFinishTime" label="完成时间" width="250" sortable>
                <template slot-scope="scope">
                    <p>{{new Date(scope.row.taskFinishTime) | TodateTime('yyyy-MM-dd hh:mm:ss')}}</p>
                </template>
            </el-table-column>
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