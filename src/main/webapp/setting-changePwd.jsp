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
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="css/ImgCropping.css">
    <link rel="stylesheet" type="text/css" href="css/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cropper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap-select.min.js" type="text/javascript" charset="utf-8"></script>

    <%--select2插件CDN--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <%--表单验证--%>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

    <script src="js/setting-changePwd.js" type="text/javascript" charset="utf-8"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>


</head>

<style>
    .setting-changePwd {
        padding-top: 30px;
        padding-left: 10%;
        padding-right: 15%;
        /*width: 90%;*/
    }
</style>

<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row" style="margin-bottom: 30px">
        <ul class="nav nav-tabs nav-justified" style="background-color:rgb(220,220,220)">
            <li><a href="setting-profile.jsp">基本资料</a></li>
            <li><a href="setting-bind.jsp">账号绑定</a></li>
            <li class="active"><a href="#">密码修改</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="setting-changePwd">
            <form class="form-horizontal" role="form" id="setting-changePwd-form">
                <div class="form-group">
                    <label for="setting-changePwd-oldPwd" class="col-sm-2 control-label">旧密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="setting-changePwd-oldPwd" name="setting-changePwd-oldPwd" placeholder="请输入原密码">
                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px">
                    <label for="setting-changePwd-newPwd" class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="setting-changePwd-newPwd" name="setting-changePwd-newPwd" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="setting-changePwd-newPwd2" class="col-sm-2 control-label">再次确认密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="setting-changePwd-newPwd2" name="setting-changePwd-newPwd2" placeholder="请再次输入密码">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input id="setting-changePwd-Btn" value="确认修改" type="button" class="btn btn-danger btn-block"></input>
                    </div>
                </div>
        </div>
    </div>


</div>
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>

