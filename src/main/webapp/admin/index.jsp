<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 10:53
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
        <div style="">
            <%--<img src="../img/court.jpg" alt="" style="width: 100%;height: 100%">--%>
        </div>
    </div>


    <%@include file="../admin/bottom.jsp" %>
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>
</html>