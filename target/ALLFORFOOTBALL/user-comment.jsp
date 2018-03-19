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
    <link rel="stylesheet" type="text/css" href="css/navbar_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-comment.css"/>


    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="js/user-comment.js" type="text/javascript" charset="utf-8"></script>

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
<script>
    $(function () {
        $("#comment-delete-btn").on('click', function () {
            console.log("2132")
            confirm("确定要删除该评论嘛")
        })
    })
</script>

<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid white">
                <li><a href="user-center.jsp">个人信息</a></li>
                <li class="active"><a href="user-comment.jsp">评论</a></li>
                <li><a href="user-article.jsp">我发表的文章</a></li>
                <li><a href="setting-profile.jsp">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row comment-head">
                <select name="comment-type" id="comment-type">
                    <option value="1">收到的评论</option>
                    <option value="2">发表的评论</option>
                </select>
                <%--<span>发表的评论</span>--%>
                <input type="text" placeholder="查找评论内容或评论人">
                <a href="#"><img src="img/search-icon.png"></a>
            </div>
            <div class="row comment-body">
                <%--收到的评论 别人回复的评论--%>
                <div class="container comment-item">
                    <div class="row">
                        <div class="col-md-1 comment-item-left">
                            <img src="img/club/spanish/laiwante-club.png" alt="请上传头像">
                        </div>
                        <div class="col-md-11 comment-item-right">
                            <div class="comment-item-right-user">
                                <strong id="comment-reply-user">少侠我姓朱</strong>
                                <span class="close" onclick="deleteComment()">X</span>
                            </div>
                            <div class="comment-item-right-time">
                                <span>2018年03月17日13:15:56</span>
                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>
                            </div>
                            <div class="comment-item-right-comment">
                                <span>回复@<a href="">朱晓磊</a>:</span>
                                <%--限制内容长度--%>
                                <p>
                                    关关雎鸠，在河之洲。窈窕淑女，君子好逑。
                                    参差荇菜，左右流之。窈窕淑女，寤寐求之。
                                    求之不得，寤寐思服。悠哉悠哉，辗转反侧。
                                    参差荇菜，左右采之。窈窕淑女，琴瑟友之。
                                    参差荇菜，左右芼之。窈窕淑女，钟鼓乐之。
                                </p>
                            </div>
                            <div class="comment-item-right-article">
                                <a href="#">
                                    <span class="theme">回复我的评论:</span>
                                    <span class="content">XXXXXXXXX</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="comment-item-bottom row ">
                        <button id="reply-btn" type="button" class="btn btn-danger btn-block" data-toggle="collapse"
                                data-target="#demo">
                            回复这个回复你的人
                        </button>
                    </div>
                    <div id="demo" class="collapse out row comment-item-bottom-reply">
                        <div class="col-md-1 comment-item-bottom-reply-left">
                            <img src="img/head-img-icon.png" alt="">
                        </div>
                        <div class="col-md-11 comment-item-bottom-reply-right">
                            <input data-content="评论内容不能为空，请输入评论" id="reply-content-input" type="text"
                                   placeholder="回复@少侠我姓朱:">
                            <button id="reply-content-btn" class="btn btn-danger">评论</button>
                        </div>
                    </div>
                </div>
                <%--发表的评论_1 评论--%>
                <div class="comment-item">
                    <div class="col-md-1 comment-item-left">
                        <img src="img/head-img-icon.png" alt="请上传头像">
                    </div>
                    <div class="col-md-11 comment-item-right">
                        <div class="comment-item-right-user">
                            <strong>少侠我姓朱</strong>
                            <span id="comment-delete-btn" class="close">X</span>
                        </div>
                        <div class="comment-item-right-time">
                            <span>2018年03月17日13:15:56</span>
                            <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>
                        </div>
                        <div class="comment-item-right-comment">
                            <%--限制内容长度--%>
                            <p>
                                关关雎鸠，在河之洲。窈窕淑女，君子好逑。
                                参差荇菜，左右流之。窈窕淑女，寤寐求之。
                                求之不得，寤寐思服。悠哉悠哉，辗转反侧。
                                参差荇菜，左右采之。窈窕淑女，琴瑟友之。
                                参差荇菜，左右芼之。窈窕淑女，钟鼓乐之。
                            </p>
                        </div>
                        <div class="comment-item-right-article">
                            <a href="#">
                                <span class="theme">评论@Author的文章:</span>
                                <span class="content">XXXXXXXXX</span>
                            </a>
                        </div>
                    </div>
                </div>

                <%--&lt;%&ndash;发表的评论_2 回复评论的评论&ndash;%&gt;--%>
                <%--<div class="comment-item">--%>
                <%--<div class="col-md-1 comment-item-left">--%>
                <%--<img src="img/head-img-icon.png" alt="请上传头像">--%>
                <%--</div>--%>
                <%--<div class="col-md-11 comment-item-right">--%>
                <%--<div class="comment-item-right-user">--%>
                <%--<strong>少侠我姓朱</strong>--%>
                <%--<span id="comment-delete-btn" class="close">X</span>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-time">--%>
                <%--<span>2018年03月17日13:15:56</span>--%>
                <%--<span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-comment">--%>
                <%--<p>回复@<a href="">朱晓磊</a>:</p>--%>
                <%--&lt;%&ndash;限制内容长度&ndash;%&gt;--%>
                <%--<p>--%>
                <%--关关雎鸠，在河之洲。窈窕淑女，君子好逑。--%>
                <%--参差荇菜，左右流之。窈窕淑女，寤寐求之。--%>
                <%--求之不得，寤寐思服。悠哉悠哉，辗转反侧。--%>
                <%--参差荇菜，左右采之。窈窕淑女，琴瑟友之。--%>
                <%--参差荇菜，左右芼之。窈窕淑女，钟鼓乐之。--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--<div class="comment-item-right-article">--%>
                <%--<a href="#">--%>
                <%--<span class="theme">回复@<a href="">朱晓磊</a>的评论:</span>--%>
                <%--<span class="content">XXXXXXXXX</span>--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>

            </div>
        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="js/head.js"></script>
