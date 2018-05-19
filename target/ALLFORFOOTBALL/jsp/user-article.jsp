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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-article.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/user-article.js" type="text/javascript" charset="utf-8"></script>

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
                <li><a href="${pageContext.request.contextPath}/user/center">个人信息</a></li>
                <c:if test="${user.role==2}">
                    <li class="active"><a href="${pageContext.request.contextPath}/user/article">我发表的文章</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/user/comment">评论</a></li>
                <li><a href="${pageContext.request.contextPath}/user/setting/info">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row article-head">
                <button class="btn btn-success" onclick="newArticle()">新增文章</button>
                <%--<select name="article-type" id="article-type">--%>
                    <%--<option value="0">全部</option>--%>
                    <%--<c:forEach items="${articleTypes}" var="articleType">--%>
                        <%--<option value="${articleType.id}">${articleType.type}</option>--%>
                    <%--</c:forEach>--%>
                <%--</select>--%>
                <%--<input type="text" placeholder="查找文章">--%>
                <%--<a href="#"><img src="${pageContext.request.contextPath}/img/search-icon.png"></a>--%>
            </div>
            <div class="row article-body">
                <c:forEach items="${articles}" var="article">
                    <div class="row item">
                        <div class="col-md-10">
                            <strong>
                                <a href="/article/info/${article.id}" class="title">${article.title}</a>
                            </strong>
                            <div class="item-bottom">
                                <strong>${article.articleType.type}</strong>
                                <span>${article.createTime}</span>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <span class="close" onclick="deleteArticle(${article.id})">X</span>
                            <div class="count">
                                <span>${article.commentList.size()}</span>
                                <p>评论数</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
