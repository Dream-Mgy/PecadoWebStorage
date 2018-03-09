<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico" />
    <title>Welcome to Pecado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/normalize.css" />
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img class="tittleJpg" alt="Brand" src="${pageContext.request.contextPath}/static/img/title.jpg" />
                </a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Pecado</a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-pills nav-stacked" id="contents">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/index.do">我的文件</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/upLoad.do">上传文件</a></li>
                </ul>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="sub-header">上传文件</h1>
                <form action="upload.do" method="post" enctype="multipart/form-data" id="fileForm">
                    <input id="file" type="file" name="file" style="display: none">
                    <div class="input-append">
                        <input id="photoCover" class="input-large" type="text" />
                        <a class="btn btn-danger" onclick="$('input[id=file]').click();">选择</a>
                        <input type="button" class="btn btn-success" value="上传" id="submitButton"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/ie-emulation-modes-warning.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/prefixfree.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/main.js"></script>
    <script>
        $('input[id=file]').change(function() {
            $('#photoCover').val($(this).val());
        });
    </script>
</body>
</html>