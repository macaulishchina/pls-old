var uploadApp = new Vue({
    el: "#uploadFrame",
    data: {
        taskGuid:document.getElementById("taskGuid").value,
        sourceList:[]
    },
    methods:{
        refreshSource: function () {
            this.$http.get('/task/source.get?taskGuid='+this.taskGuid).then(function (res) {
                console.log(res);
                console.log(res.data.data);
                this.sourceList = res.data.data;
            }, function (res) {
                console.log(res);
                console.log(res.data);
            })
        }
    }
});
