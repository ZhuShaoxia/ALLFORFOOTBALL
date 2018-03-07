<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/1/13
  Time: 15:43
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>

<%@include file="head2.jsp" %>
<!--主体-->
<div class="container">
    <div class="row">
        <!--轮播图-->
        <div class="col-md-8 " style="padding-right: 0px;">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/1.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="img/1.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="img/1.jpg" alt="Third slide">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>

        </div>
        <!--当日球队比赛信息-->
        <div class="col-md-4 match-list">
            <!--比赛1-->
            <div class="row match-info match-info-1-bottom-border">
                <a href="#">
                    <div class="col-md-4 match-info-item">
                        <img src="img/club/spanish/fcb_club.png" class="img-fluid"/>
                        <p>巴塞罗那</p>
                    </div>
                    <div class="col-md-4 match-info-time">
                        <h2>西甲</h2>
                        <h1>--</h1>
                    </div>
                    <div class="col-md-4 match-info-item">
                        <img src="img/club/spanish/laiwante-club.png" class="img-fluid"/>
                        <p>莱万特</p>
                    </div>
                </a>
            </div>
            <!--比赛2-->
            <div class="row match-info">
                <a href="#">
                    <div class="col-md-4 match-info-item">
                        <img src="img/club/spanish/fcb_club.png"/>
                        <p>巴塞罗那</p>
                    </div>
                    <div class="col-md-4 match-info-time">
                        <h2>西甲</h2>
                        <h1>--</h1>
                    </div>
                    <div class="col-md-4 match-info-item">
                        <img src="img/club/spanish/laiwante-club.png"/>
                        <p>莱万特</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top: 30px;margin-left: 0px">
        <!--文章-->
        <div class="col-md-8">
            <!--文章种类-->
            <div class="row">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#">头条</a>
                    </li>
                    <li>
                        <a href="#">转会</a>
                    </li>
                    <li>
                        <a href="#">闲情</a>
                    </li>
                    <li>
                        <a href="#">中超</a>
                    </li>
                    <li>
                        <a href="#">英超</a>
                    </li>
                    <li>
                        <a href="#">西甲</a>
                    </li>
                    <li>
                        <a href="#">意甲</a>
                    </li>
                    <li>
                        <a href="#">德甲</a>
                    </li>
                </ul>
            </div>
            <!--文章列表-->
            <div class="row article-list" style="margin-left: 0px">
                <!--文章1-->
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
                <!--文章2-->
                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="#">
                            <div class="row article-title">
                                <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="#" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>
                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="#">
                            <div class="row article-title">
                                <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="#" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>
                <div class="row article-item">
                    <div class="col-md-3 article-img ">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="#">
                            <div class="row article-title">
                                <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="#" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>
                <div class="row article-item">
                    <div class="col-md-3 article-img">
                        <img src="img/1.jpg" class="img-rounded"/>
                    </div>
                    <div class="col-md-9">
                        <a href="#">
                            <div class="row article-title">
                                <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                <p class="text-muted">转会费1.2亿加4000万浮动</p>
                            </div>
                        </a>
                        <div class="row  article-time">
                            <small>2018年01月06日23:25:46</small>
                            <a href="#" style="float: right;"><img src="img/article-comment.png"></a>
                        </div>
                    </div>
                </div>
            </div>
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
        <!--各球队积分-->
        <div class="col-md-4" style="border-color: green;">
            <div class="col-12 title">
                <span>积分榜</span>
                <p class="text-right">
                    <a href="#">更多</a>
                </p>
            </div>
            <div class="col-12">
                <div>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#">中超</a>
                        </li>
                        <li>
                            <a href="#">英超</a>
                        </li>
                        <li>
                            <a href="#">西甲</a>
                        </li>
                        <li>
                            <a href="#">意甲</a>
                        </li>
                        <li>
                            <a href="#">德甲</a>
                        </li>
                    </ul>
                </div>
                <div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>排名</th>
                            <th>球队</th>
                            <th>胜/平/负</th>
                            <th>积分</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>1</th>
                            <th>巴塞罗那</th>
                            <th>1/1/1</th>
                            <th>36</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <th>巴塞罗那</th>
                            <th>1/1/1</th>
                            <th>36</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <th>巴塞罗那</th>
                            <th>1/1/1</th>
                            <th>36</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <th>巴塞罗那</th>
                            <th>1/1/1</th>
                            <th>36</th>
                        </tr>
                        <tr>
                            <th>1</th>
                            <th>巴塞罗那</th>
                            <th>1/1/1</th>
                            <th>36</th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="js/head.js"></script>


