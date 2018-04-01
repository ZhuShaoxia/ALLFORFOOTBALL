<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/27
  Time: 12:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../admin/head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>国家队信息录入</legend>
            </fieldset>
            <form action="" class="layui-form" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">国家队队徽</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传队徽</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--国家队名称--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="nickname" class="layui-form-label">国家队名称</label>
                        <div class="layui-input-block">
                            <input id="nickname" type="text" name="" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%--外文名--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="username" class="layui-form-label">外文名</label>
                        <div class="layui-input-block">
                            <input id="username" type="text" name="username" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%----%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">成立时间</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="establish" placeholder="yyyy-MM">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">国家和地区</label>
                        <div class="layui-input-inline">
                            <%--TODO:下拉框--%>
                        </div>
                    </div>

                </div>
                <%----%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input id="phone" type="text" name="phone" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input id="email" type="email" name="email" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="phone" class="layui-form-label">主场</label>
                        <div class="layui-input-block">
                            <input id="" type="text" name="phone" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <%----%>
                <div class="layui-form-item">
                    <div class="layui-block">
                        <label for="phone" class="layui-form-label">地址</label>
                        <div class="layui-input-block">
                            <input id="" type="text" name="phone" lay-verify="" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
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
<script src="../js/admin/club.js"></script>
</body>
</html>
