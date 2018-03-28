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
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

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
<%@include file="head2.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-8" style="padding-right: 0px">
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
                        <div class="carousel-caption"><a href="#文章">标题 3</a></div>
                    </div>
                    <div class="item">
                        <img src="img/1.jpg" alt="Second slide">
                        <div class="carousel-caption"><a href="#文章">标题 3</a></div>
                    </div>
                    <div class="item">
                        <img src="img/1.jpg" alt="Third slide">
                        <div class="carousel-caption"><a href="#文章">标题 3</a></div>
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <div class="col-md-4" style="padding-left: 0px">
            <table class="table table-hover"
                   style="text-align: center;border-bottom: 1px solid #ddd;margin-bottom: 0px">
                <tr>
                    <td style="padding-top: 20px">
                        <a href="#球队">
                            <p><img class="td-index-img" src="img/club/china/zc_shanggang.png" alt=""></p>
                            <p>上海上港</p>
                        </a>
                    </td>
                    <td style="padding-top: 45px">
                        <p>中国杯</p>
                        <p>03-25 22:00</p>
                    </td>
                    <td style="padding-top: 20px">
                        <a href="#球队">
                            <p><img class="td-index-img" src="img/club/spanish/fcb_club.png" alt=""></p>
                            <p>巴塞罗那</p>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 20px">
                        <a href="#球队">
                            <p><img class="td-index-img" src="img/club/china/zc_shanggang.png" alt=""></p>
                            <p>上海上港</p>
                        </a>
                    </td>
                    <td style="padding-top: 45px">
                        <p>中国杯</p>
                        <p>03-25 22:00</p>
                    </td>
                    <td style="padding-top: 20px">
                        <a href="#球队">
                            <p><img class="td-index-img" src="img/club/spanish/fcb_club.png" alt=""></p>
                            <p>巴塞罗那</p>
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row" style="margin-top: 15px">
        <div class="col-md-8">
            <!--文章种类-->
            <div>
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
            <div class="tab-content article-list ">
                <div id="type1" class="tab-pane fade in active ">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                <div id="type2" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                </div>
                <div id="type3" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type4" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type5" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type6" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type7" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="type8" class="tab-pane fade">
                    <!--文章1-->
                    <div class="row article-item">
                        <div class="col-md-3 article-img">
                            <img src="img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="recent-game-head">
                <span>积分榜</span>
                <strong style="display:inline-block;font-size: 18px;float: right;margin-right: 3%;margin-bottom: 10px"><a href="data.jsp">更多</a></strong>
            </div>
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
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
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
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
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
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
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
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
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
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2/2/2</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="club.jsp"><img class="td-icon-img"
                                                        src="img/club/china/zc_shanggang.png">上海上港</a>
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

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="js/head.js"></script>
