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
    <%--校验码--%>
    <script type="text/javascript" src="js/sendCheckCode.js"></script>

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
            <p>绑定邮箱和手机。账号更安全。</p>
            <div class="item">
                <span class="name">邮箱</span>
                <a class="changeBtn" id="bindEmailBtn" onclick="bindAccount('email')">绑定邮箱</a>
            </div>
            <div class="item">
                <div>
                    <span class="name">手机</span>
                    <span class="content">152****4977</span>
                    <a class="changeBtn" id="bindMobilBtn" onclick="bindAccount('phone')">修改</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%--&lt;%&ndash;邮箱绑定模态框&ndash;%&gt;--%>
<%--<div class="modal fade" id="bindEmailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel"--%>
<%--aria-hidden="true">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
<%--<h4 class="modal-title" id="emailModalLabel">绑定邮箱。账号更安全</h4>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<form role="form" id="emailForm" class="form-horizontal">--%>
<%--<div class="form-group">--%>
<%--<label for="email" class="col-sm-3 control-label">邮箱</label>--%>
<%--<div class="col-sm-6">--%>
<%--<input type="email" class="form-control" id="email" name="" placeholder="请输入邮箱">--%>
<%--</div>--%>
<%--</div>--%>
<%--</form>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
<%--<button type="button" class="btn btn-primary">确定</button>--%>
<%--</div>--%>
<%--</div><!-- /.modal-content -->--%>
<%--</div><!-- /.modal -->--%>
<%--</div>--%>

<!-- 验证框模态框（Modal） -->
<div class="modal fade" id="bindModal" tabindex="-1" role="dialog" aria-labelledby="bindModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="bindModalLabel">
                    绑定更安全
                </h4>
            </div>
            <div class="modal-body">
                <div class="item">
                    <span style="color:red;">*</span>
                    <label id="bindLabel" style="width: 50px;height: 20px;text-align: left">&nbsp;</label>
                    <input id="bindInput" type="text" style="width: 165px;height:34px;" placeholder="请输入手机号">
                </div>
                <div class="item">
                    <span style="color:red;">*</span>
                    <label>校验码:</label>
                    <input id="bindCode" type="text" style="width: 165px;height:34px;" placeholder="请输入验证码">
                    <button id="btnSendCode" class="btn btn-default"
                            style="margin-bottom: 4px" onclick="getCheckCode()">
                        获取验证码
                    </button>
                </div>
                <div class="item" style="padding-top: 5px">
                    <span style="color: #2aff42;font-size: 13px;padding-left: 64px;">请输入您收到的验证码</span>
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
<script type="text/javascript" src="js/head.js"></script>
<script>
    function bindAccount(dealType) {
        $('#bindModal').modal('show')
        if (dealType == 'phone') {
            $("#bindLabel").text(" 手机号:")
            $("#bindInput").attr("placeholder", "请输入手机号")
        } else if (dealType == 'email') {
            $("#bindLabel").text(" 邮箱:")
            $("#bindInput").attr("placeholder", "请输入邮箱账号")
        } else {
            return
        }
    }

    //获取验证码
    function getCheckCode() {
        var dealTypeStr = $("#bindInput").attr("placeholder").substring(3, 4)
        if (dealTypeStr == null | dealTypeStr == "") {
            return
        }
        var account = $("#bindInput").val()
        var dealType = ''
        if (dealTypeStr == '手') {
            dealType = 'phone'
        } else if (dealTypeStr == '邮') {
            dealType = 'email'
        } else {
            return
        }
        sendMessage(account, dealType)
    }

    $("#bindModal").on('hide.bs.modal', function () {
        removeSth("获取验证码")
    })
</script>
