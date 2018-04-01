<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 16:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/game-detail.css"/>

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

    .alert-well {
        display: none;
    }

    .modal input {
        width: 200px;
    }

    #activationCode {
        display: inline-block;
        width: 80px;
    }

</style>

<body>
<%@include file="head.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="game-detail-info">
                <div class="col-md-3 col-md-offset-1 game-detail-info-left">
                    <a href="#球队">
                        <img class="img-rounded team-img" src="img/club/spanish/fcb_club.png" alt="">
                        <p class="team-name">巴塞罗那</p>
                    </a>
                </div>
                <div class="col-md-4 game-detail-info-center">
                    <p class="match-time">2018-03-25 19：35 西甲15轮</p>
                    <%--未开始 大的VS--%>
                    <span>VS</span>
                    <p style="margin-bottom: 0px;margin-top: 10px">未开始</p>
                    <%--结束 三行 比赛结果 比赛状态--%>
                </div>
                <div class="col-md-3 game-detail-info-right ">
                    <a href="#球队">
                        <img class="img-rounded team-img" src="img/club/spanish/fcb_club.png" alt="">
                        <p class="team-name">巴塞罗那</p>
                    </a>
                </div>
            </div>
            <div class="game-detail-tabs">
                <ul class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#match-result" data-toggle="tab">赛况</a></li>
                    <li><a href="#match-player" data-toggle="tab">阵容</a></li>
                    <li><a href="#match-excellent" data-toggle="tab">集锦</a></li>
                </ul>
            </div>
            <div class="tab-content">
                <%--赛况--%>
                <div id="match-result" class="tab-pane fade in active">
                    <%--<span>暂无比赛信息</span>--%>
                    <%--事件--%>
                    <div class="match-result-item">
                        <%--头--%>
                        <div class="match-item-head">
                            <span>事件</span>
                        </div>
                        <%--比赛双方--%>
                        <div class="match-each">
                            <table class="table table-striped">
                                <tbody>
                                <tr class="active">
                                    <td style="width:45%;text-align: right;font-size: 18px">巴塞罗那<img
                                            class="td-icon-img"
                                            src="img/club/spanish/fcb_club.png"
                                            alt=""></td>
                                    <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                    <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                                src="img/club/spanish/fcb_club.png"
                                                                                                alt="">巴塞罗那
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <%--比赛过程--%>
                        <div class="match-result">
                            <span class="icon-start"></span>
                            <ul class="time-line">
                                <li class="cf">
                                    <span class="num">12</span>
                                    <div class="time-line-left">
                                        <p><img class="match-img" src="img/match-shang.png" alt="">Messi</p>
                                        <p><img class="match-img" src="img/match-xia.png" alt="">保利尼奥</p>
                                    </div>
                                </li>
                                <li class="cf">
                                    <span class="num">12</span>
                                    <div class="time-line-right">
                                        123
                                    </div>
                                </li>
                                <li class="cf">
                                    <span class="num">12</span>
                                    <div class="time-line-left">
                                        123
                                    </div>
                                </li>
                                <li class="cf">
                                    <span class="num">12</span>
                                    <div class="time-line-right">
                                        123
                                    </div>
                                </li>
                            </ul>
                            <span class="icon-end"></span>
                        </div>
                        <div class="match-describe">
                            <span class="match-describe-text"><img src="img/match-result-icon-a.png" alt=""
                                                                   class="match-describe-img">进球</span>
                            <span class="match-describe-text"><img src="img/match-result-icon-b.png" alt=""
                                                                   class="match-describe-img">点球</span>
                            <span class="match-describe-text"><img src="img/match-result-icon-c.png" alt=""
                                                                   class="match-describe-img">点球未进</span>
                            <span class="match-describe-text"><img src="img/match-result-icon-d.png" alt=""
                                                                   class="match-describe-img">乌龙球</span>
                            <span class="match-describe-text"><img src="img/match-result-icon-e.png" alt=""
                                                                   class="match-describe-img">助攻</span>
                        </div>
                    </div>
                    <%--技术统计--%>
                    <div class="match-result-item">
                        <div class="match-item-head">
                            <span>技术统计</span>
                        </div>
                        <div>
                            <table class="table table-striped">
                                <tbody>
                                <tr class="active">
                                    <td style="width:45%;text-align: right;font-size: 18px">巴塞罗那<img
                                            class="td-icon-img"
                                            src="img/club/spanish/fcb_club.png"
                                            alt=""></td>
                                    <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                    <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                                src="img/club/spanish/fcb_club.png"
                                                                                                alt="">巴塞罗那
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="technology-compare">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td style="width: 5%">
                                        <span>80</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: 80%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">控球率</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: 39%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>39</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 5%">
                                        <span>80</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: 80%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">控球率</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: 39%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>39</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 5%">
                                        <span>80</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: 80%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">控球率</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: 39%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>39</span>
                                    </td>
                                </tr>

                                </tbody>
                            </table>

                        </div>
                    </div>
                    <%--相关新闻--%>
                    <div class="match-result-item">
                        <div class="match-item-head">
                            <span>相关新闻</span>
                        </div>
                        <div class="left-article-list" style="margin-left: 15px">
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
                </div>
                <%--阵容--%>
                <div id="match-player" class="tab-pane fade">
                    <%--比赛双方--%>
                    <div>
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <tbody>
                            <tr class="active">
                                <td style="width:45%;text-align: right;font-size: 18px">巴塞罗那<img
                                        class="td-icon-img"
                                        src="img/club/spanish/fcb_club.png"
                                        alt=""></td>
                                <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                            src="img/club/spanish/fcb_club.png"
                                                                                            alt="">巴塞罗那
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--比赛首发--%>
                    <div>
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <thead style="font-size: 15px;background-color: silver">
                            <td style="width: 10%;text-align: center">号码</td>
                            <td style="width: 15%;text-align: center">位置</td>
                            <td style="width: 20%;text-align: right">姓名</td>
                            <td style="width: 10%"></td>
                            <td style="width: 20%">姓名</td>
                            <td style="width: 15%;text-align: center">位置</td>
                            <td style="width: 10%;text-align: center">号码</td>
                            </thead>
                            <tbody>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <%--比赛替补阵容--%>
                    <div>
                        <div class="game-return-player">
                            <span>替补阵容</span>
                        </div>
                        <table class="table table-striped">
                            <thead style="font-size: 15px;background-color: silver">
                            <td style="width: 10%;text-align: center">号码</td>
                            <td style="width: 15%;text-align: center">位置</td>
                            <td style="width: 20%;text-align: right">姓名</td>
                            <td style="width: 10%"></td>
                            <td style="width: 20%">姓名</td>
                            <td style="width: 15%;text-align: center">位置</td>
                            <td style="width: 10%;text-align: center">号码</td>
                            </thead>
                            <tbody>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            <tr>
                                <td style="width: 10%;text-align: center">1</td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 20%;text-align: right">特尔施特根<img class="td-icon-img"
                                                                                   src="img/club/china/p_alan.jpg"
                                                                                   alt=""></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">纳瓦斯
                                </td>
                                <td style="width: 15%;text-align: center">守门员</td>
                                <td style="width: 10%;text-align: center">1</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--集锦--%>
                <div id="match-excellent" class="tab-pane fade">789</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="recent-game-head">
                <span>近期比赛</span>
            </div>
            <div class="recent-game-body">
                <table class="table table-hover" style="text-align: center">
                    <tr>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/china/zc_shanggang.png" alt=""></p>
                                <p>上海上港</p>
                            </a>
                        </td>
                        <td style="padding-top: 25px">
                            <p>中国杯</p>
                            <p>03-25 22:00</p>
                        </td>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/spanish/fcb_club.png" alt=""></p>
                                <p>巴塞罗那</p>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/china/zc_shanggang.png" alt=""></p>
                                <p>上海上港</p>
                            </a>
                        </td>
                        <td style="padding-top: 25px">
                            <p>中国杯</p>
                            <p>03-25 22:00</p>
                        </td>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/spanish/fcb_club.png" alt=""></p>
                                <p>巴塞罗那</p>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/china/zc_shanggang.png" alt=""></p>
                                <p>上海上港</p>
                            </a>
                        </td>
                        <td style="padding-top: 25px">
                            <p>中国杯</p>
                            <p>03-25 22:00</p>
                        </td>
                        <td>
                            <a href="#球队">
                                <p><img class="td-club-img" src="img/club/spanish/fcb_club.png" alt=""></p>
                                <p>巴塞罗那</p>
                            </a>
                        </td>
                    </tr>

                </table>
            </div>
        </div>

    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/data.js"></script>


