Vue.use(VueRouter);

//时间过滤器
Vue.filter('TodateTime',function (value,format) {
    var o={
        "M+": value.getMonth() + 1, // 月份
        "d+": value.getDate(), // 日
        "h+": value.getHours(), // 小时
        "m+": value.getMinutes(), // 分
        "s+": value.getSeconds(), // 秒
    };
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (value.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return format;
});

const AllAgv=Vue.extend({
    template:'#allAgv',
    data:function () {
        this.$http.get("/agv/allAgv").then(function(response){
            this.$set(this.$data,'agvs',response.data);//注意此处vue1.0的set和vue2.0的set不同
        }).catch(function(response){
            alert("获取服务器端数据错误"+response);
        });
        return{
            agvs:[],
            total:13,
            pagesize:2,
            currentPage:1
        };
    },
    methods:{
        handleSizeChange:function (val) {
            this.pagesize=val;
        },
        handleCurrentChange:function (val) {
            this.currentPage=val;
        }
    }
});

const AllTask=Vue.extend({
    template:'#allTask',
    data:function () {
        this.$http.get("/task/allTask").then(function(response){
            this.$set(this.$data,'tasks',response.data);//注意此处vue1.0的set和vue2.0的set不同
        }).catch(function(response){
            alert("获取服务器端数据错误"+response);
        });
        return{
            tasks:[],
            total:8,
            pagesize:2,
            currentPage:1,
            taskDialogFormVisible:false,
            taskForm:{
                taskType:'',
                beginPoint:'',
                endPoint:'',
                viclesType:'',
                beginAct:false,
                endAct:false,
                selectTime:false,
                time:'',
                selectAgv:false,
                agv:'',
            }
        };
    },
    methods:{
        handleSizeChange:function (val) {
            this.pagesize=val;
        },
        handleCurrentChange:function (val) {
            this.currentPage=val;
        }
    }
});

const FormDemo=Vue.extend({
    template:'#formDemo',
    data:function () {
        // this.$http.get("/SerialPort/findAllPort").then((response)=>{
        //     this.$set(this.$data,'portlists',response.data);//注意此处vue1.0的set和vue2.0的set不同
        // }).catch((response)=>{
        //     alert("获取可用端口错误"+response);
        // });
        return{
            portlists:[],
            port:'',
            baudRatelists:[4800,9600,19200,38400,57600,115200],
            baudRate:'',
            receiveData:'',
        }
    },
    methods:{
        portStart:function () {
            this.receiveData = setInterval(()=>{
                this.$http.get("/SerialPort/PortReceive").then((response)=>{
                    this.$set(this.$data,'receiveData',response.data);//注意此处vue1.0的set和vue2.0的set不同
                }).catch((response)=>{
                    console("读取数据发生错误"+response.data);
                });
            },1000);
        },
        agvUp:function () {
            this.$http.get("/simpleControl/agvUp").then();
        },
        agvDown:function () {
            this.$http.get("/simpleControl/agvDown").then();
        },
        agvStop:function () {
            this.$http.get("/simpleControl/agvStop").then();
        },
        agvLeft:function () {
            this.$http.get("/simpleControl/agvLeft").then();
        },
        agvRight:function () {
            this.$http.get("/simpleControl/agvRight").then();
        }
    }
});

const CanvasDemo=Vue.extend({
    template:'#canvasDemo',
    mounted(){
        var canvas=document.getElementById("canvas");
        this.drawBlackboard(canvas,"white");
    },
    data:function () {
        return{
        }
    },
    methods:{
        drawBlackboard:function (canvas,linecolor) {
            var ctx=canvas.getContext("2d");
            ctx.fillStyle="black";
            ctx.fillRect(0,0,1000,500);//画实心矩形
            var onoff=false;//按下标记
            var oldx= -320;
            var oldy= -160;
            // var linecolor="white";//默认颜色
            var linw=4;//线宽
            canvas.addEventListener("mousemove",draw,true);
            canvas.addEventListener("mousedown",down,false);
            canvas.addEventListener("mouseup",up,false);
            function down(event) {
                onoff=true;
                oldx=event.pageX-320;
                oldy=event.pageY-160;
            }
            function up(event) {
                onoff=false;
            }
            function draw(event) {
                if(onoff==true){
                    var newx=event.pageX-320;
                    var newy=event.pageY-160;
                    ctx.beginPath();
                    ctx.moveTo(oldx,oldy);
                    ctx.lineTo(newx,newy);
                    ctx.strokeStyle=linecolor;
                    ctx.lineWidth=linw;
                    ctx.lineCap="round";
                    ctx.stroke();
                    oldx=newx;
                    oldy=newy;
                };
            }
        },
        change:function (newcolor) {
            var canvas=document.getElementById("canvas");
            this.drawBlackboard(canvas,newcolor);
        },
    }
});

const mapDisplay=Vue.extend({
    template:'#mapDisplay',
    mounted(){
        var canvas = document.getElementById("mapCanvas");
        var gc=canvas.getContext("2d");
        var img = new Image();
        img.src = "../../static/images/MapBase.png";
        var agv = new Image();
        agv.src = "../../static/images/MapAGV1.png";

        gc.drawImage(agv,10,10);
        var b=0;
        var test=this.a;
        setInterval(function (){
            for(var i=0;i<10;i++){
                for(var j=0;j<10;j++){
                    gc.drawImage(img,img.width*i,img.height*j);
                }
            }
            b=b+agv.width;
            gc.drawImage(agv,b,test);
        },1000);
        console.log(this.a);
    },
    data:function () {
        return{
            a:31
        }
    },
    methods:{

    }
});

// 定义路由
// 每个路由应该映射一个组件,
const routes = [
    {path:'/agv/queryAgvAll',component:AllAgv},
    {path:'/task/queryTaskAll',component:AllTask},
    {path:'/controlDemo',component:FormDemo},
    {path:'/canvasDemo',component:CanvasDemo},
    {path:'/map',component:mapDisplay},
];

//创建 router 实例，然后传 routes配置
const router = new VueRouter({
    routes // （缩写）相当于 routes: routes
});

//创建和挂载根实例
// const app = new Vue({
//     router,
// }).$mount('#app');
new Vue({
    el:'#app',
    router,
    data:function () {
        return{
            user:{
                name:'qp'
            }
        }
    },
    methods:{
        loginOut(){
            this.user.name=null;
            // this.userLoginOut();
            // this.$http.get('/api/user').then(response=>{
            //     console.dir(response.data);
            //     if(response.data.message){
            //         this.$message.success(response.data.message);
            //         return false;
            //     }
            // }).catch(error=>{
            //     this.$message.error('${error.message}')
            // })
        },
    }
});