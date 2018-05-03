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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/verify.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/verify.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>

    <script src="${pageContext.request.contextPath}/js/sendCheckCode.js" type="text/javascript"
            charset="UTF-8"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo" style="padding-top: 100px">
    <%--step1 填写手机号或注册邮箱--%>
    <div class="row step-1">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" id="step1Form">
                <div class="form-group" style="margin-bottom: 20px">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <h1>找回密码</h1>
                        <h5 style="color: rgb(132,143,170)">验证码将发送至您的邮箱或手机</h5>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input name="step1Account" type="text" class="form-control" placeholder="请输入手机号或邮箱">
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <div id="mpanel1"></div>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <button id="step1Btn" type="button" class="btn btn-info btn-lg btn-block">下一步</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--step2 填写验证码--%>
    <div class="row step-2">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" id="step2Form">
                <div class="form-group" style="margin-bottom: 20px">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <h1>找回密码</h1>
                        <h5 id="step2H5msg" style="color: rgb(132,143,170)">验证码已发送至您的</h5>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input id="step2Account" type="text" class="form-control" value=""
                               disabled>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input id="step2Code" name="step2Code" type="text" style="width: 335px;height:34px;" placeholder="请输入6位验证码">
                        <button id="btnSendCode" class="btn btn-default"
                                style="margin-bottom: 4px">
                            获取验证码
                        </button>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <button id="step2Btn" type="button" class="btn btn-info btn-lg btn-block">下一步</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--step3 重置密码--%>
    <div class="row step-3">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" role="form" id="step3Form">
                <div class="form-group" style="margin-bottom: 20px">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <h1>设置新密码</h1>
                        <h5 style="color: rgb(132,143,170)">新密码设置不应少于8位，且不可与之前设置过的密码重复</h5>
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input id="step3Pwd1" name="step3Pwd1" type="password" class="form-control" placeholder="新密码">
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input id="step3Pwd2" name="step3Pwd2" type="password" class="form-control"
                               placeholder="再次输入新密码">
                    </div>
                </div>
                <div class="form-group item">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <button id="step3Btn" type="button" class="btn btn-info btn-lg btn-block">重置密码</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>

<%@include file="bottom.jsp" %>
</body>
</html>
<script src="${pageContext.request.contextPath}/js/forgetPwd.js" type="text/javascript" charset="UTF-8"></script>


