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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-comment.css"/>


    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/user-comment.js" type="text/javascript" charset="utf-8"></script>

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
<script>
    $(function () {
        $("#comment-delete-btn").on('click', function () {
            console.log("2132")
            confirm("确定要删除该评论嘛")
        })
    })
</script>

<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid white">
                <li><a href="${pageContext.request.contextPath}/user/center">个人信息</a></li>
                <c:if test="${user.role==2}">
                    <li><a href="${pageContext.request.contextPath}/user/article">我发表的文章</a></li>
                </c:if>
                <li class="active"><a href="${pageContext.request.contextPath}/user/comment">评论</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/setting/info">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row comment-head">
                <select name="comment-type" id="comment-type">
                    <option value="1">发表的评论</option>
                    <option value="2">收到的评论</option>
                </select>
                <%--<span>发表的评论</span>--%>
                <input id="comment-search-condition" type="text" placeholder="查找评论内容或评论人">
                <a href="#" id="comment-search-btn"><img
                        src="${pageContext.request.contextPath}/img/search-icon.png"></a>
            </div>
            <div id="commentBody" class="row comment-body">
                <%--收到的评论 别人回复的评论--%>
                <%--<div class="container comment-item">--%>
                <%--<div class="row">--%>
                <%--<div class="col-md-1 comment-item-left">--%>
                <%--<img src="" alt="请上传头像">--%>
                <%--</div>--%>
                <%--<div class="col-md-11 comment-item-right">--%>
                <%--<div class="comment-item-right-user">--%>
                <%--<strong id="comment-reply-user">少侠我姓朱</strong>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-time">--%>
                <%--<span>2018年03月17日13:15:56</span>--%>
                <%--<span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-comment">--%>
                <%--<span>回复@<a href="">朱晓磊</a>:</span>--%>
                <%--<p>content</p>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-article">--%>
                <%--<a href="#">--%>
                <%--<span class="theme">回复我的评论:</span>--%>
                <%--<span class="content">XXXXXXXXX</span>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="comment-item-bottom row ">--%>
                <%--<button id="reply-btn" type="button" class="btn btn-danger btn-block" data-toggle="collapse" data-target="#demo">回复这个回复你的人</button>--%>
                <%--</div>--%>
                <%--<div id="demo" class="collapse out row comment-item-bottom-reply">--%>
                <%--<div class="col-md-1 comment-item-bottom-reply-left">--%>
                <%--<img src="" alt="">--%>
                <%--</div>--%>
                <%--<div class="col-md-11 comment-item-bottom-reply-right">--%>
                <%--<input data-content="评论内容不能为空，请输入评论" id="reply-content-input" type="text" placeholder="回复@少侠我姓朱:">--%>
                <%--<button id="reply-content-btn" class="btn btn-danger">评论</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--发表的评论_1 评论--%>
                <c:forEach items="${userComments}" var="userComment">
                    <div class="comment-item">
                        <div class="col-md-1 comment-item-left">
                            <img src="${userComment.user.imgUrl}" alt="请上传头像">
                        </div>
                        <div class="col-md-11 comment-item-right">
                            <div class="comment-item-right-user">
                                <strong>${userComment.user.nickname}</strong>
                                    <%--<span id="comment-delete-btn" class="close">X</span>--%>
                            </div>
                            <div class="comment-item-right-time">
                                <span>${userComment.createTime}</span>
                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>
                            </div>
                            <div class="comment-item-right-comment">
                                    <%--限制内容长度--%>
                                <p>${userComment.content}</p>
                            </div>
                            <div class="comment-item-right-article">
                                <a href="#">
                                    <span class="theme">评论@${userComment.article.user.nickname}的文章:</span>
                                    <span class="content"><a
                                            href="/article/info/${userComment.article.id}">${userComment.article.title}</a></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>


                <%--&lt;%&ndash;发表的评论_2 回复评论的评论&ndash;%&gt;--%>
                <%--<div class="comment-item">--%>
                <%--<div class="col-md-1 comment-item-left">--%>
                <%--<img src="img/head-img-icon.png" alt="请上传头像">--%>
                <%--</div>--%>
                <%--<div class="col-md-11 comment-item-right">--%>
                <%--<div class="comment-item-right-user">--%>
                <%--<strong>少侠我姓朱</strong>--%>
                <%--<span id="comment-delete-btn" class="close">X</span>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-time">--%>
                <%--<span>2018年03月17日13:15:56</span>--%>
                <%--<span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-comment">--%>
                <%--<p>回复@<a href="">朱晓磊</a>:</p>--%>
                <%--<p></p>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-article">--%>
                <%--<a href="#">--%>
                <%--<span class="theme">回复@<a href="">朱晓磊</a>的评论:</span>--%>
                <%--<span class="content">XXXXXXXXX</span>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

            </div>
        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
