<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/club.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<!--导航栏-->
<%@include file="head.jsp" %>
<div class="container">
    <div class="col-md-9">
        <%--球队简介--%>
        <div class="row">
            <div class="club-info">
                <div class="col-md-3 club-info-left">
                    <img src="${club.imgUrl}" alt="">
                </div>
                <div class="col-md-9 club-info-right">
                    <div class="club-info-right-head">
                        <div style="height: 40px">
                            <span class="club-name">${club.name}</span>
                            <img class="club-country" src="${club.country.imgUrl}" alt="${club.country.name}">
                        </div>
                        <span class="club-name-eg">${club.otherName}</span>
                    </div>
                    <div class="club-info-right-body">
                        <table class="table table-condensed">
                            <tr>
                                <td style="width: 10%"><span class="club-info-detail">成立:</span></td>
                                <td style="width: 15%"><span class="club-info-detail-val">${club.established}</span>
                                </td>
                                <td style="width:20%"><span class="club-info-detail">国家和地区:</span></td>
                                <td><span class="club-info-detail-val">${club.country.name}</span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">城市:</span></td>
                                <td><span class="club-info-detail-val">${club.city}</span></td>
                                <td><span class="club-info-detail">主场:</span></td>
                                <td><span class="club-info-detail-val">${club.homeField}</span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">电话:</span></td>
                                <td><span class="club-info-detail-val">${club.phone}</span></td>
                                <td><span class="club-info-detail">邮箱:</span></td>
                                <td><span class="club-info-detail-val">${club.email}</span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">地址:</span></td>
                                <td colspan="3"><span class="club-info-detail-val">${club.address}</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--赛程  未来两周内的赛程--%>
        <div class="row">
            <div class="schedule club-item">
                <div class="club-item-head schedule-head">
                    <span>赛程</span>
                </div>
                <div class="schedule-body">
                    <table class="table table-striped">
                        <c:forEach items="${matchInfos}" var="matchInfo">
                            <tr>
                                    <%--比赛时间--%>
                                <td style="width: 15%">${matchInfo.matchDate}&nbsp;&nbsp;${matchInfo.matchTime}</td>
                                    <%--比赛性质 比赛场次--%>
                                <td style="width: 20%">
                                    <span>${matchInfo.matchType.type}</span><span>${matchInfo.matchTimes}轮</span></td>
                                <td style="width: 20% ;text-align: right">
                                    <a href="/club/info/${matchInfo.homeClub.id}">
                                        <span class="schedule-club-name">${matchInfo.homeClub.name}</span><img
                                            class="td-icon-img" src="${matchInfo.homeClub.imgUrl}"
                                            alt="${matchInfo.homeClub.name}">
                                    </a>
                                </td>
                                <td style="width: 3%;">VS</td>
                                <td style="width: 20% ;text-align: left">
                                    <a href="/club/info/${matchInfo.awayClub.id}"><img class="td-icon-img"
                                                                                       src="${matchInfo.awayClub.imgUrl}"
                                                                                       alt="${matchInfo.awayClub.name}"><span
                                            class="schedule-club-name">${matchInfo.awayClub.name}</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <%--队员--%>
        <div class="row">
            <div class="club-member club-item">
                <div class="club-item-head club-member-head">
                    <span>${club.name}队员</span>
                </div>
                <div class="club-member-body">
                    <table class="table table-hover table-striped" style="text-align: center">
                        <thead style="background-color: silver">
                        <td style="width: 15px">位置</td>
                        <td style="width: 15px">号码</td>
                        <td style="width: 25px">姓名</td>
                        <%--<td style="width: 15px">出场</td>--%>
                        <%--<td style="width: 15px">进球</td>--%>
                        <td style="width: 15px">国籍</td>
                        </thead>
                        <tbody>
                        <c:forEach items="${players}" var="player">
                            <tr>
                                <td>${player.playerPosition.position}</td>
                                <td>${player.number}</td>
                                <td>
                                    <a href="/player/info/${player.id}">
                                        <img class="td-icon-img" src="${player.imgUrl}"
                                             alt="${player.name}">${player.name}
                                    </a>
                                </td>
                                    <%--TODO:出场次数--%>
                                <%--<td>20</td>--%>
                                <%--<td>9</td>--%>
                                <td>${player.country}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%--冠军奖杯--%>
        <div class="row">
            <div class="club-honer club-item">
                <div class="club-item-head club-honer-head">
                    <span>荣誉记录</span>
                </div>
                <div class="club-honer-body">
                    <table class="table table-striped" style="text-align: center">
                        <c:forEach items="${honers}" var="honer">
                            <tr class="success">
                                <td style="width: 30%">${honer.honerName}</td>
                                <td style="width: 10%">${honer.honerTime}</td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <%--新闻--%>
        <div class="row">
            <div class="club-article club-item">
                <div class="club-item-head club-article-head">
                    <span>相关新闻</span>
                </div>
            </div>
            <div class="club-article-body">
                <div class="left-article-list">
                    <c:forEach items="${articles}" var="article">
                        <div class="article-item">
                            <div class="col-md-3 article-img">
                                <img src="${article.imgUrl}" class="img-rounded"/>
                            </div>
                            <div class="col-md-9">
                                <a href="/article/info/${article.id}">
                                    <div class="row article-title">
                                        <strong style="color: #333;">${article.title}</strong>
                                        <p class="text-muted">${article.subtitle}</p>
                                    </div>
                                </a>
                                <div class="row  article-time">
                                    <small>${article.createTime}</small>
                                    <a href="/article/info/${article.id}" style="float: right;"><img
                                            src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3" style="padding-right:0px">
        <div>
            <table class="table table-hover">
                <thead>
                <tr class="data-table-profile">
                    <td colspan="3"><span style="font-size: 16px">积分榜</span></td>
                    <td><a href="/data">更多</a></td>
                </tr>
                <tr class="data-table-head">
                    <th>排名</th>
                    <th>球队</th>
                    <th>胜/平/负</th>
                    <th>积分</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${rankings}" var="ranking" varStatus="rankingStatus">
                    <c:if test="${rankingStatus.first}">
                        <tr class="danger">
                            <td>${rankingStatus.count}</td>
                            <td><a href="/club/info/${ranking.club.id}"><img class="td-icon-img" src="${ranking.club.imgUrl}">${ranking.club.name}</a></td>
                            <td>${ranking.victory}/${ranking.draw}/${ranking.negative}</td>
                            <td>${ranking.score}</td>
                        </tr>
                    </c:if>
                    <c:if test="${rankingStatus.count==2}">
                        <tr class="success">
                            <td>${rankingStatus.count}</td>
                            <td><a href="/club/info/${ranking.club.id}"><img class="td-icon-img" src="${ranking.club.imgUrl}">${ranking.club.name}</a></td>
                            <td>${ranking.victory}/${ranking.draw}/${ranking.negative}</td>
                            <td>${ranking.score}</td>
                        </tr>
                    </c:if>
                    <c:if test="${rankingStatus.count==3}">
                        <tr class="warning">
                            <td>${rankingStatus.count}</td>
                            <td><a href="/club/info/${ranking.club.id}"><img class="td-icon-img" src="${ranking.club.imgUrl}">${ranking.club.name}</a></td>
                            <td>${ranking.victory}/${ranking.draw}/${ranking.negative}</td>
                            <td>${ranking.score}</td>
                        </tr>
                    </c:if>
                    <c:if test="${rankingStatus.count>3}">
                        <tr class="active">
                            <td>${rankingStatus.count}</td>
                            <td><a href="/club/info/${ranking.club.id}"><img class="td-icon-img" src="${ranking.club.imgUrl}">${ranking.club.name}</a></td>
                            <td>${ranking.victory}/${ranking.draw}/${ranking.negative}</td>
                            <td>${ranking.score}</td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
