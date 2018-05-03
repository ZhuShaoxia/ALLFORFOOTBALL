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
    <%--<script src="${pageContext.request.contextPath}/layui/formSelects.js"></script>--%>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>比赛选择</legend>
            </fieldset>
            <form class="layui-form" action="" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" lay-verify="required" id="match-lineUp-date" placeholder=" - ">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline">
                            <select id="matchInfoId" lay-verify="required" name="matchInfo.id" lay-search lay-filter="match-lineUp-select">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <%--主场--%>
                <div style="width: 50%;float: left">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend id="homeClubLegend">主场</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">首发</label>
                            <div class="layui-input-inline" id="homeClubPlayerFirstStart">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">替补</label>
                            <div class="layui-input-block" id="homeClubPlayerSubstitutes">
                            </div>
                        </div>
                    </div>
                </div>
                <%--客场--%>
                <div style="width: 50%;float: right">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend id="awayClubLegend">客场</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">首发</label>
                            <div class="layui-input-block" id="awayClubPlayerFirstStart">

                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">替补</label>
                            <div class="layui-input-block" id="awayClubPlayerSubstitutes">
                            </div>
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="match-lineUp-submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
