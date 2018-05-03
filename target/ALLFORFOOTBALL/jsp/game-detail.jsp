<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 16:02
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/game-detail.css"/>

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
<div class="container" style="min-height: 660px">
    <div class="row">
        <div class="col-md-9">
            <div class="game-detail-info">
                <div class="col-md-3 col-md-offset-1 game-detail-info-left">
                    <a href="/club/info/${matchInfo.homeClub.id}">
                        <img class="img-rounded team-img" src="${matchInfo.homeClub.imgUrl}"
                             alt="${matchInfo.homeClub.name}">
                        <p class="team-name">${matchInfo.homeClub.name}</p>
                    </a>
                </div>
                <div class="col-md-4 game-detail-info-center">
                    <p class="match-time">${matchInfo.matchDate} ${matchInfo.matchTime} ${matchInfo.matchType.type}${matchInfo.matchTimes}轮</p>
                    <%--未开始 大的VS--%>
                    <span>VS</span>
                    <p style="margin-bottom: 0px;margin-top: 10px">${matchInfo.matchState.state}</p>
                    <%--结束 三行 比赛结果 比赛状态--%>
                </div>
                <div class="col-md-3 game-detail-info-right ">
                    <a href="/club/info/${matchInfo.awayClub.id}">
                        <img class="img-rounded team-img" src="${matchInfo.awayClub.imgUrl}"
                             alt="${matchInfo.awayClub.imgUrl}">
                        <p class="team-name">${matchInfo.awayClub.name}</p>
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
                                    <td style="width:45%;text-align: right;font-size: 18px">${matchInfo.homeClub.name}<img
                                            class="td-icon-img"
                                            src="${matchInfo.homeClub.imgUrl}"
                                            alt=""></td>
                                    <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                    <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                                src="${matchInfo.awayClub.imgUrl}"
                                                                                                alt="">${matchInfo.awayClub.name}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <%--比赛过程--%>
                        <div class="match-result">
                            <span class="icon-start"></span>
                            <ul class="time-line">
                                <c:forEach items="${matchProcesses}" var="matchProcess">
                                    <li class="cf">
                                        <span class="num">${matchProcess.key}</span>
                                        <div class="time-line-left">
                                            <c:forEach items="${matchProcess.value}" var="item">
                                                <c:if test="${item.club.id==matchInfo.homeClub.id}">
                                                    <p><img class="match-img" src="${item.matchEvent.imgUrl}"
                                                            alt="">${item.player.name}</p>

                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="time-line-right">
                                            <c:forEach items="${matchProcess.value}" var="item">
                                                <c:if test="${item.club.id==matchInfo.awayClub.id}">
                                                    <p><img class="match-img" src="${item.matchEvent.imgUrl}"
                                                            alt="">${item.player.name}</p>

                                                </c:if>
                                            </c:forEach>
                                        </div>

                                    </li>
                                </c:forEach>
                            </ul>
                            <span class="icon-end"></span>
                        </div>
                        <div class="match-describe">
                            <span class="match-describe-text"><img
                                    src="${pageContext.request.contextPath}/img/match-result-icon-a.png" alt=""
                                    class="match-describe-img">进球</span>
                            <span class="match-describe-text"><img
                                    src="${pageContext.request.contextPath}/img/match-result-icon-b.png" alt=""
                                    class="match-describe-img">点球</span>
                            <span class="match-describe-text"><img
                                    src="${pageContext.request.contextPath}/img/match-result-icon-c.png" alt=""
                                    class="match-describe-img">点球未进</span>
                            <span class="match-describe-text"><img
                                    src="${pageContext.request.contextPath}/img/match-result-icon-d.png" alt=""
                                    class="match-describe-img">乌龙球</span>
                            <span class="match-describe-text"><img
                                    src="${pageContext.request.contextPath}/img/match-result-icon-e.png" alt=""
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
                                    <td style="width:45%;text-align: right;font-size: 18px">${matchInfo.homeClub.name}<img
                                            class="td-icon-img" src="${matchInfo.homeClub.imgUrl}"
                                            alt="${matchInfo.homeClub.name}"></td>
                                    <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                    <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                                src="${matchInfo.awayClub.imgUrl}"
                                                                                                alt="">${matchInfo.awayClub.name}
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
                                        <span>${homeTec.ballControlRate}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.ballControlRate}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">控球率</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.ballControlRate}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.ballControlRate}</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.shooting}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.shooting}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">射门</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.shooting}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.shooting}</span>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.shootZ}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.shootZ}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">射正</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.shootZ}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.shootZ}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.plugging}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.plugging}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">封堵</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.plugging}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.plugging}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.freeKick}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.freeKick}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">任意球</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.freeKick}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.freeKick}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.cornerKick}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.cornerKick}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">角球</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.cornerKick}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.cornerKick}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.offside}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.offside}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">越位</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.offside}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.offside}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.substitution}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.substitution}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">换人</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.substitution}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.substitution}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        <span>${homeTec.foul}</span>
                                    </td>
                                    <td class="away" style="width: 40%;text-align: right;">
                                        <span class="t_rank" style="width: ${homeTec.foul}%"></span>
                                    </td>
                                    <td style="width: 10%;text-align: center">犯规</td>
                                    <td style="width: 40%">
                                        <span class="t_rank"
                                              style="width: ${awayTec.foul}%;background-color: chartreuse;text-align: left"></span>
                                    </td>
                                    <td style="width: 5%">
                                        <span>${awayTec.foul}</span>
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
                <%--阵容--%>
                <div id="match-player" class="tab-pane fade">
                    <%--比赛双方--%>
                    <div>
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <tbody>
                            <tr class="active">
                                <td style="width:45%;text-align: right;font-size: 18px">${matchInfo.homeClub.name}<img
                                        class="td-icon-img"
                                        src="${matchInfo.homeClub.imgUrl}"
                                        alt=""></td>
                                <td style="text-align: center;font-size: 18px">V&nbsp;S</td>
                                <td style="width:45%;text-align: left;font-size: 18px"><img class="td-icon-img"
                                                                                            src="${matchInfo.awayClub.imgUrl}"
                                                                                            alt="">${matchInfo.awayClub.name}
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
                                <td colspan="3">
                                    <table class="table">
                                        <tbody>
                                        <c:forEach items="${homeClubPlayerFirstStart}" var="h1">
                                            <tr>
                                                <td style="width: 10%;text-align: center">${h1.number}</td>
                                                <td style="width: 15%;text-align: center">${h1.playerPosition.position}</td>
                                                <td style="width: 20%;text-align: right">${h1.name}<img class="td-icon-img" src="${h1.imgUrl}" alt="${h1.name}"></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                                <td width="10%"></td>
                                <td colspan="3">
                                    <table class="table">
                                        <tbody>
                                        <c:forEach items="${awayClubPlayerFirstStart}" var="a1">
                                            <tr>
                                                <td style="width: 20%"><img class="td-icon-img" src="${a1.imgUrl}" alt="${a1.name}">${a1.name}</td>
                                                <td style="width: 15%;text-align: center">${a1.playerPosition.position}</td>
                                                <td style="width: 10%;text-align: center">${a1.number}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
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
                                <td colspan="3">
                                    <table class="table">
                                        <tbody>
                                        <c:forEach items="${homeClubPlayerSubstitutes}" var="h2">
                                            <tr>
                                                <td style="width: 10%;text-align: center">${h2.number}</td>
                                                <td style="width: 15%;text-align: center">${h2.playerPosition.position}</td>
                                                <td style="width: 20%;text-align: right">${h2.name}<img class="td-icon-img" src="${h2.imgUrl}" alt="${h2.name}"></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                                <td width="10%"></td>
                                <td colspan="3">
                                    <table class="table">
                                        <tbody>
                                        <c:forEach items="${awayClubPlayerSubstitutes}" var="a2">
                                            <tr>
                                                <td style="width: 20%"><img class="td-icon-img" src="${a2.imgUrl}" alt="${a2.name}">${a2.name}</td>
                                                <td style="width: 15%;text-align: center">${a2.playerPosition.position}</td>
                                                <td style="width: 10%;text-align: center">${a2.number}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--集锦--%>
                <div id="match-excellent" class="tab-pane fade" style="max-width: 100%">
                    <div>${matchHighlights.editorValue}</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="recent-game-head">
                <span>近期比赛</span>
            </div>
            <div class="recent-game-body">
                <table class="table table-hover" style="text-align: center">
                    <c:forEach items="${recentMatchInfo}" var="recentMatch">
                        <tr>
                            <td>
                                <a href="/match/info/${recentMatch.homeClub.id}">
                                    <p><img class="td-club-img"
                                            src="${recentMatch.homeClub.imgUrl}" alt="${recentMatch.homeClub.name}">
                                    </p>
                                    <p>${recentMatch.homeClub.name}</p>
                                </a>
                            </td>
                            <td style="padding-top: 25px">
                                <p>${recentMatch.matchType.type}</p>
                                <p>${recentMatch.matchDate}&nbsp;&nbsp;${recentMatch.matchTime}</p>
                            </td>
                            <td>
                                <a href="/club/info/${recentMatch.awayClub.id}">
                                    <p><img class="td-club-img"
                                            src="${recentMatch.awayClub.imgUrl}" alt="${recentMatch.awayClub.name}">
                                    </p>
                                    <p>${recentMatch.awayClub.name}</p>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>

    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/data.js"></script>


