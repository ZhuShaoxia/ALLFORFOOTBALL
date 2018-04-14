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
    <script>
        $(function () {
            var ue = UE.getEditor('ueditor')
        })
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>文章录入</legend>
            </fieldset>
            <%--
                文章标题
                文章副标题
                文章类型
                展示图片
                文章内容
            --%>
            <form action="" class="layui-form" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="" class="layui-form-label">文章标题</label>
                        <div class="layui-input-block">
                            <input id="" type="text" name="" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="" class="layui-form-label">文章副标题</label>
                        <div class="layui-input-block">
                            <input id="" type="text" name="" lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">文章类型</label>
                        <div class="layui-input-inline">
                            <select>
                                <option>闲情</option>
                                <option>中超</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">轮播图片</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">轮播图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>编辑</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div id="ueditor" style="height: 400px"></div>
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
<script src="${pageContext.request.contextPath}/js/admin/article.js"></script>
</body>
</html>
<%--编辑框--%>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.parse.min.js"></script>