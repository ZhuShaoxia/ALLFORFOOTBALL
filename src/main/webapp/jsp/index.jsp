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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <%--倒计时--%>
    <script src="${pageContext.request.contextPath}/js/countDown.js" type="text/javascript" charset="utf-8"></script>
    <%--时间格式化--%>
    <script src="${pageContext.request.contextPath}/js/dateFormat.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript" charset="utf-8"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<script type="text/javascript">

</script>
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
                        <img src="${pageContext.request.contextPath}/img/1.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/img/1.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/img/1.jpg" alt="Third slide">
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
                        <img src="${pageContext.request.contextPath}/img/club/spanish/fcb_club.png" class="img-fluid"/>
                        <p>巴塞罗那</p>
                    </div>
                    <div class="col-md-4 match-info-time">
                        <h2>西甲</h2>
                        <span>
                            <div class="count_down">
                                <span class="day_num"></span>
                                <span class="hour_num"></span>
                                <span class="min_num"></span>
                                <span class="sec_num"></span>
                            </div>
                            <div class="game-time" style="display: none;padding: 10px">
                                <span class="game-start">123</span>
                            </div>
                        </span>
                    </div>
                    <div class="col-md-4 match-info-item">
                        <img src="${pageContext.request.contextPath}/img/club/spanish/laiwante-club.png" class="img-fluid"/>
                        <p>莱万特</p>
                    </div>
                </a>
            </div>
            <!--比赛2-->
            <div class="row match-info">
                <a href="#" onclick="pauseGame()">
                    <div class="col-md-4 match-info-item">
                        <img src="${pageContext.request.contextPath}/img/club/spanish/fcb_club.png"/>
                        <p>巴塞罗那</p>
                    </div>
                    <div class="col-md-4 match-info-time">
                        <h2>西甲</h2>
                        <h1>--</h1>
                    </div>
                    <div class="col-md-4 match-info-item">
                        <img src="${pageContext.request.contextPath}/img/club/spanish/laiwante-club.png"/>
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
                        <a href="#type1" data-toggle="tab">头条</a>
                    </li>
                    <li>
                        <a href="#type2" data-toggle="tab">转会</a>
                    </li>
                    <li>
                        <a href="#type3" data-toggle="tab">闲情</a>
                    </li>
                    <li>
                        <a href="#type4" data-toggle="tab">中超</a>
                    </li>
                    <li>
                        <a href="#type5" data-toggle="tab">英超</a>
                    </li>
                    <li>
                        <a href="#type6" data-toggle="tab">西甲</a>
                    </li>
                    <li>
                        <a href="#type7" data-toggle="tab">意甲</a>
                    </li>
                    <li>
                        <a href="#type8" data-toggle="tab">德甲</a>
                    </li>
                </ul>
            </div>
            <!--文章列表-->
            <div class="tab-content row article-list ">
                <div id="type1" class="tab-pane fade in active ">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                    <!--文章2-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="#" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="#" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                    <div class="row article-item">
                        <div class="col-md-3 article-img ">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="#" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="#" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type2" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                    <!--文章2-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="#" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type3" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type4" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type5" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type6" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type7" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type8" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="article.jsp">
                                <div class="row article-title">
                                    <strong>每体：库鸟转会三方达成初步协议，转会费1.2亿加4000万浮动</strong>
                                    <p class="text-muted">转会费1.2亿加4000万浮动</p>
                                </div>
                            </a>
                            <div class="row  article-time">
                                <small>2018年01月06日23:25:46</small>
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--各球队积分-->
        <div class="col-md-4" style="border-color: green;">
            <div class="col-12 title">
                <span>积分榜</span>
                <p class="text-right">
                    <a href="data.jsp">更多</a>
                </p>
            </div>
            <div class="col-12">
                <div>
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#score-zc" data-toggle="tab">中超</a>
                        </li>
                        <li>
                            <a href="#score-yc" data-toggle="tab">英超</a>
                        </li>
                        <li>
                            <a href="#score-xj" data-toggle="tab">西甲</a>
                        </li>
                        <li>
                            <a href="#score-yj" data-toggle="tab">意甲</a>
                        </li>
                        <li>
                            <a href="#score-dj" data-toggle="tab">德甲</a>
                        </li>
                    </ul>
                </div>
                <div>

                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="score-zc">
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
                                <tr class="active">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="success">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="warning">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="score-yc">
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
                                <tr class="active">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="success">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="warning">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="score-xj">
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

                                <tr class="active">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="success">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="warning">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="score-yj">
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
                                <tr class="active">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="success">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="warning">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="score-dj">
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
                                <tr class="active">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="success">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="warning">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                <tr class="">
                                    <td>1</td>
                                    <td><a href="club.jsp"><img class="td-icon-img"
                                                                src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                                    </td>
                                    <td>2/2/2</td>
                                    <td>6</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>


