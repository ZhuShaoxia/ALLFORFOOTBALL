<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/userinfo.css"/>
    <link rel="stylesheet" type="text/css" href="css/ImgCropping.css">
    <link rel="stylesheet" type="text/css" href="css/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/setting-bind.css">

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cropper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap-select.min.js" type="text/javascript" charset="utf-8"></script>

    <%--select2插件CDN--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <%--表单验证--%>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>


    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row" style="margin-bottom: 30px">
        <ul class="nav nav-tabs nav-justified" style="background-color:rgb(220,220,220)">
            <li><a href="setting-profile.jsp">基本资料</a></li>
            <li class="active"><a href="#">账号绑定</a></li>
            <li><a href="setting-changePwd.jsp">密码修改</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="setting-bind">
            <p>绑定邮箱和密码。账号更安全。</p>
            <div class="item">
                <span class="name">邮箱</span>
                <a class="changeBtn">绑定邮箱</a>
            </div>
            <div class="item">
                <div>
                    <span class="name">手机</span>
                    <span class="content">152****4977</span>
                    <a href="#" class="changeBtn">修改</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%--邮箱绑定模态框--%>
<div class="modal fade" id="bindEmailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body">在这里添加一些文本</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>

