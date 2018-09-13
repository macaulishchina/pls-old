<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2018/9/11
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: hu
  Date: 2018/9/11
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Hello World</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/cover.css">
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="header">
        <div class="inner">
            <h3 class="header-brand">Pre-Label Service</h3>
            <nav class="nav nav-list justify-content-center">
                <a class="nav-link active" href="#">Home</a>
                <a class="nav-link" href="#">About</a>
                <a class="nav-link" href="#">Contact</a>
            </nav>
        </div>
    </header>

    <main role="main" class="container task-frame">

        <div class="card-deck mb-3 text-center">
            <div class="card mb-4 shadow-sm">
                <div class="card-header">
                    <h4 class="my-0 font-weight-normal">Free</h4>
                </div>
                <div class="card-body">
                    <h1 class="card-title pricing-card-title">$0 <small class="text-muted">/ mo</small></h1>
                    <ul class="list-unstyled mt-3 mb-4">
                        <li>10 users included</li>
                        <li>2 GB of storage</li>
                        <li>Email support</li>
                        <li>Help center access</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-block btn-outline-primary">Sign up for free</button>
                </div>
            </div>
            <div class="card mb-4 shadow-sm">
                <div class="card-header">
                    <h4 class="my-0 font-weight-normal">Pro</h4>
                </div>
                <div class="card-body">
                    <h1 class="card-title pricing-card-title">$15 <small class="text-muted">/ mo</small></h1>
                    <ul class="list-unstyled mt-3 mb-4">
                        <li>20 users included</li>
                        <li>10 GB of storage</li>
                        <li>Priority email support</li>
                        <li>Help center access</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-block btn-primary">Get started</button>
                </div>
            </div>
            <div class="card mb-4 shadow-sm">
                <div class="card-header">
                    <h4 class="my-0 font-weight-normal">Enterprise</h4>
                </div>
                <div class="card-body">
                    <h1 class="card-title pricing-card-title">$29 <small class="text-muted">/ mo</small></h1>
                    <ul class="list-unstyled mt-3 mb-4">
                        <li>30 users included</li>
                        <li>15 GB of storage</li>
                        <li>Phone and email support</li>
                        <li>Help center access</li>
                    </ul>
                    <button type="button" class="btn btn-lg btn-block btn-primary">Contact us</button>
                </div>
            </div>
        </div>

        <div class="row task-frame-header">
            <button type="button" class="btn btn-primary col-md-4">New Task</button>
        </div>
        <div class="row task-frame-display">
            <div class="col-md-4 task-block">
                <div class="row task-block-row-0">
                    <div class="progress col-md-10">
                        <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">标注任务1</div>
                    </div>
                    <button type="button" class="col-md-2">Cancel</button>
                </div>
                <div class="row task-block-row-1">
                    <button type="button" class="btn btn-info col-md-2">State:</button>
                    <button type="button" class="btn btn-link col-md-8">Free</button>
                    <button type="button" class="btn btn-light col-md-2">Details</button>
                </div>
                <div class="row task-block-row-2">
                    <button type="button" class="btn btn-info col-md-2">Create Time:</button>
                    <button type="button" class="btn btn-link col-md-10"><i>2018-9-10 23:25:00</i></button>
                </div>
            </div>

            <div class="progress">
                <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>

        <h1 class="cover-heading">Cover your page.</h1>
        <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
        <p class="lead">
            <a href="#" class="btn btn-lg btn-secondary">Learn more</a>
        </p>
    </main>

    <footer class="footer mt-auto">
        <div class="inner">
            <p> All copyrights reserved.@<a href="https://www.swjtu.edu.cn/">SWJTU</a>, @<a href="#">macaulish</a>.</p>
        </div>
    </footer>
</div>

<!-- Bootstrap core JavaScript-->
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/js/popper.1.14.3.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

</body>
</html>

