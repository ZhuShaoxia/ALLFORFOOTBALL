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
    <link rel="stylesheet" type="text/css" href="css/game-list.css"/>

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
            <div class="game-head">
                <span>比赛列表</span>
                <input type="date" placeholder="选择比赛日">
            </div>
            <div class="game-list">
                <%--数据加载动图--%>
                <%--<div id="loading-img" class="loading">--%>
                <%--<img src="img/loading.gif" alt="">--%>
                <%--</div>--%>
                <%--数据为空--%>
                <%--<div class="list-null">--%>
                    <%--<img src="img/data-null.png" alt="">--%>
                <%--</div>--%>
                <div class="game-item">
                    <div class="game-item-head">
                        <strong>2018-03-21 周三</strong>
                    </div>
                    <div>
                        <table class="table table-hover">
                            <tr>
                                <%--TODO:注意比赛状态--%>
                                <td>完结</td>
                                <td>中超</td>
                                <td><a href="">上海上港</a></td>
                                <td>4:5</td>
                                <td><a href="">重庆思维</a></td>
                                <td><a href="">比赛集锦</a></td>
                            </tr>
                            <tr>
                                <td>21:54</td>
                                <td>中超</td>
                                <td>上海上港</td>
                                <td>VS</td>
                                <td>重庆思维</td>
                                <td>比赛集锦</td>
                            </tr>
                            <tr>
                                <td>21:54</td>
                                <td>中超</td>
                                <td>上海上港</td>
                                <td>VS</td>
                                <td>重庆思维</td>
                                <td>比赛集锦</td>
                            </tr>
                        </table>
                    </div>
                </div>

                    <div class="game-item">
                        <div class="game-item-head">
                            <strong>2018-03-21 周三</strong>
                        </div>
                        <div>
                            <table class="table table-hover">
                                <tr>
                                    <%--TODO:注意比赛状态--%>
                                    <td>完结</td>
                                    <td>中超</td>
                                    <td><a href="">上海上港</a></td>
                                    <td>4:5</td>
                                    <td><a href="">重庆思维</a></td>
                                    <td><a href="">比赛集锦</a></td>
                                </tr>
                                <tr>
                                    <td>21:54</td>
                                    <td>中超</td>
                                    <td>上海上港</td>
                                    <td>VS</td>
                                    <td>重庆思维</td>
                                    <td>比赛集锦</td>
                                </tr>
                                <tr>
                                    <td>21:54</td>
                                    <td>中超</td>
                                    <td>上海上港</td>
                                    <td>VS</td>
                                    <td>重庆思维</td>
                                    <td>比赛集锦</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="game-item">
                        <div class="game-item-head">
                            <strong>2018-03-21 周三</strong>
                        </div>
                        <div>
                            <table class="table table-hover">
                                <tr>
                                    <%--TODO:注意比赛状态--%>
                                    <td>完结</td>
                                    <td>中超</td>
                                    <td><a href="">上海上港</a></td>
                                    <td>4:5</td>
                                    <td><a href="">重庆思维</a></td>
                                    <td><a href="">比赛集锦</a></td>
                                </tr>
                                <tr>
                                    <td>21:54</td>
                                    <td>中超</td>
                                    <td>上海上港</td>
                                    <td>VS</td>
                                    <td>重庆思维</td>
                                    <td>比赛集锦</td>
                                </tr>
                                <tr>
                                    <td>21:54</td>
                                    <td>中超</td>
                                    <td>上海上港</td>
                                    <td>VS</td>
                                    <td>重庆思维</td>
                                    <td>比赛集锦</td>
                                </tr>
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
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/data.js"></script>


