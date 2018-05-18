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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/game-list.css"/>

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
<div class="container" style="min-height: 668px">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="/matches?matchTypeId=1">中超</a></li>
                <li><a href="/matches?matchTypeId=2">西甲</a></li>
                <li><a href="/matches?matchTypeId=3">英超</a></li>
                <li><a href="/matches?matchTypeId=4">意甲</a></li>
                <li><a href="/matches?matchTypeId=5">德甲</a></li>
                <li><a href="/matches?matchTypeId=6">法甲</a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="game-head">
                <span>比赛列表</span>
                <input id="matchDateInput" type="date" placeholder="选择比赛日">
            </div>
            <div class="game-list" id="game-list">
                <%--数据加载动图--%>
                <%--<div id="loading-img" class="loading">--%>
                <%--<img src="img/loading.gif" alt="">--%>
                <%--</div>--%>
                <%--数据为空--%>
                <%--<div class="list-null">--%>
                <%--<img src="img/data-null.png" alt="">--%>
                <%--</div>--%>
                <c:forEach items="${matchInfos}" var="map">
                    <div class="game-item">
                        <c:if test="${map.value.size()!=0}">
                            <div class="game-item-head">
                                <strong>${map.key}</strong>
                            </div>
                        </c:if>
                        <div>
                            <table class="table table-hover">
                                <c:forEach items="${map.value}" var="item">
                                    <tr style="text-align: center ">
                                        <td style="width: 15%">${item.matchState.state}</td>
                                        <td style="width: 15%">${item.matchType.type}</td>
                                        <td style="width: 25%"><a href="/club/info/${item.homeClub.id}">${item.homeClub.name}</a></td>
                                        <td style="width: 10%">${item.matchScore}</td>
                                        <td style="width: 25%"><a href="/club/info/${item.awayClub.id}">${item.awayClub.name}</a></td>
                                        <td style="width: 10%"><a href="/match/info/${item.id}">比赛信息</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </c:forEach>
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
        $("#matchDateInput").on('change', function () {
            var matchTypeId = '${pageContext.request.queryString}';
            if (matchTypeId != '') {
                matchTypeId = matchTypeId.substr(12)
            } else {
                matchTypeId = 1
            }
            var matchDate = $("#matchDateInput").val()

            if (matchDate != '') {
                var html = "<div class=\"game-item\">\n" +
                    "    <div class=\"game-item-head\">\n" +
                    "        <strong>" + matchDate + "</strong>\n" +
                    "    </div>\n" +
                    "    <div>\n" +
                    "        <table class=\"table table-hover\">"
                $("#game-list").empty()
                $.ajax({
                    data: {
                        matchDate: matchDate,
                        matchTypeId: matchTypeId
                    },
                    url: '/match/searchMatchForList',
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            var matchScore = data[i].matchScore
                            if (matchScore == null) {
                                matchScore = ''
                            }
                            html += "<tr style=\"text-align: center \">\n" +
                                "                                        <td>" + data[i].matchState.state + "</td>\n" +
                                "                                        <td>" + data[i].matchType.type + "</td>\n" +
                                "                                        <td><a href=\"/club/info/" + data[i].homeClub.id + "\">" + data[i].homeClub.name + "</a></td>\n" +
                                "                                        <td>" + matchScore + "</td>\n" +
                                "                                        <td><a href=\"/club/info/" + data[i].awayClub.id + "\">" + data[i].awayClub.name + "</a></td>\n" +
                                "                                        <td><a href=\"/match/info/" + data[i].id + "\">比赛信息</a></td>\n" +
                                "                                    </tr>"
                        }
                        html += "        </table>\n" +
                            "    </div>\n" +
                            "</div>"
                        $("#game-list").append(html)
                    }
                })
            }
        })
    })
</script>

