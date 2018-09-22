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
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
</head>
<body>
    <h1>Hello, world!</h1>
    <a type="button" class="btn btn-primary" href="WEB-INF/jsp/pls.jsp">index3</a>
    <a type="button" class="btn btn-primary" href="index.html">upload</a>

    <div id="app">
        <div>{{message1}}</div>
        <div v-if="seen">{{message2}}</div>
    </div>

    <div id="app-2">
      <span v-bind:title="message">
        鼠标悬停几秒钟查看此处动态绑定的提示信息！
      </span>
    </div>

    <div id="app-4">
        <ol>
            <li v-for="todo in todos">
                {{ todo.text }}
            </li>
        </ol>
    </div>

    <div id="app-5">
        <p>{{ message }}</p>
        <button v-on:click="reverseMessage">逆转消息</button>
    </div>

    <div id="app-6">
        <p>{{ message }}</p>
        <input v-model="message">
    </div>

    <div id="app-7">
        <ol>
            <!--
              现在我们为每个 todo-item 提供 todo 对象
              todo 对象是变量，即其内容可以是动态的。
              我们也需要为每个组件提供一个“key”，稍后再
              作详细解释。
            -->
            <todo-item
                    v-for="item in groceryList"
                    v-bind:todo="item"
                    v-bind:key="item.id">
            </todo-item>
        </ol>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="static/js/jquery-3.3.1.min.js"></script>
    <script src="static/js/popper.1.14.3.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/pls.js"></script>


</body>
</html>
