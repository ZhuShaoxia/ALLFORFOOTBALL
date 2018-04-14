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
                            </select>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>比赛阵容选择</legend>
                </fieldset>
                <%--主场--%>
                <div style="width: 50%;float: left">
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">巴塞罗那首发</label>
                            <div class="layui-input-block">
                                <p><input type="checkbox" name="" title="前锋 7号 C罗" checked></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">替补</label>
                            <div class="layui-input-block">
                                <p><input type="checkbox" name="" title="前锋 7号 C罗" checked></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%--客场--%>
                <div style="width: 50%;float: right">
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">广州恒大首发</label>
                            <div class="layui-input-block">
                                <p><input type="checkbox" name="" title="前锋 7号 C罗" checked></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-block">
                            <label class="layui-form-label">广州恒大替补</label>
                            <div class="layui-input-block">
                                <p><input type="checkbox" name="" title="前锋 7号 C罗" checked></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                                <p><input type="checkbox" name="" title="C罗"></p>
                            </div>
                        </div>
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
    </div>

    <%@include file="${pageContext.request.contextPath}/admin/bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
