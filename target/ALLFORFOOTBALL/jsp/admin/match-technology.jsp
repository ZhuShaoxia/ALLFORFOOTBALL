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
                <legend>比赛选择</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="number" class="layui-input" id="match-lineUp-date" placeholder=" - ">
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
                    <legend>技术统计</legend>
                </fieldset>
                <div style="width: 50%;float: left">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控球率</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射门</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射正</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">封堵</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">任意球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">越位</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">换人</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">犯规</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>

                </div>
                <div style="width: 50%;float: right">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">控球率</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射门</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">射正</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">封堵</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">任意球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角球</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">越位</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">换人</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">犯规</label>
                            <div class="layui-input-inline">
                                <input type="number" name="" lay-verify="required|number" autocomplete="off"
                                       class="layui-input">
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

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
