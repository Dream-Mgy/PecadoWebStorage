<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.do">我的文件</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/upLoad.do">上传文件</a></li>
                </ul>
            </div>
            <div class="navbar-right">
                <div class="col-md-4 col-md-offset-4" style="margin-top: 10px;">
                    <div class="input-group">
                        <input type="text" id="inputBox" class="form-control" placeholder="Search for..." />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onclick="search()" >Go!</button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h2 class="sub-header">查询结果</h2>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <tr>
                           <th>文件编号</th>
                           <th>文件名</th>
                           <th>文件大小</th>
                           <th>上传日期</th>
                           <th></th>
                        <tr>
                        <tbody>
                            <c:forEach items="${localFiles}" var="item" varStatus="idxFile">
                                <tr>
                                    <td>${idxFile.index + 1}</td>
                                    <td>${item.fileName}</td>
                                    <td><fmt:formatNumber value="${item.fileSize / 1024 / 1024}" pattern="#0.0#"/>Mb</td>
                                    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd"/></td>
                                    <td><a href="${pageContext.request.contextPath}/download.do?fileId=${item.id}">Download</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination col-md-offset-2">
                        <li>
                            <a href="${pageContext.request.contextPath}/index.do?currentPage=${pagination.getCurrentPage() - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${pagination.getPageCount()}">
                            <li><a href="${pageContext.request.contextPath}/index.do?currentPage=${i}">${i}</a></li>
                        </c:forEach>
                        <li>
                          <a href="${pageContext.request.contextPath}/index.do?currentPage=${pagination.getCurrentPage() + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                  </ul>
                </nav>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/js/vendor/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/ie-emulation-modes-warning.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/prefixfree.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/main.js"></script>
</body>
</html>