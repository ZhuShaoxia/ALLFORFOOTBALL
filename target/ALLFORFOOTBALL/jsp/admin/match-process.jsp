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
    <script>
        $(function () {
            var ue = UE.getEditor('ueditor')
        })
    </script>
    <style>
        .layui-form-select{
            z-index: 1000;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>比赛选择</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="match-lineUp-date" placeholder=" - ">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline">
                            <select lay-search>
                                <option selected></option>
                                <option>巴塞罗那VS广州恒大</option>
                                <option>巴塞罗那VS广州恒大</option>
                                <option>巴塞罗那VS广州恒大</option>
                                <option>巴塞罗那VS广州恒大</option>
                            </select>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>精彩集锦</legend>
                </fieldset>
                <div class="layui-container">
                    <div id="ueditor" class="layui-row" style="height: 400px;overflow: hidden">

                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>

        <%@include file="bottom.jsp" %>
    </div>
    <script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
<%--编辑框--%>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.parse.min.js"></script>