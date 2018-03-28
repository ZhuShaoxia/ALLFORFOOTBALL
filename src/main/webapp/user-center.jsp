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
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>

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

    .modal input {
        width: 200px;
    }

    /*侧边导航栏颜色*/
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
        background-color: #8bfdff;
    }

</style>
<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li class="active"><a href="user-center.jsp">个人信息</a></li>
                <li><a href="user-comment.jsp">评论</a></li>
                <li><a href="user-article.jsp">我发表的文章</a></li>
                <li><a href="setting-profile.jsp">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="col-md-10">
                <div class="userinfo-head" style="padding-left: 30px">
                    <img src="img/head-img-icon.png" alt="" style="width: 50px;height: 50px;margin-bottom: 13px">
                    <!--昵称-->
                    <h1 style="display: inline-block">少侠我姓朱</h1>
                </div>
                <div class="userinfo-edit-fileds">
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">姓名</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <!--姓名-->
                            <span>朱晓磊</span>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">性别</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>男</span>
                        </div>
                    </div>

                    <div class="userinfo-edit-item">
                        <!--邮箱-->
                        <span class="col-md-2">邮箱</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>zhu_xl@hisuntech.com</span>
                        </div>
                    </div>

                    <div class="userinfo-edit-item">
                        <span class="col-md-2">主队</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span><img src="img/club/spanish/fcb_club.png" style="margin-bottom: 3px">&nbsp;巴塞罗那</span>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2">简介</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <span>It's My Life  </span>
                        </div>
                    </div>
                    <div class="userinfo-edit-item">
                        <span class="col-md-2" style="font-size: 15px">注册时间</span>
                        <div class="col-md-8 userinfo-edit-item-right">
                            <p style="font-size: 18px;color: #ff3b59;">2018年02月01日21:43:40</p>
                        </div>
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
