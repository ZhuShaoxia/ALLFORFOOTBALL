<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/27
  Time: 12:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="${pageContext.request.contextPath}/admin/head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户信息查询</legend>
            </fieldset>

        </div>
    </div>

    <%@include file="${pageContext.request.contextPath}/admin/bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/country.js"></script>
</body>
</html>
