<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 16:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/article.css"/>
    <!--<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>-->
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/article-comment.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<!--导航栏-->
<%@include file="head.jsp" %>

<!--文章-->
<div class="container">
    <!--<ol class="breadcrumb">-->
    <!--<li><a href="#">首页</a></li>-->
    <!--<li class="active">文章</li>-->
    <!--</ol>-->
    <div class="page-header">
        <h1>U23国足vs乌兹别克U23：韦世豪首发，张玉宁替补</h1>
        <strong>Author:朱晓磊</strong>
        <small style="margin-left: 40px;">2018年01月12日14:59:09</small>
        <div style="display: inline-block;float: right;">
            <span class="label label-default">国足U23</span>
            <span class="label label-primary">乌兹别克U23</span>
            <span class="label label-success">韦世豪</span>
            <span class="label label-info">张玉宁</span>
            <span class="label label-warning">警告标签</span>
            <span class="label label-danger">危险标签</span>
        </div>
    </div>
    <div class="page-content" id="page-content">
        新闻内容
    </div>
</div>
<!--评论部分-->
<div class="container page-comment">
    <div class="comment-null">当前评论内容为空，快来评论区发表你的看法~</div>
    <div class="page-comment-list" id="page-comment-list">
        <!--第一个评论-->
        <!--<div class="row page-comment-item" id="comments[0]">-->
        <!--<div class="col-md-1 head-img" style="text-align: center;">-->
        <!--<img id="comments[0].headImg" src="img/club/spanish/fcb_club.png" class="img-fluid"/>-->
        <!--<p>1楼</p>-->
        <!--</div>-->
        <!--<div class="col-md-9">-->
        <!--<h5>-->
        <!--<a id="comments[0].username" href="#个人信息">朱晓磊</a>-->
        <!--</h5>-->
        <!--<div class="comment">-->
        <!--<p id="comments[0].comment">(c) Copyright 2018 朱晓磊. All Rights Reserved. </p>-->
        <!--<p>(c) Copyright 2018 朱晓磊. All Rights Reserved. </p>-->
        <!--<p>(c) Copyright 2018 朱晓磊. All Rights Reserved. </p>-->
        <!--</div>-->
        <!--<h5 style="border-top: 1px dashed grey;padding: 5px;">-->
        <!--<img class="comment-time-img" src="img/time-logo.png" class="img-fluid"/><span class="comment-time">2018年01月12日16:17:26</span>-->
        <!--<span class="comment-reply" onclick="replay(0)">回复</span>-->
        <!--</h5>-->
        <!--</div>-->
        <!--</div>-->


        <!--第2个评论-->
        <!--<div class="row page-comment-item" id="comments[1]">-->
        <!--<div class="col-md-1 head-img" style="text-align: center;">-->
        <!--<img id="comments[1].headImg" src="img/club/spanish/fcb_club.png" class="img-fluid"/>-->
        <!--<p>1楼</p>-->
        <!--</div>-->
        <!--<div class="col-md-9">-->
        <!--<blockquote>-->
        <!--<span>回复<span class="reply-floor">1</span>楼:@<a href="">朱晓磊</a></span>-->
        <!--<p>(c) Copyright 2018 朱晓磊. All Rights Reserved. </p>-->
        <!--</blockquote>-->
        <!--<h5>-->
        <!--<a id="comments[1].username" href="#个人信息">朱晓磊</a>-->
        <!--</h5>-->
        <!--<div class="comment">-->
        <!--<p id="comments[1].comment">(c) Copyright 2018 朱晓磊. All Rights Reserved.-->
        <!--(c) Copyright 2018 朱晓磊. All Rights Reserved.-->
        <!--(c) Copyright 2018 朱晓磊. All Rights Reserved. </p>-->
        <!--</div>-->
        <!--<h5 style="border-top: 1px dashed grey;padding: 5px;">-->
        <!--<img class="comment-time-img" src="img/time-logo.png" class="img-fluid"/><span class="comment-time">2018年01月12日16:17:26</span>-->
        <!--<span class="comment-reply" onclick="replay(1)">回复</span>-->
        <!--</h5>-->
        <!--</div>-->
        <!--</div>-->
    </div>

    <!--评论内容输入区-->
    <div class="page-comment-input">
        <div class="container">
            <p onclick="">加载更多评论</p>
        </div>
        <div class="container reply" style="width: 30%;float: left;display: none">
            <button type="button" class="btn close" data-toggle="popover" data-trigger="hover" data-content="取消回复"
                    data-placement="right"
                    onclick="closeReply()">&times;
            </button>
            <span>回复<span class="reply-floor" id="reply-floor"></span>楼:@<a href="" class="reply-username"
                                                                            id="reply-username"></a></span>
        </div>
        <textarea name="page-comment-content" id="comment-textarea" placeholder="写下你的评论..."></textarea>
        <button class="btn btn-danger pull-right" onclick="commentBtn()">评论</button>
    </div>
</div>
<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>
<script>
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
