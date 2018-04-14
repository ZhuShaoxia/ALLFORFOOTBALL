<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/4/10
  Time: 07:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
        <div style="padding: 15px;width: 80%">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户信息修改</legend>
            </fieldset>

            <form id="user-update-form" class="layui-form" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <%--用户头像--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">用户头像</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg" src="${user.imgUrl}">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--用户账号--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="nickname" class="layui-form-label">账号</label>
                        <div class="layui-input-block">
                            <input id="account" type="text" name="account" lay-verify="required|accountIsExist"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.account}">
                        </div>
                    </div>
                </div>
                <%--用户密码--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="password" class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input id="password" type="password" name="password" lay-verify="required|passwordLength"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.password}">
                        </div>
                    </div>
                </div>
                <%--用户昵称--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="nickname" class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input id="nickname" type="text" name="nickname" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.nickname}">
                        </div>
                    </div>
                </div>
                <%--姓名--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="name" class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input id="name" type="text" name="name" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.name}">
                        </div>
                    </div>
                </div>
                <%--性别--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="男">
                            <input type="radio" name="sex" value="2" title="女">
                        </div>
                    </div>
                </div>
                <%--邮箱--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input id="email" type="email" name="email" lay-verify="email" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.email}">
                        </div>
                    </div>
                </div>
                <%--手机号--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">手机</label>
                        <div class="layui-input-block">
                            <input id="phone" type="text" name="phone" lay-verify="required|phone|phoneIsExist"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input" value="${user.phone}">
                        </div>
                    </div>
                </div>
                <%--角色--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="role" class="layui-form-label">角色</label>
                        <div class="layui-input-block">
                            <select name="role" id="role">
                                <option value="0">管理员</option>
                                <option value="1">会员</option>
                                <option value="2">编辑</option>
                            </select>
                        </div>
                    </div>
                </div>
                <%--主队--%>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label for="clubId" class="layui-form-label">主队</label>
                        <div class="layui-input-inline">
                            <select id="countryId" name="club.country.id" lay-search lay-filter="countrySelect">
                                <option value="0"></option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select id="clubId" name="club.id" lay-search lay-filter="clubSelect">
                                <c:forEach items="${clubs}" var="club">
                                    <option value="${club.id}">${club.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input value="${user.otherClubName}" id="otherClubName" type="text" name="otherClubName"
                                   placeholder="其它球队名字"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                            <span class="layui-badge" style="padding: 4px">***当下拉框中没有主队可输入其它球队名字***</span>
                        </div>
                    </div>
                </div>
                <%--简介--%>
                <div class="layui-form-item layui-form-text">
                    <label for="profile" class="layui-form-label">简介</label>
                    <div class="layui-input-block">
                        <textarea id="profile" name="profile" placeholder="请输入内容"
                                  class="layui-textarea">${user.profile}</textarea>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="user-update-submit">更新用户信息</button>
                        <a class="layui-btn layui-btn-primary" href="/admin/user/list">返回上一步</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/user.js"></script>
<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form

            //性别
            $('input[name=sex]').each(function (index, item) {
                if ($(item).val() == "${user.sex}") {
                    $(item).prop("checked", true);
                    layui.use('form', function () {
                        var form = layui.form
                        form.render('radio')
                    })
                    return
                }
            })

            //角色
            $('select[name=role]').children().each(function (index, item) {
                if ($(item).val() == "${user.role}") {
                    $(item).prop("selected", true);
                    form.render('select')
                    return
                }
            })

            var clubId = "${user.club.id}"
            if (clubId != null) {
                $("#countryId").children().each(function (index, item) {
                    if ($(item).val() == "${user.club.country.id}") {
                        $(item).prop("selected", true);
                        form.render('select')
                        return
                    }
                })
                //俱乐部
                $("#clubId").children().each(function (index, item) {
                        if ($(item).val() == "${user.club.id}") {
                            $(item).prop("selected", true);
                            form.render('select')
                            return
                        }
                    }
                )
            }
        })

    })
</script>
</body>
</html>

