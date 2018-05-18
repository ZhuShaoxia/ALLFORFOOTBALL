<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/article.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/data.css"/>
    <!--<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>-->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/article-comment.js" type="text/javascript"
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
<div class="container" style="min-height: 638px">
    <div class="row">

        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <c:choose>
                    <c:when test="${matchTypeId==1}">
                        <li class="active"><a href="/data?matchTypeId=1">中超</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=1">中超</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${matchTypeId==2}">
                        <li class="active"><a href="/data?matchTypeId=2">西甲</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=2">西甲</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${matchTypeId==3}">
                        <li class="active"><a href="/data?matchTypeId=3">英超</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=3">英超</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${matchTypeId==4}">
                        <li class="active"><a href="/data?matchTypeId=4">意甲</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=4">意甲</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${matchTypeId==5}">
                        <li class="active"><a href="/data?matchTypeId=5">德甲</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=5">德甲</a></li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${matchTypeId==6}">
                        <li class="active"><a href="/data?matchTypeId=6">法甲</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/data?matchTypeId=6">法甲</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="row data-right-1">
                <ul class="nav nav-pills nav-justified nav-tabs">
                    <%--scoreBoard--%>
                    <li class="active"><a data-toggle="tab" id="scoreBoardA" href="#scoreBoardDiv">积分榜</a></li>
                    <%--shooterBoard--%>
                    <li><a data-toggle="tab" id="shooterBoardA" href="#shooterBoardDiv">射手榜</a></li>
                    <%--assistBoard--%>
                    <li><a data-toggle="tab" id="assistBoardA" href="#assistBoardDiv">助攻榜</a></li>
                    <%--scheduleBoard--%>
                    <li><a data-toggle="tab" id="scheduleBoardA" href="#scheduleBoardDiv">赛程表</a></li>
                </ul>
            </div>
            <div class="tab-content">
                <div id="scoreBoardDiv" class="row tab-pane data-right fade in active ">
                    <table class="table table-hover">
                        <thead>
                        <tr class="data-table-profile">
                            <td colspan="10">积分榜</td>
                        </tr>
                        <tr class="data-table-head">
                            <th>排名</th>
                            <th>球队</th>
                            <th>场次</th>
                            <th>胜</th>
                            <th>平</th>
                            <th>负</th>
                            <th>进球</th>
                            <th>失球</th>
                            <th>净胜球</th>
                            <th>积分</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rankings}" var="ranking" varStatus="rankingStatus">
                            <c:if test="${rankingStatus.first}">
                                <tr class="danger">
                                    <td>${rankingStatus.count}</td>
                                    <td><a href="/club/info/${ranking.club.id}"><img class="data-table-clubImg"
                                                                                     src="${ranking.club.imgUrl}">${ranking.club.name}
                                    </a>
                                    </td>
                                    <td>${ranking.matchTimes}</td>
                                    <td>${ranking.victory}</td>
                                    <td>${ranking.draw}</td>
                                    <td>${ranking.negative}</td>
                                    <td>${ranking.goals}</td>
                                    <td>${ranking.conceded}</td>
                                    <td>${ranking.goals-ranking.conceded}</td>
                                    <td>${ranking.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${rankingStatus.count==2}">
                                <tr class="success">
                                    <td>${rankingStatus.count}</td>
                                    <td><a href="/club/info/${ranking.club.id}"><img class="data-table-clubImg"
                                                                                     src="${ranking.club.imgUrl}">${ranking.club.name}
                                    </a>
                                    </td>
                                    <td>${ranking.matchTimes}</td>
                                    <td>${ranking.victory}</td>
                                    <td>${ranking.draw}</td>
                                    <td>${ranking.negative}</td>
                                    <td>${ranking.goals}</td>
                                    <td>${ranking.conceded}</td>
                                    <td>${ranking.goals-ranking.conceded}</td>
                                    <td>${ranking.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${rankingStatus.count==3}">
                                <tr class="warning">
                                    <td>${rankingStatus.count}</td>
                                    <td><a href="/club/info/${ranking.club.id}"><img class="data-table-clubImg"
                                                                                     src="${ranking.club.imgUrl}">${ranking.club.name}
                                    </a></td>
                                    <td>${ranking.matchTimes}</td>
                                    <td>${ranking.victory}</td>
                                    <td>${ranking.draw}</td>
                                    <td>${ranking.negative}</td>
                                    <td>${ranking.goals}</td>
                                    <td>${ranking.conceded}</td>
                                    <td>${ranking.goals-ranking.conceded}</td>
                                    <td>${ranking.score}</td>
                                </tr>
                            </c:if>
                            <c:if test="${rankingStatus.count>3}">
                                <tr class="active">
                                    <td>${rankingStatus.count}</td>
                                    <td><a href="/club/info/${ranking.club.id}"><img class="data-table-clubImg"
                                                                                     src="${ranking.club.imgUrl}">${ranking.club.name}
                                    </a></td>
                                    <td>${ranking.matchTimes}</td>
                                    <td>${ranking.victory}</td>
                                    <td>${ranking.draw}</td>
                                    <td>${ranking.negative}</td>
                                    <td>${ranking.goals}</td>
                                    <td>${ranking.conceded}</td>
                                    <td>${ranking.goals-ranking.conceded}</td>
                                    <td>${ranking.score}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="shooterBoardDiv" class="row tab-pane data-right fade">
                    <table class="table table-hover">
                        <thead>
                        <tr class="data-table-profile">
                            <td colspan="10">射手榜</td>
                        </tr>
                        <tr class="data-table-head">
                            <th>排名</th>
                            <th>球员</th>
                            <th>球队</th>
                            <th>进球数</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${shooterList}" var="shooter" varStatus="shooterStatus">
                            <c:if test="${shooterStatus.first}">
                                <tr class="danger">
                                    <td>${shooterStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${shooter.player.imgUrl}">${shooter.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${shooter.club.imgUrl}">${shooter.club.name}</a>
                                    </td>
                                    <td>${shooter.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${shooterStatus.count==2}">
                                <tr class="success">
                                    <td>${shooterStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${shooter.player.imgUrl}">${shooter.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${shooter.club.imgUrl}">${shooter.club.name}</a>
                                    </td>
                                    <td>${shooter.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${shooterStatus.count==2}">
                                <tr class="warning">
                                    <td>${shooterStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${shooter.player.imgUrl}">${shooter.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${shooter.club.imgUrl}">${shooter.club.name}</a>
                                    </td>
                                    <td>${shooter.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${shooterStatus.count>3}">
                                <tr class="active">
                                    <td>${shooterStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${shooter.player.imgUrl}">${shooter.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${shooter.club.imgUrl}">${shooter.club.name}</a>
                                    </td>
                                    <td>${shooter.count}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="assistBoardDiv" class="row tab-pane  data-right fade">
                    <table class="table table-hover">
                        <thead>
                        <tr class="data-table-profile">
                            <td colspan="10">助攻榜</td>
                        </tr>
                        <tr class="data-table-head">
                            <th>排名</th>
                            <th>球员</th>
                            <th>球队</th>
                            <th>助攻数</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${assistsList}" var="assist" varStatus="assistStatus">
                            <c:if test="${assistStatus.first}">
                                <tr class="danger">
                                    <td>${assistStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${assist.player.imgUrl}">${assist.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${assist.club.imgUrl}">${assist.club.name}</a>
                                    </td>
                                    <td>${assist.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${assistStatus.count==2}">
                                <tr class="success">
                                    <td>${assistStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${assist.player.imgUrl}">${assist.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${assist.club.imgUrl}">${assist.club.name}</a>
                                    </td>
                                    <td>${assist.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${assistStatus.count==3}">
                                <tr class="warning">
                                    <td>${assistStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${assist.player.imgUrl}">${assist.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${assist.club.imgUrl}">${assist.club.name}</a>
                                    </td>
                                    <td>${assist.count}</td>
                                </tr>
                            </c:if>
                            <c:if test="${assistStatus.count>3}">
                                <tr class="active">
                                    <td>${assistStatus.count}</td>
                                    <td><a href="#"><img class="data-table-playerImg"
                                                         src="${assist.player.imgUrl}">${assist.player.name}</a></td>
                                    <td><a href="#"><img class="data-table-clubImg"
                                                         src="${assist.club.imgUrl}">${assist.club.name}</a>
                                    </td>
                                    <td>${assist.count}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="scheduleBoardDiv" class="row tap-pane data-right fade">
                    <table class="table table-hover">
                        <thead>
                        <tr class="data-table-profile">
                            <td colspan="10">赛程表</td>
                        </tr>
                        <tr class="data-table-head">
                            <th id="match-info-times-pre-th" style="width: 30%;text-align: left;padding-left: 20px"><a
                                    href="#">&lt;&nbsp;上一轮</a>
                            </th>
                            <th id="match-info-times-th" style="width: 40%;font-size:15px" colspan="2">
                                第1轮
                            </th>
                            <input type="hidden" id="current-match-times" value="1">
                            <th id="match-info-times-after-th" style="width: 40%;text-align: right;padding-right: 20px">
                                <a href="#">&gt;&nbsp;下一轮</a>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="match-info-list-tbody">
                        <c:forEach items="${matchInfos}" var="matchInfo">
                            <tr class="success">
                                <td>${matchInfo.matchDate}&nbsp;${matchInfo.matchTime}</td>
                                <td><a href="/club/info/${matchInfo.homeClub.id}"><img class="data-table-clubImg"
                                                                              src="${matchInfo.homeClub.imgUrl}">${matchInfo.homeClub.name}
                                </a></td>
                                <td>${matchInfo.matchScore}</td>
                                <td><a href="/club/info/${matchInfo.awayClub.id}"><img class="data-table-clubImg"
                                                                              src="${matchInfo.awayClub.imgUrl}">${matchInfo.awayClub.name}
                                </a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/data.js"></script>
<script>
    $(function () {
        $("#match-info-times-pre-th").on('click', function () {
            var currentMatchTimes = $("#current-match-times").val()
            if (currentMatchTimes == 1) {
                alert('当前已经为第一轮比赛')
                return
            }
            var matchTypeId = '${matchTypeId}'
            if (matchTypeId == '') {
                matchTypeId = 1
            }
            changeMatchInfo(matchTypeId, --currentMatchTimes)
            $("#match-info-times-th").text("第" + currentMatchTimes + "轮")

        })
        $("#match-info-times-after-th").on('click', function () {
            var currentMatchTimes = $("#current-match-times").val()
            var maxMatchTimes = '${matchType.matchNum}'
            var matchTypeId = '${matchTypeId}'
            if (currentMatchTimes == maxMatchTimes) {
                alert('当前为最后一轮比赛')
                return
            }
            if (matchTypeId == '') {
                matchTypeId = 1
            }
            changeMatchInfo(matchTypeId, ++currentMatchTimes)
            $("#match-info-times-th").text("第" + currentMatchTimes + "轮")
        })


    })

    function changeMatchInfo(matchTypeId, matchTimes) {
        console.log('matchTypeId:' + matchTypeId)
        console.log('matchTimes:' + matchTimes)
        $("#match-info-list-tbody").empty()
        var html = ''
        $.ajax({
            data: {
                matchTypeId: matchTypeId,
                matchTimes: matchTimes
            },
            url: '/match/searchMatchInfoByMatchTypeAndMatchTimes',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var matchScore = data[i].matchScore
                    if (matchScore == null) {
                        matchScore = ''
                    }
                    html += "<tr class=\"success\">\n" +
                        "    <td>" + data[i].matchDate + "&nbsp;" + data[i].matchTime + "</td>\n" +
                        "    <td><a href=\"/club/info/" + data[i].homeClub.id + "\"><img class=\"data-table-clubImg\"\n" +
                        "                                                  src=\"" + data[i].homeClub.imgUrl + "\">" + data[i].homeClub.name + "\n" +
                        "    </a></td>\n" +
                        "    <td>" + matchScore + "</td>\n" +
                        "    <td><a href=\"/club/info/" + data[i].awayClub.id + "\"><img class=\"data-table-clubImg\"\n" +
                        "                                                  src=\"" + data[i].awayClub.imgUrl + "\">" + data[i].awayClub.name + "\n" +
                        "    </a></td>\n" +
                        "</tr>\n"
                }
                $("#match-info-list-tbody").append(html)
                $("#current-match-times").attr('value', matchTimes)
            }
        })

    }
</script>

