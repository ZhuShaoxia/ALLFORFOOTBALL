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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
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

    /*侧边导航栏颜色*/
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
        background-color: #8bfdff;
    }

</style>
<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li class="active"><a href="${pageContext.request.contextPath}/user/center">个人信息</a></li>
                <c:if test="${user.role==2}">
                    <li><a href="${pageContext.request.contextPath}/user/article">我发表的文章</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/user/comment">评论</a></li>
                <li><a href="${pageContext.request.contextPath}/user/setting/info">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="col-md-10">
                <div class="userinfo-head" style="padding-left: 30px">
                    <img src="${user.imgUrl}" alt="" style="width: 50px;height: 50px;margin-bottom: 13px">
                    <!--昵称-->
                    <h1 style="display: inline-block">${user.nickname}</h1>
                </div>
                <div class="userinfo-edit-fileds">
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">姓名</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <!--姓名-->
                            <span>${user.name}</span>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">性别</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <c:if test="${user.sex==1}">
                                <span>男</span>
                            </c:if>
                            <c:if test="${user.sex==2}">
                                <span>女</span>
                            </c:if>
                        </div>
                    </div>

                    <div class="userinfo-edit-item">
                        <!--邮箱-->
                        <span class="col-md-2">邮箱</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>${user.email}</span>
                        </div>
                    </div>

                    <div class="userinfo-edit-item">
                        <span class="col-md-2">主队</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <c:if test="${user.club.name!=null}">
                                <span><img src="${user.club.imgUrl}" style="margin-bottom: 3px">&nbsp;${user.club.name}</span>
                            </c:if>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">简介</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>${user.profile}</span>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2" style="font-size: 15px">注册时间</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <p style="font-size: 18px;color: #ff3b59;">${user.createTime}</p>
                        </div>
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
