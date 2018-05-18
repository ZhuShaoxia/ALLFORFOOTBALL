<%@ page import="com.ccsu.core.article.domain.Article" %>
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

</style>
<body>
<%@include file="head.jsp" %>
<div class="container" style="min-height: 650px">
    <div class="row">
        <div class="col-md-8" style="padding-right: 0px">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <c:forEach items="${articlesIsCarousel}" varStatus="sts">
                        <c:if test="${sts.first}">
                            <li data-target="#myCarousel" data-slide-to="${sts.index}" class="active"></li>
                        </c:if>
                        <c:if test="${!sts.first}">
                            <li data-target="#myCarousel" data-slide-to="${sts.index}"></li>
                        </c:if>
                    </c:forEach>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <c:forEach items="${articlesIsCarousel}" var="article" varStatus="status">
                        <c:if test="${status.first}">
                            <div class="item active">
                                <img src="${article.imgUrl}" alt="${article.title}">
                                <div class="carousel-caption"><a href="/article/info/${article.id}">${article.title}</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${!status.first}">
                            <div class="item">
                                <img src="${article.imgUrl}" alt="${article.title}">
                                <div class="carousel-caption"><a href="/article/info/${article.id}">${article.title}</a>
                                </div>
                            </div>
                        </c:if>

                    </c:forEach>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <div class="col-md-4" style="padding-left: 0px">
            <table class="table table-hover"
                   style="text-align: center;border-bottom: 1px solid #ddd;margin-bottom: 0px">
                <c:forEach items="${currentFocusMatchInfos}" var="focusMatch">
                    <tr>
                        <td style="padding-top: 20px">
                            <a href="/club/info/${focusMatch.homeClub.id}">
                                <p><img class="td-index-img"
                                        src="${focusMatch.homeClub.imgUrl}" alt="${focusMatch.homeClub.name}"></p>
                                <p>${focusMatch.homeClub.name}</p>
                            </a>
                        </td>
                        <td style="padding-top: 45px">
                            <p>${focusMatch.matchType.type}</p>
                            <p>${focusMatch.matchDate}&nbsp;${focusMatch.matchTime}</p>
                        </td>
                        <td style="padding-top: 20px">
                            <a href="/club/info/${focusMatch.awayClub.id}">
                                <p><img class="td-index-img"
                                        src="${focusMatch.awayClub.imgUrl}" alt="${focusMatch.awayClub.name}"></p>
                                <p>${focusMatch.awayClub.name}</p>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
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
                        <a href="#type5" data-toggle="tab">西甲</a>
                    </li>
                    <li>
                        <a href="#type6" data-toggle="tab">英超</a>
                    </li>
                    <li>
                        <a href="#type7" data-toggle="tab">意甲</a>
                    </li>
                    <li>
                        <a href="#type8" data-toggle="tab">德甲</a>
                    </li>
                    <li>
                        <a href="#type9" data-toggle="tab">法甲</a>
                    </li>
                </ul>
            </div>
            <!--文章列表-->
            <div class="tab-content article-list ">
                <div id="type1" class="tab-pane fade in active ">
                    <c:forEach items="${articlesByType1}" var="a1">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a1.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a1.id}">
                                    <div class="row article-title">
                                        <strong>${a1.title}</strong>
                                        <p class="text-muted">${a1.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a1.createTime}</small>
                                    <a href="/article/info/${a1.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type2" class="tab-pane fade">
                    <c:forEach items="${articlesByType2}" var="a2">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a2.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a2.id}">
                                    <div class="row article-title">
                                        <strong>${a2.title}</strong>
                                        <p class="text-muted">${a2.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a2.createTime}</small>
                                    <a href="/article/info/${a2.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type3" class="tab-pane fade">
                    <c:forEach items="${articlesByType3}" var="a3">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a3.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a3.id}">
                                    <div class="row article-title">
                                        <strong>${a3.title}</strong>
                                        <p class="text-muted">${a3.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a3.createTime}</small>
                                    <a href="/article/info/${a3.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type4" class="tab-pane fade">
                    <c:forEach items="${articlesByType4}" var="a4">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a4.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a4.id}">
                                    <div class="row article-title">
                                        <strong>${a4.title}</strong>
                                        <p class="text-muted">${a4.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a4.createTime}</small>
                                    <a href="/article/info/${a4.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type5" class="tab-pane fade">
                    <c:forEach items="${articlesByType5}" var="a5">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a5.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a5.id}">
                                    <div class="row article-title">
                                        <strong>${a5.title}</strong>
                                        <p class="text-muted">${a5.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a5.createTime}</small>
                                    <a href="/article/info/${a5.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type6" class="tab-pane fade">
                    <c:forEach items="${articlesByType6}" var="a6">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a6.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a6.id}">
                                    <div class="row article-title">
                                        <strong>${a6.title}</strong>
                                        <p class="text-muted">${a6.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a6.createTime}</small>
                                    <a href="/article/info/${a6.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type7" class="tab-pane fade">
                    <c:forEach items="${articlesByType7}" var="a7">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a7.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a7.id}">
                                    <div class="row article-title">
                                        <strong>${a7.title}</strong>
                                        <p class="text-muted">${a7.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a7.createTime}</small>
                                    <a href="/article/info/${a7.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type8" class="tab-pane fade">
                    <c:forEach items="${articlesByType8}" var="a8">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a8.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a8.id}">
                                    <div class="row article-title">
                                        <strong>${a8.title}</strong>
                                        <p class="text-muted">${a8.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a8.createTime}</small>
                                    <a href="/article/info/${a8.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="type9" class="tab-pane fade">
                    <c:forEach items="${articlesByType9}" var="a9">
                        <div class="row article-item">
                            <div class="col-md-3 article-img">
                                <img src="${a9.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${a9.id}">
                                    <div class="row article-title">
                                        <strong>${a9.title}</strong>
                                        <p class="text-muted">${a9.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${a9.createTime}</small>
                                    <a href="/article/info/${a9.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>

        </div>
        <div class="col-md-4">
            <div class="recent-game-head">
                <span>积分榜</span>
                <strong style="display:inline-block;font-size: 18px;float: right;margin-right: 3%;margin-bottom: 10px"><a
                        href="/data">更多</a></strong>
            </div>
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
                        <c:forEach items="${zcRanking}" var="zc" varStatus="zcStatus">
                            <c:if test="${zcStatus.first}">
                                <tr class="danger">
                                    <td>${zcStatus.count}</td>
                                    <td><a href="/club/info/${zc.club.id}"><img class="td-icon-img" src="${zc.club.imgUrl}">${zc.club.name}</a></td>
                                    <td>${zc.victory}/${zc.draw}/${zc.negative}</td>
                                    <td>${zc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${zcStatus.count==2}">
                                <tr class="success">
                                    <td>${zcStatus.count}</td>
                                    <td><a href="/club/info/${zc.club.id}"><img class="td-icon-img" src="${zc.club.imgUrl}">${zc.club.name}</a></td>
                                    <td>${zc.victory}/${zc.draw}/${zc.negative}</td>
                                    <td>${zc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${zcStatus.count==3}">
                                <tr class="warning">
                                    <td>${zcStatus.count}</td>
                                    <td><a href="/club/info/${zc.club.id}"><img class="td-icon-img" src="${zc.club.imgUrl}">${zc.club.name}</a></td>
                                    <td>${zc.victory}/${zc.draw}/${zc.negative}</td>
                                    <td>${zc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${zcStatus.count>3}">
                                <tr class="active">
                                    <td>${zcStatus.count}</td>
                                    <td><a href="/club/info/${zc.club.id}"><img class="td-icon-img" src="${zc.club.imgUrl}">${zc.club.name}</a></td>
                                    <td>${zc.victory}/${zc.draw}/${zc.negative}</td>
                                    <td>${zc.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
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
                        <c:forEach items="${ycRanking}" var="yc" varStatus="ycStatus">
                            <c:if test="${ycStatus.first}">
                                <tr class="danger">
                                    <td>${ycStatus.count}</td>
                                    <td><a href="/club/info/${yc.club.id}"><img class="td-icon-img" src="${yc.club.imgUrl}">${yc.club.name}</a></td>
                                    <td>${yc.victory}/${yc.draw}/${yc.negative}</td>
                                    <td>${yc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${ycStatus.count==2}">
                                <tr class="success">
                                    <td>${ycStatus.count}</td>
                                    <td><a href="/club/info/${yc.club.id}"><img class="td-icon-img" src="${yc.club.imgUrl}">${yc.club.name}</a></td>
                                    <td>${yc.victory}/${yc.draw}/${yc.negative}</td>
                                    <td>${yc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${ycStatus.count==3}">
                                <tr class="warning">
                                    <td>${ycStatus.count}</td>
                                    <td><a href="/club/info/${yc.club.id}"><img class="td-icon-img" src="${yc.club.imgUrl}">${yc.club.name}</a></td>
                                    <td>${yc.victory}/${yc.draw}/${yc.negative}</td>
                                    <td>${yc.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${ycStatus.count>3}">
                                <tr class="active">
                                    <td>${ycStatus.count}</td>
                                    <td><a href="/club/info/${yc.club.id}"><img class="td-icon-img" src="${yc.club.imgUrl}">${yc.club.name}</a></td>
                                    <td>${yc.victory}/${yc.draw}/${yc.negative}</td>
                                    <td>${yc.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
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
                        <c:forEach items="${xjRanking}" var="xj" varStatus="xjStatus">
                            <c:if test="${xjStatus.first}">
                                <tr class="danger">
                                    <td>${xjStatus.count}</td>
                                    <td><a href="/club/info/${xj.club.id}"><img class="td-icon-img" src="${xj.club.imgUrl}">${xj.club.name}</a></td>
                                    <td>${xj.victory}/${xj.draw}/${xj.negative}</td>
                                    <td>${xj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${xjStatus.count==2}">
                                <tr class="success">
                                    <td>${xjStatus.count}</td>
                                    <td><a href="/club/info/${xj.club.id}"><img class="td-icon-img" src="${xj.club.imgUrl}">${xj.club.name}</a></td>
                                    <td>${xj.victory}/${xj.draw}/${xj.negative}</td>
                                    <td>${xj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${xjStatus.count==3}">
                                <tr class="warning">
                                    <td>${xjStatus.count}</td>
                                    <td><a href="/club/info/${xj.club.id}"><img class="td-icon-img" src="${xj.club.imgUrl}">${xj.club.name}</a></td>
                                    <td>${xj.victory}/${xj.draw}/${xj.negative}</td>
                                    <td>${xj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${xjStatus.count>3}">
                                <tr class="active">
                                    <td>${xjStatus.count}</td>
                                    <td><a href="/club/info/${xj.club.id}"><img class="td-icon-img" src="${xj.club.imgUrl}">${xj.club.name}</a></td>
                                    <td>${xj.victory}/${xj.draw}/${xj.negative}</td>
                                    <td>${xj.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
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
                        <c:forEach items="${yjRanking}" var="yj" varStatus="yjStatus">
                            <c:if test="${yjStatus.first}">
                                <tr class="danger">
                                    <td>${yjStatus.count}</td>
                                    <td><a href="/club/info/${yj.club.id}"><img class="td-icon-img" src="${yj.club.imgUrl}">${yj.club.name}</a></td>
                                    <td>${yj.victory}/${yj.draw}/${yj.negative}</td>
                                    <td>${yj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${yjStatus.count==2}">
                                <tr class="success">
                                    <td>${yjStatus.count}</td>
                                    <td><a href="/club/info/${yj.club.id}"><img class="td-icon-img" src="${yj.club.imgUrl}">${yj.club.name}</a></td>
                                    <td>${yj.victory}/${yj.draw}/${yj.negative}</td>
                                    <td>${yj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${yjStatus.count==3}">
                                <tr class="warning">
                                    <td>${yjStatus.count}</td>
                                    <td><a href="/club/info/${yj.club.id}"><img class="td-icon-img" src="${yj.club.imgUrl}">${yj.club.name}</a></td>
                                    <td>${yj.victory}/${yj.draw}/${yj.negative}</td>
                                    <td>${yj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${yjStatus.count>3}">
                                <tr class="active">
                                    <td>${yjStatus.count}</td>
                                    <td><a href="/club/info/${yj.club.id}"><img class="td-icon-img" src="${yj.club.imgUrl}">${yj.club.name}</a></td>
                                    <td>${yj.victory}/${yj.draw}/${yj.negative}</td>
                                    <td>${yj.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
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
                        <c:forEach items="${djRanking}" var="dj" varStatus="djStatus">
                            <c:if test="${djStatus.first}">
                                <tr class="danger">
                                    <td>${djStatus.count}</td>
                                    <td><a href="/club/info/${dj.club.id}"><img class="td-icon-img" src="${dj.club.imgUrl}">${dj.club.name}</a></td>
                                    <td>${dj.victory}/${dj.draw}/${dj.negative}</td>
                                    <td>${dj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${djStatus.count==2}">
                                <tr class="success">
                                    <td>${djStatus.count}</td>
                                    <td><a href="/club/info/${dj.club.id}"><img class="td-icon-img" src="${dj.club.imgUrl}">${dj.club.name}</a></td>
                                    <td>${dj.victory}/${dj.draw}/${dj.negative}</td>
                                    <td>${dj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${djStatus.count==3}">
                                <tr class="warning">
                                    <td>${djStatus.count}</td>
                                    <td><a href="/club/info/${dj.club.id}"><img class="td-icon-img" src="${dj.club.imgUrl}">${dj.club.name}</a></td>
                                    <td>${dj.victory}/${dj.draw}/${dj.negative}</td>
                                    <td>${dj.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${djStatus.count>3}">
                                <tr class="active">
                                    <td>${djStatus.count}</td>
                                    <td><a href="/club/info/${dj.club.id}"><img class="td-icon-img" src="${dj.club.imgUrl}">${dj.club.name}</a></td>
                                    <td>${dj.victory}/${dj.draw}/${dj.negative}</td>
                                    <td>${dj.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
