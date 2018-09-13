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

    <title>Hello World</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="static/css/pls.css">
</head>
<body>

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

<div class="container container-body">
    <div class="row border border-light mb-3 text-center task-room">
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title" data-toggle="modal" data-target="#taskDetail">Task One</h2>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-primary" href="#">Uploading</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:22:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger">Stop</a>
                    <a href="#" class="btn btn-lg btn-secondary">Pause</a>
                    <a href="#" class="btn btn-lg btn-primary" hidden>Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>

                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Two</h2>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-primary" href="#">Paused</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:23:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger">Stop</a>
                    <a href="#" class="btn btn-lg btn-primary">Resume</a>
                    <a href="#" class="btn btn-lg btn-primary" hidden>Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>

                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Three</h2>
                <div class="progress">
                    <div class="progress-bar bg-dark" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-primary" href="#">Stop</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 23:23:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger" hidden>Stop</a>
                    <a href="#" class="btn btn-lg btn-primary" hidden>Resume</a>
                    <a href="#" class="btn btn-lg btn-primary" hidden>Download</a>
                    <a href="#" class="btn btn-lg btn-dark">Delete</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Four</h2>
                <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-success" href="#">Finish</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:22:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger" hidden>Stop</a>
                    <a href="#" class="btn btn-lg btn-secondary" hidden>Pause</a>
                    <a href="#" class="btn btn-lg btn-primary">Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Five</h2>
                <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-success" href="#">Finish</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:22:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger" hidden>Stop</a>
                    <a href="#" class="btn btn-lg btn-secondary" hidden>Pause</a>
                    <a href="#" class="btn btn-lg btn-primary">Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>

                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Six</h2>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-warning" href="#">Handling</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:22:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger">Stop</a>
                    <a href="#" class="btn btn-lg btn-secondary">Pause</a>
                    <a href="#" class="btn btn-lg btn-primary" hidden>Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>

                </div>
            </div>
        </div>
        <div class="col-md-4 card mb-4 shadow-sm task-card">
            <div class="card-header">
                <h2 class="my-0 font-weight-normal task-card-title">Task Seven</h2>
                <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="card-body">
                <h3 class="card-title task-card-state">State:<a class="btn btn-outline-success" href="#">Finish</a></h3>
                <h3 class="card-title task-card-state">Time:<a class="btn btn-outline-primary" href="#"><i class="time">2018-9-13 19:22:00</i></a></h3>
                <div>
                    <a href="#" class="btn btn-lg btn-danger" hidden>Stop</a>
                    <a href="#" class="btn btn-lg btn-secondary" hidden>Pause</a>
                    <a href="#" class="btn btn-lg btn-primary">Download</a>
                    <a href="#" class="btn btn-lg btn-dark" hidden>Delete</a>
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
<div class="modal fade bd-example-modal-lg " id="newTaskFrame" tabindex="-1" role="dialog" aria-labelledby="taskDetailTitle" aria-hidden="true">
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
                            <input type="text" class="form-control" id="newTaskName" aria-describedby="taskNameHelp" placeholder="Please input your task name">
                            <small id="taskNameHelp" class="form-text text-muted">Try to take a unique task name.</small>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="preModelSelect" class="col-sm-3 col-form-label"><h5 class="form-label">Choose Model</h5></label>
                        <div class="col-sm-9">
                            <select class="custom-select" id="preModelSelect">
                                <option selected value="0">Select the model...</option>
                                <option value="1">Traffic Model</option>
                                <option value="2">Factory Model</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="newTaskName" class="col-sm-3 col-form-label"><h5 class="form-label">Choose Files</h5></label>
                        <div class="col-sm-9">
                            <input type="file" id="chooseFiles" class="form-control" multiple="multiple" aria-describedby="chooseFilesHelp" />
                            <small id="chooseFilesHelp" class="form-text text-muted">You can choose more than one file.</small>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="offset-sm-3 col-sm-9">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="autoSaveCheck">
                                <label class="form-check-label" for="autoSaveCheck">
                                    Auto Download
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="autoSavePath" class="col-sm-3 col-form-label"><h5 class="form-label">Save Path</h5></label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="autoSavePath" placeholder="Input the path here">
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
                <button type="button" class="btn btn-block btn-primary">Launch</button>
            </div>
        </div>
    </div>
</div>

<%--popup frame : task details--%>
<div class="modal fade bd-example-modal-lg " id="taskDetail" tabindex="-1" role="dialog" aria-labelledby="?" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content popup-dialog-task-detail">
            <div class="modal-header">
                <h2 class="modal-title" id="taskDetailTitle">Task Detail</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h1 class="text-center">Task One</h1>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <div class="alert alert-primary" role="alert">
                    <h2 class="card-title task-card-state">Task State:<span>Uploading</span></h2>
                </div>
                <div class="alert alert-primary" role="alert">
                    <h2 class="card-title task-card-state">File Number:<span>520</span></h2>
                </div>
                <div class="alert alert-primary" role="alert">
                    <h2 class="card-title task-card-state">Total Size:<span>1.2GB</span></h2>
                </div>
                <div class="alert alert-primary" role="alert">
                    <h2 class="card-title task-card-state">Creator:<span>yidong.hu</span></h2>
                </div>
                <div class="alert alert-primary" role="alert">
                    <h2 class="card-title task-card-state">Create Time:<span>2018-9-13 23:58:00</span></h2>
                </div>
                <div>
                    <a href="#" class="btn btn-block btn-lg btn-danger">Stop</a>
                    <a href="#" class="btn btn-block btn-lg btn-secondary">Pause</a>
                    <a href="#" class="btn btn-block btn-lg btn-primary" hidden>Download</a>
                    <a href="#" class="btn btn-block btn-lg btn-dark" hidden>Delete</a>
                </div>

            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>




<!-- Bootstrap core JavaScript-->
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/popper.1.14.3.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>