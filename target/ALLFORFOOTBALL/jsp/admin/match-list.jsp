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
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>比赛信息查询</legend>
            </fieldset>
            <div class="">
                <div class="layui-inline">
                    <input class="layui-input" placeholder="请输入搜索内容" name="user-list-bale-reload"
                           id="user-list-bale-reload" autocomplete="off">
                </div>
                <button class="layui-btn" data-type="reload">搜索</button>
                <div class="layui-inline">
                    <label class="layui-form-label">比赛日期</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="match-list-date" placeholder=" - ">
                    </div>
                </div>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>信息查询结果</legend>
            </fieldset>
            <table class="layui-hide" id="user-list-table" lay-filter="user-list-table"></table>
        </div>
    </div>
    <script type="text/html" id="user-list-table-bar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
