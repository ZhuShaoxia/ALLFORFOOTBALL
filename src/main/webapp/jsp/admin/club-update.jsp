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
                <legend>俱乐部信息录入</legend>
            </fieldset>
            <form id="club-add-form" action="" class="layui-form" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">俱乐部队徽</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传队徽</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg" src="${club.imgUrl}">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input name="id" type="hidden" value="${club.id}">
                <%--俱乐部名称--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="name" class="layui-form-label">俱乐部名称</label>
                        <div class="layui-input-block">
                            <input value="${club.name}" id="name" type="text" name="name"
                                   lay-verify="required|verifyNameIsExist" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--外文名--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="otherName" class="layui-form-label">外文名</label>
                        <div class="layui-input-block">
                            <input value="${club.otherName}" id="otherName" type="text" name="otherName"
                                   lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%----%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="established" class="layui-form-label">成立时间</label>
                        <div class="layui-input-inline">
                            <input value="${club.established}" name="established" type="text" class="layui-input"
                                   id="established"
                                   placeholder="yyyy-MM" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">国家和地区</label>
                        <div class="layui-input-inline">
                            <select name="country.id" id="country.id">
                                <option value="0"></option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="city" class="layui-form-label">城市</label>
                        <div class="layui-input-inline">
                            <input value="${club.city}" id="city" type="text" name="city" lay-verify="required"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--电话 邮箱--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input value="${club.phone}" id="phone" type="text" name="phone" lay-verify="required"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input value="${club.email}" id="email" type="email" name="email"
                                   lay-verify="required|email" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--主场--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="homeField" class="layui-form-label">主场</label>
                        <div class="layui-input-block">
                            <input value="${club.homeField}" id="homeField" type="text" name="homeField"
                                   lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--地址--%>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label for="address" class="layui-form-label">地址</label>
                        <div class="layui-input-block">
                            <input value="${club.address}" id="address" type="text" name="address" lay-verify="required"
                                   placeholder="请输入详细地址"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="club-update-submit">更新俱乐部信息</button>
                        <a class="layui-btn layui-btn-primary" href="/admin/club/list">返回上一步</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/club.js"></script>
</body>
</html>
<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form
            //性别
            var flag = false;
            $("select[name='country.id']").children().each(function (index, item) {
                if ($(item).val() == ${club.country.id}) {
                    $(item).prop("selected", true);
                    layui.use('form', function () {
                        var form = layui.form
                        form.render('select')
                    })
                }
            })
        })

    })
</script>
