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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

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
                    <img src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png" alt="">
                </div>
                <div class="col-md-9 club-info-right">
                    <div class="club-info-right-head">
                        <div style="height: 40px">
                            <span class="club-name">上海上港</span>
                            <img class="club-country" src="${pageContext.request.contextPath}/img/country/china.png" alt="">
                        </div>
                        <span class="club-name-eg">Shanghai SIPG</span>
                    </div>
                    <div class="club-info-right-body">
                        <table class="table table-condensed">
                            <tr>
                                <td style="width: 10%"><span class="club-info-detail">成立:</span></td>
                                <td style="width: 15%"><span class="club-info-detail-val">2005</span></td>
                                <td style="width:20%"><span class="club-info-detail">国家和地区:</span></td>
                                <td><span class="club-info-detail-val">中国</span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">城市:</span></td>
                                <td><span class="club-info-detail-val">上海</span></td>
                                <td><span class="club-info-detail">主场:</span></td>
                                <td><span class="club-info-detail-val">上海体育场(56842人)</span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">电话:</span></td>
                                <td><span class="club-info-detail-val"></span></td>
                                <td><span class="club-info-detail">邮箱:</span></td>
                                <td><span class="club-info-detail-val"></span></td>
                            </tr>
                            <tr>
                                <td><span class="club-info-detail">地址:</span></td>
                                <td colspan="3"><span class="club-info-detail-val">中国上海</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--赛程--%>
        <div class="row">
            <div class="schedule club-item">
                <div class="club-item-head schedule-head">
                    <span>赛程</span>
                </div>
                <div class="schedule-body">
                    <table class="table table-striped">
                        <tr>
                            <%--比赛时间--%>
                            <td style="width: 15%">03-07 21:00</td>
                            <%--比赛性质 比赛场次--%>
                            <td style="width: 20%"><span>中超</span><span>2轮</span></td>
                            <td style="width: 20% ;text-align: right">
                                <a href="#球队">
                                    <span class="schedule-club-name">上海上港</span><img
                                        class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png" alt="">
                                </a>
                            </td>
                            <td style="width: 3%;">VS</td>
                            <td style="width: 20% ;text-align: left">
                                <a href="#球队"><img class="td-icon-img"
                                                   src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png" alt=""><span
                                        class="schedule-club-name">上海绿地申花</span>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <%--队员--%>
        <div class="row">
            <div class="club-member club-item">
                <div class="club-item-head club-member-head">
                    <span>上海上港队员</span>
                </div>
                <div class="club-member-body">
                    <table class="table table-hover table-striped" style="text-align: center">
                        <thead style="background-color: silver">
                        <td style="width: 15px">位置</td>
                        <td style="width: 15px">号码</td>
                        <td style="width: 25px">姓名</td>
                        <td style="width: 15px">出场</td>
                        <td style="width: 15px">进球</td>
                        <td style="width: 15px">国籍</td>
                        </thead>
                        <tr>
                            <td>教练</td>
                            <td>--</td>
                            <td>
                                <a href="#球员">
                                    <img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/p_alan.jpg" alt="">卡纳瓦罗
                                </a>
                            </td>
                            <td>--</td>
                            <td>--</td>
                            <td><img class="td-icon-img" src="${pageContext.request.contextPath}/img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td>前锋</td>
                            <td>7</td>
                            <td>
                                <a href="#球员">
                                    <img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/p_alan.jpg" alt="">阿兰
                                </a>
                            </td>
                            <td>20</td>
                            <td>9</td>
                            <td><img class="td-icon-img" src="${pageContext.request.contextPath}/img/country/china.png" alt=""></td>
                        </tr>

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
                        <tr class="success">
                            <td style="width: 30%">中国足球甲级联赛</td>
                            <td style="width: 10%">2012</td>
                            <td></td>
                        </tr>
                        <tr class="success">
                            <td style="width: 30%">中国足球甲级联赛</td>
                            <td style="width: 10%">2012</td>
                            <td></td>
                        </tr>
                        <tr class="success">
                            <td style="width: 30%">中国足球甲级联赛</td>
                            <td style="width: 10%">2012</td>
                            <td></td>
                        </tr>
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
                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>

                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>

                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>

                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>

                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>

                    <div class="article-item">
                        <div class="col-md-3 article-img">
                            <img src="${pageContext.request.contextPath}/img/1.jpg" class="img-rounded"/>
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
                                <a href="article.jsp" style="float: right;"><img src="${pageContext.request.contextPath}/img/article-comment.png"></a>
                            </div>
                        </div>
                    </div>
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
                    <td><a href="data.jsp">更多</a></td>
                </tr>
                <tr class="data-table-head">
                    <th>排名</th>
                    <th>球队</th>
                    <th>胜/平/负</th>
                    <th>积分</th>
                </tr>
                </thead>
                <tbody>
                <tr class="active">
                    <td>1</td>
                    <td><a href="club.jsp"><img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                    </td>
                    <td>2/2/2</td>
                    <td>6</td>
                </tr>
                <tr class="success">
                    <td>1</td>
                    <td><a href="club.jsp"><img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                    </td>
                    <td>2/2/2</td>
                    <td>6</td>
                </tr>
                <tr class="warning">
                    <td>1</td>
                    <td><a href="club.jsp"><img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                    </td>
                    <td>2/2/2</td>
                    <td>6</td>
                </tr>
                <tr class="">
                    <td>1</td>
                    <td><a href="club.jsp"><img class="td-icon-img" src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                    </td>
                    <td>2/2/2</td>
                    <td>6</td>
                </tr>
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
