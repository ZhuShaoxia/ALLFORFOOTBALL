<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  match: zhuxiaolei
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
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

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
            <div class="layui-form">
                <div class="layui-inline">
                    <select id="matchTypeId" name="matchType.id" lay-search lay-filter="match-list-typeSelect">
                        <option value=""></option>
                        <c:forEach items="${matchTypes}" var="matchType">
                            <option value="${matchType.id}">${matchType.type}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-inline">
                    <input class="layui-input" placeholder="请输入搜索内容" name="match-list-bale-reload"
                           id="match-list-bale-reload" autocomplete="off">
                </div>
                <button id="match-list-search-btn" class="layui-btn">搜索</button>
                <div class="layui-inline">
                    <label class="layui-form-label">比赛日期</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="match-list-date" placeholder="-">
                    </div>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>信息查询结果</legend>
            </fieldset>
            <table class="layui-hide" id="match-list-table" lay-filter="match-list-table"></table>
        </div>
    </div>
    <script type="text/html" id="match-list-table-bar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="homeClubTpl">
        {{#  if(d.homeClub !=null){ }}
        {{ d.homeClub.name }}
        {{# }}}
    </script>
    <script type="text/html" id="awayClubTpl">
        {{#  if(d.awayClub !=null){ }}
        {{ d.awayClub.name }}
        {{# }}}
    </script>
    <script type="text/html" id="matchTypeTpl">
        {{#  if(d.matchType !=null){ }}
        {{ d.matchType.type }}
        {{# }}}
    </script>
    <script type="text/html" id="matchStateTpl">
        {{#  if(d.matchState !=null){ }}
        {{ d.matchState.state }}
        {{# }}}
    </script>
    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
