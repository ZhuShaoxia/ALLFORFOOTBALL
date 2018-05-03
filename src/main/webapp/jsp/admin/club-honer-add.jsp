<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <legend>俱乐部荣誉信息录入</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="clubId" class="layui-form-label">俱乐部选择</label>
                        <div class="layui-input-inline">
                            <select id="countryId" name="country.id" lay-search lay-filter="countrySelect"
                                    lay-verify="required">
                                <option value=""></option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select id="clubId" name="club.id" lay-search lay-filter="clubSelect" lay-verify="required">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="honerName" class="layui-form-label">荣誉信息</label>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input id="honerName" type="text" name="honerName" lay-verify="required" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="honerTime" class="layui-form-label">获得时间</label>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input name="honerTime" type="text" class="layui-input" id="honerTime"
                                   lay-verify="required">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="club-honer-add">添加</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>当前已获得荣誉</legend>
                </fieldset>
                <div class="">
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>俱乐部名称</th>
                            <th>荣誉名称</th>
                            <th>获得时间</th>
                            <th>所属国家</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="club-honer-tbody">
                        <c:forEach items="${honers}" var="honer">
                            <tr>
                                <td>${honer.club.name}</td>
                                <td>${honer.honerName}</td>
                                <td>${honer.honerTime}</td>
                                <td>${honer.country.name}</td>
                                <td>
                                    <button onclick="delTd(this,'${honer.id}')"
                                            class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/club.js"></script>
</body>
</html>
