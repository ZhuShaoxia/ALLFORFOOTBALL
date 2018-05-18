<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <%----%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/article-list.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <%--分页--%>
    <script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<!--导航栏-->
<%@include file="head.jsp" %>
<div class="container" style="min-height: 700px">
    <div class="row article-list-head">
        <div class="col-md-8 article-list-head-nav">
            <ul class="nav nav-pills nav-justified">
                <c:choose>
                    <c:when test="${articleTypeId==1}">
                        <li class="active"><a href="/articles?articleTypeId=1">头条</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/articles?articleTypeId=1">头条</a></li>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${articleTypeId==2}">
                        <li class="active"><a href="/articles?articleTypeId=2">转会</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/articles?articleTypeId=2">转会</a></li>
                    </c:otherwise>
                </c:choose>


                <c:choose>
                    <c:when test="${articleTypeId==3}">
                        <li class="active"><a href="/articles?articleTypeId=3">闲情</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/articles?articleTypeId=3">闲情</a></li>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${articleTypeId==4}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                中超<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=4">全部</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=恒大">广州恒大</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=上港">上海上港</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=鲁能">山东鲁能</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=国安">北京国安</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">中超<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=4">全部</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=恒大">广州恒大</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=上港">上海上港</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=鲁能">山东鲁能</a></li>
                                <li><a href="/articles?articleTypeId=4&condition=国安">北京国安</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${articleTypeId==5}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                西甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=5">全部</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=巴塞罗那">巴塞罗那</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=马德里竞技">马德里竞技</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=皇家马德里">皇家马德里</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=瓦伦西亚">瓦伦西亚</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">西甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=5">全部</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=巴塞罗那">巴塞罗那</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=马德里竞技">马德里竞技</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=皇家马德里">皇家马德里</a></li>
                                <li><a href="/articles?articleTypeId=5&condition=瓦伦西亚">瓦伦西亚</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${articleTypeId==6}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                英超<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=6">全部</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=曼城">曼城</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=曼联">曼联</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=利物浦">利物浦</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=热刺">托特纳姆热刺</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">英超<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=6">全部</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=曼城">曼城</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=曼联">曼联</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=利物浦">利物浦</a></li>
                                <li><a href="/articles?articleTypeId=6&condition=热刺">托特纳姆热刺</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${articleTypeId==7}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                意甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=7">全部</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=尤文">尤文图斯</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=那不勒斯">那不勒斯</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=罗马">罗马</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=拉齐奥">拉齐奥</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                意甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=7">全部</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=尤文">尤文图斯</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=那不勒斯">那不勒斯</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=罗马">罗马</a></li>
                                <li><a href="/articles?articleTypeId=7&condition=拉齐奥">拉齐奥</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${articleTypeId==8}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                德甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=8">全部</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=拜仁">拜仁慕尼黑</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=沙尔克">沙尔克04</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=多特">多特蒙德</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=霍芬海姆">霍芬海姆</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">德甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=8">全部</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=拜仁">拜仁慕尼黑</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=沙尔克">沙尔克04</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=多特">多特蒙德</a></li>
                                <li><a href="/articles?articleTypeId=8&condition=霍芬海姆">霍芬海姆</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${articleTypeId==9}">
                        <li class="active dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                法甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=9">全部</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=巴黎">巴黎圣日耳曼</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=里昂">里昂</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=摩纳哥">摩纳哥</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=马赛">马赛</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">法甲<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/articles?articleTypeId=9">全部</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=巴黎">巴黎圣日耳曼</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=里昂">里昂</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=摩纳哥">摩纳哥</a></li>
                                <li><a href="/articles?articleTypeId=9&condition=马赛">马赛</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div class="col-md-4 article-list-head-search">
            <div class="article-list-head-search-top">
                <input id="startTimeInput" type="date" class="search-date-input">
                <span>--</span>
                <input id="endTimeInput" type="date" class="search-date-input">
            </div>
            <div class="article-list-head-search-bottom">
                <input id="conditionInput" type="text" class="search-text-input" placeholder="请输入文章内容">
                <button id="searchBtn" class="btn btn-success">搜索</button>
            </div>
        </div>
    </div>
    <div class="row article-list-body">
        <div class="col-md-8 article-list-body-left">
            <div id="left-article-list" class="left-article-list">
                <c:forEach items="${pageInfo.list}" var="article">
                    <div class="row article-item" style="border-bottom: 1px solid beige">
                        <div class="col-md-3 article-img">
                            <img src="${article.imgUrl}" class="img-rounded"/>
                        </div>
                        <div class="col-md-9">
                            <a href="/article/info/${article.id}">
                                <div class="row article-title">
                                    <strong>${article.title}</strong>
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
        <div class="col-md-4 article-list-body-right">
            <span class="hot-comment-title">最新评论</span>
            <div class="hot-comment-list">
                <c:forEach items="${hotComment}" var="comment" varStatus="count">
                    <div class="hot-comment-item">
                        <div class="col-md-3 hot-comment-item-img">
                            <span>${count.count}</span>
                            <a href="/user/info/${comment.user.id}">
                                <img src="${comment.user.imgUrl}" alt="">
                            </a>
                        </div>
                        <a href="/article/info/${comment.article.id}">
                            <div class="col-md-9 hot-comment-item-content">
                                <%--<span>${comment.content}</span>--%>
                                ${comment.content}
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script>
    $(function () {
        var page = 1
        var isBool = true
        /**
         * 下拉刷新
         */
        $(window).scroll(function () {
            if (($(this).scrollTop() + $(window).height()) >= $(document).height() && isBool == true) {
                isBool = false
                addHtml(page)
                setTimeout(function () {
                    isBool = true
                }, 3000)
            }
        });

        /**
         * 搜索
         */
        $("#searchBtn").on('click', function () {
            $("#left-article-list").empty()
            addHtml(0)
        })
    })

    function addHtml(currentPage, isBool) {
        var startTime = $("#startTimeInput").val()
        var endTime = $("#endTimeInput").val()
        var condition = $("#conditionInput").val()
        var articleTypeId = '${articleTypeId}'
        if (articleTypeId == '') {
            articleTypeId = 1
        }
        if (startTime == '') {
            startTime = null
        }
        if (endTime == '') {
            endTime = null
        }
        var html = ''
        $.ajax({
            data: {
                page: ++currentPage,
                startTime: startTime,
                endTime: endTime,
                condition: condition,
                articleTypeId: articleTypeId
            },
            url: '/article/loading',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    html += "<div class=\"row article-item\" style=\"border-bottom: 1px solid beige\">\n" +
                        "                        <div class=\"col-md-3 article-img\">\n" +
                        "                            <img src=\"" + data[i].imgUrl + "\" class=\"img-rounded\"/>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"col-md-9\">\n" +
                        "                            <a href=\"/article/info/" + data[i].id + "\">\n" +
                        "                                <div class=\"row article-title\">\n" +
                        "                                    <strong>" + data[i].title + "</strong>\n" +
                        "                                    <p class=\"text-muted\">" + data[i].subtitle + "</p>\n" +
                        "                                </div>\n" +
                        "                            </a>\n" +
                        "                            <div class=\"row  article-time\">\n" +
                        "                                <small>" + data[i].createTime + "</small>\n" +
                        "                                <a href=\"/article/info/" + data[i].id + "\" style=\"float: right;\"><img\n" +
                        "                                        src=\"/img/article-comment.png\"></a>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>"
                }
                $("#left-article-list").append(html)
            }
        })
    }
</script>
