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
                <legend>比赛信息录入</legend>
            </fieldset>
            <form class="layui-form" action="">

                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛性质</label>
                        <div class="layui-input-inline">
                            <select lay-search>
                                <option selected>中超</option>
                                <option>西甲</option>
                                <option>英超</option>
                                <option>意甲</option>
                                <option>法甲</option>
                                <option>德甲</option>
                            </select>
                        </div>
                    </div>
                    <%--<div class="layui-inline" style="margin-right: 0px">--%>
                    <%--<div class="layui-input-inline">--%>
                    <%--<select lay-search>--%>
                    <%--<option>欧冠</option>--%>
                    <%--<option>亚冠</option>--%>
                    <%--<option>足协杯</option>--%>
                    <%--</select>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛轮次</label>
                        <div class="layui-input-inline" style="margin-right: 0px">
                            <input type="number" class="layui-input" value="23">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline" style="margin-right: 0px">
                            <select lay-search>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                            </select>
                        </div>
                    </div>
                    <span class="layui-span">VS</span>
                    <div class="layui-inline">
                        <%--客场--%>
                        <div class="layui-select-inline">
                            <select lay-search>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                                <option>巴塞罗那</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="match-add-date" placeholder=" - ">
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
    <%@include file="bottom.jsp" %>
</div>

</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
