<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 13:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="../img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../admin/head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;width: 80%">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户信息录入</legend>
            </fieldset>

            <form action="" class="layui-form" method="post">
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
                        <label for="nickname" class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input id="nickname" type="text" name="nickname" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--姓名--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="username" class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input id="username" type="text" name="username" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--性别--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="男" checked="">
                            <input type="radio" name="sex" value="2" title="女">
                        </div>
                    </div>
                </div>
                <%--邮箱--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input id="email" type="email" name="email" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--手机号--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">手机</label>
                        <div class="layui-input-block">
                            <input id="phone" type="text" name="phone" lay-verify="required|phone" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--角色--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">角色</label>
                        <div class="layui-input-block">
                            <select name="role" id="role">
                                <option value="1">会员</option>
                                <option value="2">编辑</option>
                                <option value="3">管理员</option>
                            </select>
                        </div>
                    </div>
                </div>
                <%--主队--%>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">主队</label>
                    <div class="layui-input-block">
                        <select name="city" lay-verify="" lay-search>
                            <option value="010">layer</option>
                            <option value="021">form</option>
                            <option value="0571" selected>layim</option>
                        </select>
                    </div>
                </div>
                <%--简介--%>
                <div class="layui-form-item layui-form-text">
                    <label for="profile" class="layui-form-label">简介</label>
                    <div class="layui-input-block">
                        <textarea id="profile" name="profile" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <%@include file="../admin/bottom.jsp" %>
</div>
<script src="../js/admin/user.js"></script>
</body>
</html>
