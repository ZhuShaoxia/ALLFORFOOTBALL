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
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="css/verify.css"/>


    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/verify.min.js" type="text/javascript" charset="utf-8"></script>
    <%--校验码--%>
    <script type="text/javascript" src="js/sendCheckCode.js"></script>
    <%--验证--%>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>


    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<style>
    .modal-body .item {
        font-size: 15px;
        height: 34px;
        /*width: 200px;*/
        padding-left: 30px;
    }

    .error {
        float: left;
        color: red;
        margin-top: 5px;
    }

</style>

<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo" style="text-align: center">
    <div class="registerInfo">
        <form class="form-horizontal" role="form" id="registerForm">
            <div class="form-group" style="margin-bottom: 20px">
                <h1>欢迎注册懂球儿</h1>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input name="username" type="text" class="form-control" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input id="register-pwd1" name="register-pwd1" type="password" class="form-control" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input id="register-pwd2" name="register-pwd2" type="password" class="form-control" placeholder="请再次输入密码">
                </div>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div class="input-group">
                        <span class="input-group-addon" style="">+86</span>
                        <input name="mobileNumber" type="text" class="form-control" placeholder="请输入手机号">
                    </div>
                </div>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div id="checkPanel"></div>
                </div>
            </div>
            <div class="form-group item">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input id="registerBtn" type="button" class="btn btn-success btn-lg btn-block" value="注册">
                </div>
            </div>
        </form>

    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    验证手机
                </h4>
            </div>
            <div class="modal-body">
                <div class="item">
                    <label>&nbsp;&nbsp;&nbsp;手机号:</label>
                    <span id="modal_mobileNumber">15211054977</span>
                </div>
                <div class="item">
                    <span style="color:red;">*</span>
                    <label>&nbsp;校验码:</label>
                    <input type="text" style="width: 165px;height:34px;" placeholder="请输入验证码">
                    <button id="btnSendCode" class="btn btn-default"
                            style="margin-bottom: 4px">
                        获取验证码
                    </button>
                </div>
                <div class="item" style="padding-top: 5px">
                    <span style="color: #2aff42;font-size: 13px;padding-left: 64px;">请输入您的手机收到的验证码</span>
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                </input>
                <input id="checkCodeBtn" type="button" class="btn btn-primary" value="提交"></input>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%@include file="bottom.jsp" %>
</body>
</html>
<script src="js/register.js" type="text/javascript" charset="UTF-8"></script>
<script>
    $("#checkCodeBtn").on('click', function () {
//        TODO:注册提交
        alert("提交")
        $("#registerForm").submit()
    })

</script>
<script type="text/javascript" src="js/head.js"></script>


