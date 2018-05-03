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
                <legend>比赛选择</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="match-technology-date" placeholder=" - "
                                   lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline">
                            <select id="matchInfoId" name="matchInfo.id" lay-search lay-verify="required"
                                    lay-filter="match-technology-select">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>
                <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
                <%--<legend>技术统计</legend>--%>
                <%--</fieldset>--%>
                <div style="width: 50%;float: left">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend id="homeClubLegend">主场</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控球率</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].ballControlRate" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射门</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].shooting" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射正</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].shootZ" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">封堵</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].plugging" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">任意球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].freeKick" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].cornerKick" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">越位</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].offside" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">换人</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].substitution" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">犯规</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[0].foul" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                                <input type="hidden" name="tecStaList[0].matchPlace" value="1">
                            </div>
                        </div>
                    </div>

                </div>
                <div style="width: 50%;float: right">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend id="awayClubLegend">客场</legend>
                    </fieldset>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控球率</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].ballControlRate" lay-verify="required|number|maxLength"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射门</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].shooting" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射正</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].shootZ" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">封堵</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].plugging" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">任意球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].freeKick" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].cornerKick" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">越位</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].offside" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">换人</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].substitution" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">犯规</label>
                            <div class="layui-input-inline">
                                <input type="number" name="tecStaList[1].foul" lay-verify="required|number|maxLength"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                            <input type="hidden" name="tecStaList[1].matchPlace" value="2">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="match-technology-submit">立即提交</button>
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
