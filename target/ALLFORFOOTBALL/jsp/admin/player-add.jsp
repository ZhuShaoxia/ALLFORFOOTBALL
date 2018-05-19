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
                <legend>球员基本信息录入</legend>
            </fieldset>
            <form class="layui-form" action="" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">球员长相</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">球员姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">外文名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="otherName" lay-verify="required" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="clubId" class="layui-form-label">球队</label>
                        <div class="layui-input-inline">
                            <select id="countryId" name="club.country.id" lay-search lay-filter="countrySelect" lay-verify="required">
                                <option value=""></option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select id="clubId" name="club.id" lay-search lay-filter="clubSelect">

                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="playerPosition.id" class="layui-form-label">位置</label>
                        <div class="layui-input-inline">
                            <select id="playerPosition.id" name="playerPosition.id" lay-verify="required">
                                <option value=""></option>
                                <c:forEach items="${playerPositions}" var="playerPosition">
                                    <option value="${playerPosition.id}">${playerPosition.position}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="number" class="layui-form-label">号码</label>
                        <div class="layui-input-inline">
                            <input id="number" type="number" name="number" lay-verify="required" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="country" class="layui-form-label">国籍</label>
                        <div class="layui-input-inline">
                            <input id="country" type="text" name="country" lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="birthday" class="layui-form-label">生日</label>
                        <div class="layui-input-inline">
                            <input name="birthday" type="text" class="layui-input" id="birthday" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="age" class="layui-form-label">年龄</label>
                        <div class="layui-input-inline">
                            <input id="age" type="number" name="age" lay-verify="" autocomplete="off"
                                   class="layui-input"
                                   disabled>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="height" class="layui-form-label">身高</label>
                        <div class="layui-input-inline">
                            <input id="height" type="number" name="height" lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入(单位cm)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="weight" class="layui-form-label">体重</label>
                        <div class="layui-input-inline">
                            <input id="weight" type="number" name="weight" lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入(单位kg)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="usualFoot" class="layui-form-label">惯用脚</label>
                        <div class="layui-input-inline">
                            <select id="usualFoot" name="usualFoot">
                                <option value="1">左脚</option>
                                <option value="2">右脚</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="power" class="layui-form-label">力量</label>
                        <div class="layui-input-inline">
                            <input id="power" type="number" name="power" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="speed" class="layui-form-label">速度</label>
                        <div class="layui-input-inline">
                            <input id="speed" type="number" name="speed" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="shooting" class="layui-form-label">射门</label>
                        <div class="layui-input-inline">
                            <input id="shooting" type="number" name="shooting" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="pass" class="layui-form-label">传球</label>
                        <div class="layui-input-inline">
                            <input id="pass" type="number" name="pass" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="dribbling" class="layui-form-label">盘带</label>
                        <div class="layui-input-inline">
                            <input id="dribbling" type="number" name="dribbling" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="defensive" class="layui-form-label">防守</label>
                        <div class="layui-input-inline">
                            <input id="defensive" type="number" name="defensive" lay-verify="required|maxLength111"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="player-add-submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/player.js"></script>
</body>
</html>