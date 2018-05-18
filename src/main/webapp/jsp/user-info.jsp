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

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<style>
    .navbar-brand img {
        display: inline-block;
    }

    .modal input {
        width: 200px;
    }

</style>
<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <!--头像-->
            <div style="width: 150px;height: 150px;border: solid 1px beige">
                <img id="finalImg" alt="请上传头像" src="${userInfo.imgUrl}" style="width: 150px;height: 150px">
            </div>
        </div>
        <div class="col-md-10">
            <div class="userinfo-head">
                <!--昵称-->
                <h1>少侠我姓朱</h1>
            </div>
            <div class="userinfo-edit-fileds">
                <div class="userinfo-edit-item">
                    <span class="col-md-2">姓名</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <!--姓名-->
                        <span>${userInfo.name}</span>
                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">性别</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <c:if test="${userInfo.sex==1}">
                            <span>男</span>
                        </c:if>
                        <c:if test="${userInfo.sex==2}">
                            <span>女</span>
                        </c:if>
                    </div>
                </div>

                <div class="userinfo-edit-item">
                    <!--邮箱-->
                    <span class="col-md-2">邮箱</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span>${userInfo.email}</span>
                    </div>
                </div>

                <div class="userinfo-edit-item">
                    <span class="col-md-2">主队</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span><img src="${userInfo.club.imgUrl}" style="margin-bottom: 3px">&nbsp;${userInfo.club.name}</span>
                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">简介</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span>${userInfo.profile}</span>
                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">注册时间</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <p style="font-size: 18px;color: #ff3b59;">${userInfo.createTime}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
