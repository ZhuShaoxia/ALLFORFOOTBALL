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
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/player.css"/>
    <link rel="stylesheet" type="text/css" href="css/editor.css"/>

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="js/flotr2.min.js" type="text/javascript" charset="utf-8"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<script>
    $(function () {
        basic_radar(container)
    })

    function basic_radar(container) {
        // Fill series s1 and s2.
        var
            s1 = {label: '阿兰', data: [[0, 93], [1, 98], [2, 95], [3, 95], [4, 93], [5, 99]]},
            graph, ticks;

        // Radar Labels
        ticks = [
            [0, "速度"],
            [1, "射门"],
            [2, "传球"],
            [3, "盘带"],
            [4, "防守"],
            [5, "力量"],
        ];

        // Draw the graph.
        graph = Flotr.draw(container, [s1], {
            title:'综合能力',
            fontSize:'15',
            radar: {show: true},
            grid: {circular: true, minorHorizontalLines: true},
            yaxis: {min: 0, max: 100, minorTickFreq: null},
            xaxis: {ticks: ticks,showLabels:true},
            mouse: {track: true}
        });
    }

</script>
<body>
<!--导航栏-->
<%@include file="head.jsp" %>
<div class="container-fluid">
    <div class="col-md-9">
        <div class="player-info-head">
            <div class="col-md-9 player-info-head-left">
                <div class="info-name">
                    <div style="height: 30px;">
                        <span>阿兰</span>
                        <img class="info-img" src="img/country/china.png" alt="">
                        <img class="info-img" src="img/club/china/zc_shanggang.png" alt="">
                    </div>
                    <span>Alan</span>
                </div>
                <div class="info-detail">
                    <table class="table table-striped">
                        <tr>
                            <td>俱乐部:</td>
                            <td>广州恒大淘宝</td>
                            <td>位置:</td>
                            <td>前锋</td>
                            <td>号码:</td>
                            <td>7</td>
                        </tr>
                        <tr>
                            <td>国籍:</td>
                            <td>巴西</td>
                            <td>年龄:</td>
                            <td>28</td>
                            <td>生日:</td>
                            <td>1989-07-10</td>
                        </tr>
                        <tr>
                            <td>身高:</td>
                            <td>182CM</td>
                            <td>体重:</td>
                            <td>75KG</td>
                            <td>惯用脚:</td>
                            <td>右脚</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-3 player-info-head-right">
                <img src="img/club/china/p_alan.jpg" alt="">
            </div>
        </div>
        <%--比赛数据--%>
        <div class=" match-data player-item">
            <div class="match-data-head player-item-head">
                <span>比赛数据</span>
            </div>
            <div class="match-data-body">
                <table class="table table-striped">
                    <thead>
                    <td>赛季</td>
                    <td>俱乐部</td>
                    <td>上场</td>
                    <td>首发</td>
                    <td>进球</td>
                    <td>助攻</td>
                    <td>黄牌</td>
                    <td>红牌</td>
                    <td>替补</td>
                    </thead>
                    <tr>
                        <td>2018</td>
                        <td>广州恒大淘宝俱乐部</td>
                        <td>20</td>
                        <td>19</td>
                        <td>10</td>
                        <td>2</td>
                        <td>0</td>
                        <td>0</td>
                        <td>1</td>
                    </tr>
                </table>
            </div>
        </div>
        <%--荣誉记录--%>
        <div class=" player-honer player-item">
            <div class="player-honer-head player-item-head">
                <span>荣誉记录</span>
            </div>
            <div class="payer-honer-body">
                <table class="table" style="text-align: center">
                    <tr class="">
                        <td style="width: 20%">中国足球甲级联赛</td>
                        <td style="width: 10%">2012</td>
                        <td style="width: 70%"></td>
                    </tr>
                    <tr class="">
                        <td style="width: 30%">中国足球甲级联赛</td>
                        <td style="width: 10%">2012</td>
                        <td style="width: 70%"></td>

                    </tr>
                    <tr class="">
                        <td style="width: 30%">中国足球甲级联赛</td>
                        <td style="width: 10%">2012</td>
                        <td style="width: 70%"></td>

                    </tr>
                </table>
            </div>
        </div>
        <%--相关新闻--%>
        <div class=" player-article player-item">
            <div class="player-article-head player-item-head">
                <span>相关新闻</span>
            </div>
            <div class="player-article-body">
                <div class="left-article-list">
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
    </div>
    <div class="col-md-3">
        <%--综合能力--%>
        <div id="container" class="row" style="height: 400px;background-color: RGB(247, 247, 247);margin-bottom: 5px">
        </div>
        <%--队员--%>
        <div class="row">
            <div class="players">
                <div class="player-item-head">
                    <span>广州恒大淘宝队员</span>
                </div>
                <div class="players-body">
                    <table class="table">
                        <thead>
                        <tr class="success">
                            <td style="width: 30%">前锋</td>
                            <td style="width: 40%">进球</td>
                            <td style="width: 30%">国籍</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        </tbody>
                        <thead>
                        <tr class="success">
                            <td>中场</td>
                            <td>进球</td>
                            <td>国籍</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        </tbody>
                        <thead class="success">
                        <tr class="success">
                            <td>后卫</td>
                            <td>进球</td>
                            <td>国籍</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        </tbody>
                        <thead>
                        <tr class="success">
                            <td>门将</td>
                            <td>进球</td>
                            <td>国籍</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        <tr>
                            <td><img class="td-icon-img" src="img/club/china/p_alan.jpg" alt="">阿兰</td>
                            <td>2</td>
                            <td><img class="td-icon-img" src="img/country/china.png" alt=""></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>
