<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2018/9/12
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Welcome to PLS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pls.css">
</head>
<body onload="taskManager.refreshTasks()">

<nav class="navbar fixed-top d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h1 class="my-0 mr-md-auto font-weight-normal">Pre-Label Service</h1>
    <div class="my-0 mr-md-auto">
        <button class="btn btn-lg btn-outline-primary" data-toggle="modal" data-target="#newTaskFrame"><i class="far fa-plus-square">&nbsp;</i>New Task</button>
    </div>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="#">Home</a>
        <a class="p-2 text-dark" href="#">About</a>
    </nav>
    <a class="btn btn-outline-primary" href="#">admin</a>
</nav>

<div id="taskManager" class="container container-body">

    <button type="button" class="btn btn-block btn-primary" v-on:click="refreshTasks" >Refresh</button>


    <div v-for="item in taskList" class="row border border-light mb-3 text-center task-room">
        <div class="col-md-12 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title" data-toggle="modal" data-target="#taskDetail">{{ item.taskname }}</h2>
                <div class="progress">
                    <div :class="cssContent(item.state)" role="progressbar" :style="processStyle(100)" aria-valuenow="100" :aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                <h3 class="col-md-6 card-title task-card-state">Task State:<a class="btn btn-outline-primary" href="#">{{ item.state }}</a></h3>
                <h3 class="col-md-6 card-title task-card-state">Create Time:<a class="btn btn-outline-primary" href="#"><i class="time">{{ item.createTime }}</i></a></h3>
                </div>
                <div>
                    <button v-on:click="launchTask(item.guid)" v-if="showLaunch(item.state)" class="btn btn-lg btn-primary">Launch</button>
                    <button v-on:click="stopTask(item.guid)" v-if="showStop(item.state)" class="btn btn-lg btn-danger">Stop</button>
                    <button v-on:click="pauseTask(item.guid)" v-if="showPause(item.state)" class="btn btn-lg btn-secondary">Pause</button>
                    <button v-on:click="downloadTask(item.guid)" v-if="showDownload(item.state)" class="btn btn-lg btn-primary">Download</button>
                    <button v-on:click="deleteTask(item.guid)" v-if="showDelete(item.state)" class="btn btn-lg btn-dark">Delete</button>
                    <button v-on:click="addContent(item.guid)" v-if="showAdd(item.state)" class="btn btn-lg btn-outline-primary">More</button>
                </div>
            </div>
        </div>
    </div>



    <footer class="text-center">
        <div class="inner">
            <p> All copyrights reserved.@<a href="https://www.swjtu.edu.cn/">SWJTU</a>, @<a href="#">macaulish</a>.</p>
        </div>
    </footer>
</div>

<%--popup frame : new task--%>
<div id="newTaskFrame" class="modal fade bd-example-modal-lg " tabindex="-1" role="dialog" aria-labelledby="taskDetailTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content popup-dialog-new-task">
            <div class="modal-header">
                <h2 class="modal-title" id="newTaskFrameTitle">New Task</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="newTaskName" class="col-sm-3 col-form-label"><h5 class="form-label">Task Name</h5></label>
                        <div class="col-sm-9">
                            <input type="text" v-model="taskName" class="form-control" id="newTaskName" aria-describedby="taskNameHelp" placeholder="Please input your task name"/>
                            <small id="taskNameHelp" class="form-text text-muted">Try to take a unique task name.</small>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="preModelSelect" class="col-sm-3 col-form-label"><h5 class="form-label">Choose Model</h5></label>
                        <div class="col-sm-9">
                            <select v-model="model_guid" class="custom-select" id="preModelSelect">
                                <option selected value="">Select the model...</option>
                                <option value="1">Traffic Model</option>
                                <option value="2">Factory Model</option>
                            </select>
                        </div>
                    </div>


                    <div class="form-group row" hidden>
                        <div class="offset-sm-3 col-sm-9">
                            <div class="form-check">
                                <input v-model="auto_if" class="form-check-input" type="checkbox" id="autoSaveCheck">
                                <label class="form-check-label" for="autoSaveCheck">
                                    Auto Download
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" hidden>
                        <label for="autoSavePath" class="col-sm-3 col-form-label"><h5 class="form-label">Save Path</h5></label>
                        <div class="col-sm-9">
                            <input v-model="auto_path" type="text" class="form-control" id="autoSavePath" placeholder="Input the path here">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="creatorName" class="col-sm-3 col-form-label"><h5 class="form-label">Creator</h5></label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="creatorName" placeholder="Input your name here" aria-describedby="creatorHelp" value="admin" readonly>
                            <small id="creatorHelp" class="form-text text-muted">Auto input with the login name.</small>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button @click="newTask()" type="button" class="btn btn-block btn-primary" data-dismiss="modal">Create</button>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.1.14.3.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script></body>
<script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pls.js"></script>

</html>