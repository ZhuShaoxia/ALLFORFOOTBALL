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
    <link rel="stylesheet" type="text/css" href="css/user-article.css"/>

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="js/user-article.js" type="text/javascript" charset="utf-8"></script>

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
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li><a href="user-center.jsp">个人信息</a></li>
                <li><a href="user-comment.jsp">评论</a></li>
                <li class="active"><a href="user-article.jsp">我发表的文章</a></li>
                <li><a href="setting-profile.jsp">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row article-head">
                <button class="btn btn-success" onclick="newArticle()">新增文章</button>
                <select name="article-type" id="article-type">
                    <option value="0">全部</option>
                    <option value="1">头条</option>
                    <option value="2">转会</option>
                    <option value="3">中超</option>
                    <option value="4">西甲</option>
                    <option value="5">英超</option>
                </select>
                <input type="text" placeholder="查找文章">
                <a href="#"><img src="img/search-icon.png"></a>
            </div>
            <div class="row article-body">
                <div class="row item">
                    <div class="col-md-10">
                        <strong>
                            <a href="#" class="title">每体：库鸟转会三
                            每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动
                            每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动方达成初步协议，转会费1.2亿加4000万浮动
                            </a>
                        </strong>
                        <div class="item-bottom">
                            <strong>中超</strong>
                            <span>2018年03月18日13:48:56</span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <span class="close" onclick="deleteArticle()">X</span>
                        <div class="count">
                            <span>123</span>
                            <p>评论数</p>
                        </div>
                    </div>
                </div>

                <div class="row item">
                    <div class="col-md-10">
                        <strong>
                            <a href="#" class="title">每体：库鸟转会三
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动方达成初步协议，转会费1.2亿加4000万浮动
                            </a>
                        </strong>
                        <div class="item-bottom">
                            <strong>中超</strong>
                            <span>2018年03月18日13:48:56</span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <span class="close">X</span>
                        <div class="count">
                            <span>123</span>
                            <p>评论数</p>
                        </div>
                    </div>
                </div>

                <div class="row item">
                    <div class="col-md-10">
                        <strong>
                            <a href="#" class="title">每体：库鸟转会三
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动方达成初步协议，转会费1.2亿加4000万浮动
                            </a>
                        </strong>
                        <div class="item-bottom">
                            <strong>中超</strong>
                            <span>2018年03月18日13:48:56</span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <span class="close">X</span>
                        <div class="count">
                            <span>123</span>
                            <p>评论数</p>
                        </div>
                    </div>
                </div>

                <div class="row item">
                    <div class="col-md-10">
                        <strong>
                            <a href="#" class="title">每体：库鸟转会三
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动
                                每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动方达成初步协议，转会费1.2亿加4000万浮动
                            </a>
                        </strong>
                        <div class="item-bottom">
                            <strong>中超</strong>
                            <span>2018年03月18日13:48:56</span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <span class="close">X</span>
                        <div class="count">
                            <span>123</span>
                            <p>评论数</p>
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

<script type="text/javascript" src="js/head.js"></script>
