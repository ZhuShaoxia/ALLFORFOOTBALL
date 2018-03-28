<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/16
  Time: 10:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/article-list.css"/>
    <!--<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>-->
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <%--f分页--%>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<!--导航栏-->
<%@include file="head.jsp" %>
<div class="container">
    <div class="row article-list-head">
        <div class="col-md-8 article-list-head-nav">
            <ul class="nav nav-pills nav-justified">
                <li class="active"><a href="#">头条</a></li>
                <li><a href="#">转会</a></li>
                <li><a href="#">闲情</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        中超 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">广州恒大</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">上海上港</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">山东鲁能</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">北京国安</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        西甲 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">巴塞罗那</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">皇家马德里</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">马德里竞技</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        英超 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">曼彻斯特城</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">曼彻斯特联</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">切尔西</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        德甲 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">巴塞罗那</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">皇家马德里</a>
                        </li>
                        <li><a href="#"><img class="article-li-img" src="img/club/spanish/fcb_club.png" alt="">马德里竞技</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
        <div class="col-md-4 article-list-head-search">
            <div class="article-list-head-search-top">
                <input type="date" class="search-date-input">
                <span>--</span>
                <input type="date" class="search-date-input">
            </div>
            <div class="article-list-head-search-bottom">
                <input type="text" class="search-text-input" placeholder="请输入文章内容">
                <button class="btn btn-success">搜索</button>
            </div>
        </div>
    </div>
    <div class="row article-list-body">
        <div class="col-md-8 article-list-body-left">
            <div class="left-article-list">
                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="article.jsp">
                            <div class="row article-title">
                                <strong style="color: #333;">每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>

                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="article.jsp">
                            <div class="row article-title">
                                <strong style="color: #333;">每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>

                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="article.jsp">
                            <div class="row article-title">
                                <strong style="color: #333;">每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>

                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="article.jsp">
                            <div class="row article-title">
                                <strong style="color: #333;">每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-4 article-list-body-right">
            <span class="hot-comment-title">新闻热评</span>
            <div class="hot-comment-list">
                <div class="hot-comment-item">
                    <div class="col-md-3 hot-comment-item-img">
                        <span>1</span>
                        <a href="#用户">
                            <img src="img/head-img-icon.png" alt="">
                        </a>
                    </div>
                    <a href="#文章">
                        <div class="col-md-9 hot-comment-item-content">
                            <span>懂球儿东二球懂球儿东二球...</span>
                        </div>
                    </a>
                </div>
                <div class="hot-comment-item">
                    <div class="col-md-3 hot-comment-item-img">
                        <span>2</span>
                        <a href="#用户">
                            <img src="img/head-img-icon.png" alt="">
                        </a>
                    </div>
                    <a href="#文章">
                        <div class="col-md-9 hot-comment-item-content">
                            <span>懂球儿东二球懂球儿123东二球...</span>
                        </div>
                    </a>
                </div>
                <div class="hot-comment-item">
                    <div class="col-md-3 hot-comment-item-img">
                        <span>3</span>
                        <a href="#用户">
                            <img src="img/head-img-icon.png" alt="">
                        </a>
                    </div>
                    <a href="#文章">
                        <div class="col-md-9 hot-comment-item-content">
                            <span>懂球儿东二球懂球儿东二球...</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $('.M-box').pagination({
                callback: function (api) {
                    $('.now').text(api.getCurrent());
                }
            }, function (api) {
                $('.now').text(api.getCurrent());
            });
        })

    </script>
    <!--分页-->
    <div class="article-pagination">
        <ul class="pagination">
            <li>
                <a href="#">&laquo;</a>
            </li>
            <li>
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#">&raquo;</a>
            </li>
        </ul>
    </div>
</div>


<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>

