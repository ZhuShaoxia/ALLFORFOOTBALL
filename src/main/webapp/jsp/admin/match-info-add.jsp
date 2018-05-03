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
                <legend>比赛信息录入</legend>
            </fieldset>
            <form class="layui-form" action="" method="post">

                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛性质</label>
                        <div class="layui-input-inline">
                            <select id="matchTypeId" name="matchType.id" lay-search lay-filter="matchTypeSelect"
                                    lay-verify="required">
                                <option value=""></option>
                                <c:forEach items="${matchTypes}" var="matchType">
                                    <option value="${matchType.id}">${matchType.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛轮次</label>
                        <div class="layui-input-inline" style="margin-right: 0px">
                            <select id="matchTimes" name="matchTimes" lay-search lay-filter="matchTimes"
                                    lay-verify="required">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" style="margin-right: 0px">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline" style="margin-right: 0px">
                            <select id="homeClubId" name="homeClub.id" lay-search lay-filter="matchClubSelect"
                                    lay-verify="required|verifyClubIdAndMatchTimes">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <span class="layui-span">VS</span>
                    <div class="layui-inline">
                        <%--客场--%>
                        <div class="layui-select-inline">
                            <select id="awayClubId" name="awayClub.id" lay-search lay-filter="matchClubSelect"
                                    lay-verify="required|verifyClubIdAndMatchTimes">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input name="match_date" type="text" class="layui-input" id="match-add-date"
                                   placeholder=" - ">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="match-info-add-submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>当前场次已录入比赛</legend>
            </fieldset>
            <div>
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>主场</th>
                        <th>客场</th>
                        <th>比赛日期</th>
                        <th>比赛时间</th>
                        <th>比赛状态</th>
                    </tr>
                    </thead>
                    <tbody id="match-info-add-table-tbody">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@include file="bottom.jsp" %>
</div>

</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
