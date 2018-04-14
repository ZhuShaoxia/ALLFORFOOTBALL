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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/article-comment.js" type="text/javascript" charset="utf-8"></script>
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

        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a>中超</a></li>
                <li><a href="#">西甲</a></li>
                <li><a href="#">英超</a></li>
                <li><a href="#">意甲</a></li>
                <li><a href="#">法甲</a></li>
                <li><a href="#">德甲</a></li>
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
                        <tr class="active">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                            <td>2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>10</td>
                            <td>0</td>
                            <td>10</td>
                            <td>6</td>
                        </tr>
                        <tr class="success">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                            <td>2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>10</td>
                            <td>0</td>
                            <td>10</td>
                            <td>6</td>
                        </tr>
                        <tr class="warning">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                            <td>2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>10</td>
                            <td>0</td>
                            <td>10</td>
                            <td>6</td>
                        </tr>
                        <tr class="">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                            <td>2</td>
                            <td>0</td>
                            <td>0</td>
                            <td>10</td>
                            <td>0</td>
                            <td>10</td>
                            <td>6</td>
                        </tr>
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
                        <tr class="success">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-playerImg" src="${pageContext.request.contextPath}/img/club/china/p_alan.jpg">阿兰</a>
                            </td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                        </tr>
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
                        <tr class="success">
                            <td>1</td>
                            <td><a href="#"><img class="data-table-playerImg" src="${pageContext.request.contextPath}/img/club/china/p_alan.jpg">阿兰</a>
                            </td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a>
                            </td>
                            <td>2</td>
                        </tr>
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
                            <th style="width: 30%;text-align: left;padding-left: 20px"><a href="#">&lt;&nbsp;上一轮</a>
                            </th>
                            <th style="width: 40%;font-size:15px" colspan="2">第2轮</th>
                            <th style="width: 40%;text-align: right;padding-right: 20px"><a href="#">&gt;&nbsp;下一轮</a>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>1:5</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
                        <tr class="success">
                            <td>2018年03月16日09:31:18</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                            <td>:</td>
                            <td><a href="#"><img class="data-table-clubImg"
                                                 src="${pageContext.request.contextPath}/img/club/china/zc_shanggang.png">上海上港</a></td>
                        </tr>
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


