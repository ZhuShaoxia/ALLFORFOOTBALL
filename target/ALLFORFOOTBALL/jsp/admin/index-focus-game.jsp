<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 13:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
                <legend>当前焦点比赛</legend>
            </fieldset>
            <div class="">

            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>最近比赛</legend>
            </fieldset>
            <table class="layui-hide" id="focus-game-list-table" lay-filter="focus-game-list-table"></table>
        </div>
    </div>
    <script type="text/html" id="focus-game-list-table-bar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <%@include file="${pageContext.request.contextPath}/admin/bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/index.js"></script>
</body>
</html>
