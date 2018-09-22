var newTaskApp;
newTaskApp = new Vue({
    el: "#newTaskFrame",
    data: {
        taskName: "",
        model_guid: "",
        auto_if:"",
        auto_path:"",
    },
    methods:{
        newTask:function(){
            //post请求 需要向后台传参数 语法：{params:{a:10,b:2}}
            this.$http.post('/task/new.do',{taskName:this.taskName,model:this.model_guid,creator:1},{emulateJSON: true})
                .then(function(res){
                    console.log(res);
                    console.log(res.data);
                    if(res.data.state === "success") {
                    window.open("/task/add.do?taskGuid=" + this.taskName, "_blank");
                    }else {
                        alert(res.data.data)
                    }
                 },function(res) {
                    console.log('失败');
                    console.log(res);
                    console.log(res.data);
                })
            }
        }
});

var taskManager;
taskManager= new Vue({
    el: "#taskManager",
    data: {
        taskList : []
    },
    methods: {
        refreshTasks: function () {
            this.$http.get('/task/all.get').then(function (res) {
                console.log(res);
                console.log(res.data.data);
                this.taskList = res.data.data;
            }, function (res) {
                console.log('失败');
                console.log(res);
                console.log(res.data);
            })
        },
        processStyle:function (progress) {
            return "width:"+progress+"%";
        },
        processValue:function (progress) {
            return progress;
        },
        cssContent:function (state) {
            let cssContent = "";
            switch (state.toLowerCase()){
                case "uploading":
                    cssContent = "progress-bar progress-bar-striped progress-bar-animated";
                    break;
                case "pause":
                case "ready":
                case "new":
                    cssContent = "progress-bar progress-bar-striped";
                    break;
                case "handling":
                    cssContent = "progress-bar progress-bar-striped progress-bar-animated bg-warning";
                    break;
                case "stop":
                    cssContent = "progress-bar bg-dark";
                    break;
                case "finish":
                    cssContent = "progress-bar bg-success"
                    break;
                default:
                    cssContent = ""
            }
            return cssContent;
        },
        showLaunch:function (state) {
            return state.toLowerCase() === "ready"||state.toLowerCase()==="new"
        },
        showStop:function (state) {
            return state.toLowerCase() === "handling"
        },
        showPause:function (state) {
            return state.toLowerCase() === "handling"
        },
        showDownload:function (state) {
            return state.toLowerCase() === "finish"
        },
        showDelete:function (state) {
            return state.toLowerCase() !== "handling"
        },
        showAdd:function (state) {
            return state.toLowerCase() === "new"||state.toLowerCase() === "ready"
        },
        launchTask:function (guid) {
            this.$http.get('/task/task.do?'+'taskGuid='+guid)
                .then(function (res) {
                console.log(res.data);
                if(res.data.state === "fail"){
                    alert("Error:"+res.data.data)
                }
                this.refreshTasks();
            }, function (res) {
                console.log(res.data);
                alert("Failed to launch the task.Error:"+res.data.data)
            })
        },
        stopTask:function (guid) {
            alert("Developing...stop");
        },
        pauseTask:function (guid) {
            alert("Developing...pause");
        },
        downloadTask:function (guid) {
            alert("Developing...download");
        },
        deleteTask:function (guid) {
            this.$http.get('/task/delete.do?'+'taskGuid='+guid).then(function (res) {
                console.log(res.data);
                this.refreshTasks();
            }, function (res) {
                console.log(res.data);
            })
        },
        addContent:function (guid) {
            window.open("/task/add.do?taskGuid="+guid,"_blank");
        }
    }
});

const uploadApp = new Vue({
    el:"#uploadFrame",
    data:{
        //taskGuid:document.getElementById("taskGuid").valueOf()
    },
    methods:{
        getReady:function(){
            const guid = document.getElementById("taskGuid").value;

            this.$http.get("/task/ready.do?"+"taskGuid="+guid)
                .then(function(res){
                    console.log(res);
                    console.log(res.data);
                    window.open("/task","_self");
                },function(res){
                    console.log('失败')
                    console.log(res);
                    console.log(res.data);
                    window.open("/error","_self");
                })
        }
    }
});
