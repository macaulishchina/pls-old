<%--@elvariable id="task" type="top.macaulish.PLS.entity.TaskEntity"--%>
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
    <!-- Force latest IE rendering engine or ChromeFrame if installed -->
    <meta charset="utf-8">
    <title>${task.taskname}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery UI styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.css"/>
    <!-- Demo styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui-demo.css">
    <!-- blueimp Gallery styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blueimp-gallery.min.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.fileupload.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.fileupload-ui.css">
    <!-- CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.fileupload-noscript.css"></noscript>
    <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.fileupload-ui-noscript.css"></noscript>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pls.css">

</head>
<body >

<div id="uploadFrame" class="container container-body">
    <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" action="${pageContext.request.contextPath}/task/upload.do" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="fileupload-buttonbar">
            <div class="fileupload-buttons">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="fileinput-button">
                <span>Add files...</span>
                <input type="file" name="files[]" multiple>
                <input type="text" id="taskGuid" name="taskGuid" value="${task.guid}" hidden>
            </span>
                <button type="submit" class="start">Start upload</button>
                <button type="reset" class="cancel">Cancel upload</button>
                <button type="button" class="delete">Delete</button>
                <input type="checkbox" class="toggle">
                <!-- The global file processing state -->
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="fileupload-progress fade" style="display:none">
                <!-- The global progress bar -->
                <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation"><tbody class="files"></tbody></table>
    </form>
</div>
<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl" hidden>
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress"></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="start" disabled>Start</button>
            {% } %}
            {% if (!i) { %}
                <button class="cancel">Cancel</button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
<%--{% for (var i=0, file; file=o.files[i]; i++) { %}--%>
    <%--<tr class="template-download fade">--%>
        <%--<td>--%>
            <%--<span class="preview">--%>
                <%--{% if (file.thumbnailUrl) { %}--%>
                    <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>--%>
                <%--{% } %}--%>
            <%--</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<p class="name">--%>
                <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>--%>
            <%--</p>--%>
            <%--{% if (file.error) { %}--%>
                <%--<div><span class="error">Error</span> {%=file.error%}</div>--%>
            <%--{% } %}--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<span class="size">{%=o.formatFileSize(file.size)%}</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<button class="delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>Delete</button>--%>
            <%--<input type="checkbox" name="delete" value="1" class="toggle">--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--{% } %}--%>
</script>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="${pageContext.request.contextPath}/static/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="${pageContext.request.contextPath}/static/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="${pageContext.request.contextPath}/static/js/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="${pageContext.request.contextPath}/static/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="${pageContext.request.contextPath}/static/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-ui.js"></script>
<!-- The File Upload jQuery UI plugin -->
<script src="${pageContext.request.contextPath}/static/js/jquery.fileupload-jquery-ui.js"></script>
<!-- The main application script -->
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.bootcss.com/vue-resource/1.5.1/vue-resource.js"></script>
<script src="${pageContext.request.contextPath}/static/js/upload.js"></script>

</body>
</html>

