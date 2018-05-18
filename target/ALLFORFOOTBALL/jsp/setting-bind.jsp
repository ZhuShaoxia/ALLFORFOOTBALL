<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ImgCropping.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/setting-bind.css">

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/cropper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js" type="text/javascript"
            charset="utf-8"></script>

    <%--select2插件CDN--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <%--表单验证--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <%--校验码--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sendCheckCode.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row" style="margin-bottom: 30px">
        <ul class="nav nav-tabs nav-justified" style="background-color:rgb(220,220,220)">
            <li><a href="/user/setting/info">基本资料</a></li>
            <li class="active"><a href="/user/setting/bind">账号绑定</a></li>
            <li><a href="/user/setting/modifyPwd">密码修改</a></li>
        </ul>
    </div>

    <input type="hidden" id="userId" value="${user.id}">
    <div class="row">
        <div class="setting-bind">
            <p>绑定邮箱和手机,账号更安全。</p>
            <div class="item">
                <span class="name">邮箱</span>
                <c:if test="${user.email==null}">
                    <a class="changeBtn" id="bindEmailBtn" onclick="bindAccount('email')">绑定邮箱</a>
                </c:if>
                <c:if test="${user.email!=null}">
                    <span class="content">${user.email}</span>
                    <a class="changeBtn" onclick="bindAccount('email')">修改</a>
                </c:if>
            </div>
            <div class="item">
                <div>
                    <span class="name">手机</span>
                    <span class="content">${user.phone}</span>
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
                            style="margin-bottom: 4px">
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
                <input id="checkCodeBtn2" type="button" class="btn btn-primary" value="提交"/>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
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

    //    获取验证码
    //        function getCheckCode() {
    //            var dealTypeStr = $("#bindInput").attr("placeholder").substring(3, 4)
    //            if (dealTypeStr == null | dealTypeStr == "") {
    //                return
    //            }
    //            var account = $("#bindInput").val()
    //            var dealType = ''
    //            if (dealTypeStr == '手') {
    //                dealType = 'phone'
    //            } else if (dealTypeStr == '邮') {
    //                dealType = 'email'
    //            } else {
    //                return
    //            }
    //            sendMessage(account, dealType)
    //        }


    $(function () {

        $("#bindModal").on('hide.bs.modal', function () {
            removeSth("获取验证码")
        })

        var SMSCode = ""

        $("#btnSendCode").on('click', function () {
            var account = $("#bindInput").val()
            var dealType = getDealType()
            if (dealType == 'phone') {
                if (account == '') {
                    alert('输入不能为空 请输入')
                    return
                } else if (account == '${user.phone}') {
                    alert('请输入非当前手机号')
                    return
                } else {
                    var code = ''
                    $.ajax({
                        data: {phone: account},
                        url: '/user/verify/phone',
                        async: false,
                        success: function (res) {
                            code = res.code
                        }
                    })
                    if (code == '-1') {
                        alert('当前手机号已存在')
                        return
                    }
                }
            } else if (dealType == 'email') {
                if (account == "") {
                    alert('输入不能为空 请输入')
                    return
                } else if (account == '${user.phone}') {
                    alert('请输入非当前邮箱账号')
                    return
                } else {
                    var code = ''
                    $.ajax({
                        data: {email: account},
                        url: '/user/verify/email',
                        async: false,
                        success: function (res) {
                            code = res.code
                        }
                    })
                    if (code == '-1') {
                        alert('当前邮箱账号已存在')
                        return
                    }
                }
            } else {
                return
            }
            SMSCode = sendMessage(account, dealType)
        })

        $("#checkCodeBtn2").on('click', function () {
            var account = $("#bindInput").val()
            var dealType = getDealType()
            if (dealType == 'phone') {
                if (account == "") {
                    alert('输入不能为空 请输入')
                    return
                } else if (account == '${user.phone}') {
                    alert('请输入非当前手机号')
                    return
                }
                var textCode = $("#bindCode").val()
                if (textCode == "" || textCode == null || textCode.length != 6) {
                    alert('请输入六位短信验证码')
                    return
                } else if (SMSCode == textCode) {
                    var userId = $("#userId").val()
                    $.ajax({
                        data: {
                            id: userId,
                            phone: account
                        },
                        url: '/user/changePhone',
                        success: function (res) {
                            alert('修改成功')
                            location.href = "/user/setting/bind"
                        }
                    })
                }
            } else if (dealType == 'email') {
                if (account == "") {
                    alert('输入不能为空 请输入')
                    return
                } else if (account == '${user.email}') {
                    alert('请输入非当前邮箱')
                    return
                }
                var textCode = $("#bindCode").val()
                if (textCode == "" || textCode == null || textCode.length != 6) {
                    alert('请输入六位邮箱验证码')
                    return
                } else if (SMSCode == textCode) {
                    var userId = $("#userId").val()
                    $.ajax({
                        data: {
                            id: userId,
                            email: account
                        },
                        url: '/user/changeEmail',
                        success: function (res) {
                            if(res.code!='-1'){
                                alert('修改成功')
                                location.href = "/user/setting/bind"
                            }else {
                                alert('后台服务正忙。。。')
                            }
                        }
                    })
                }
            }
        })

    })

    function getDealType() {
        var dealTypeStr = $("#bindInput").attr("placeholder").substring(3, 4)
        if (dealTypeStr == null | dealTypeStr == "") {
            return
        }
        var dealType
        if (dealTypeStr == '手') {
            dealType = 'phone'
        } else if (dealTypeStr == '邮') {
            dealType = 'email'
        }
        return dealType;
    }
</script>
