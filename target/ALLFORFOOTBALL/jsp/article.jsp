<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/article.css"/>

    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css"/>--%>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <%--评论--%>
    <script src="${pageContext.request.contextPath}/js/article-comment.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<%--导航栏--%>
<%@include file="head.jsp" %>

<%--文章--%>
<div class="container">
    <div class="row">
        <ol class="breadcrumb" style="margin-bottom: 0px">
            <li><a href="/">首页</a></li>
            <li><a href="/articles">文章列表</a></li>
            <li class="active">${article.subtitle}</li>
        </ol>
    </div>
</div>
<div class="container">
    <div class="row page-header" style="margin-top: 0px">
        <h1>${article.title}</h1>
        <strong>Author:${article.user.nickname}</strong>
        <small style="margin-left: 40px;">${article.createTime}</small>
    </div>
    <div class="row page-content" id="page-content">
        ${article.editorValue}
    </div>
</div>
<%--评论部分--%>
<div class="container page-comment">
    <c:if test="${article.commentList==null}">
        <div class="comment-null">当前评论内容为空，快来评论区发表你的看法~</div>
    </c:if>
    <div class="page-comment-list" id="page-comment-list">
        <c:forEach items="${article.commentList}" var="comment" varStatus="sts">
            <div class="row page-comment-item" id="comments[${sts.count}]">
                <div class="col-md-1 head-img" style="text-align: center;">
                    <img id="comments[${sts.count}].headImg" src="${comment.user.imgUrl}" class="img-fluid"/>
                    <p>${sts.count}楼</p>
                    <input type="hidden" id="floorUserId[${sts.count}]" value="${comment.user.id}">
                </div>
                <input type="hidden" id="checkUser" value="${user.id}">
                <div class="col-md-9">
                    <c:if test="${sts.current.replyFloor!=null}">
                        <blockquote>
                            <span>回复<span class="reply-floor">${comment.replyFloor}</span>楼:@<a id="replyUserInfoA"
                                                                                                href="/user/info/${comment.replyUser.id}">${comment.replyUser.nickname}</a></span>
                            <p>${comment.replyContent}</p>
                        </blockquote>
                    </c:if>
                    <h5>
                        <a id="comments[${sts.count}].username"
                           href="/user/info/${comment.user.id}">${comment.user.nickname}</a>
                    </h5>
                    <div class="comment">
                        <p id="comments[${sts.count}].comment">${comment.content}</p>
                    </div>
                    <h5 style="border-top: 1px dashed grey;padding: 5px;">
                        <img class="comment-time-img" src="/img/time-logo.png" class="img-fluid"/>
                        <span class="comment-time">${comment.createTime}</span>
                        <span class="comment-reply" onclick="replay(${sts.count})">回复</span>
                    </h5>
                </div>
            </div>
        </c:forEach>
    </div>

    <%--评论内容输入区--%>
    <div class="page-comment-input">
        <%
            if (user == null) {
        %>
        <div style="text-align: center;padding-right: 42%;padding-top: 60px;">
            <p style="color: black">请您<a href="/register">【注册登录】</a>后发表评论</p>
        </div>
        <%
        } else {
        %>
        <div>
            <div class="container reply" style="width: 30%;float: left;display: none">
                <button type="button" class="btn close" data-toggle="popover" data-trigger="hover" data-content="取消回复"
                        data-placement="right"
                        onclick="closeReply()">&times;
                </button>
                <span>回复<span class="reply-floor" id="reply-floor"></span>楼:@<a href="" class="reply-username"
                                                                                id="reply-username"></a></span>
            </div>
            <textarea name="page-comment-content" id="comment-textarea" placeholder="写下你的评论..."></textarea>
            <button id="commentBtn" class="btn btn-danger pull-right">评论</button>
        </div>
        <%
            }
        %>


    </div>
</div>
<%--底部--%>
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script>
    $(function () {
        var commentNum = $("#page-comment-list").children().length
        var i = $("#page-comment-list").children().length

        var articleId = "${article.id}"
        var userId = "${user.id}"

        var userName = '${user.name}'

        $("#commentBtn").on('click', function () {
            var commentContent = $("#comment-textarea").val()
            if(userName==''){
                alert('请先补全用户信息')
                window.location.href="/user/setting/info"
                return;
            }
            if (!validate(commentContent.trim())) {
                alert("请输入评论内容")
                return;
            }
            var floorUserId = $("input[id='floorUserId[" + commentNum + "]'").val()
            var currentNum = commentNum + 1
            $("#comment-textarea").val("");
            var commentTime = new Date().Format("yyyy-MM-dd HH:mm:ss")
            var commentHtml = "<div class=\"row page-comment-item\" id=\"comments[" + currentNum + "]\">\n" +
                "            <div class=\"col-md-1 head-img\" style=\"text-align: center;\">\n" +
                "                <img id=\"comments[" + currentNum + "].headImg\" src=\"${user.imgUrl}\" class=\"img-fluid\"/>\n" +
                "                <p>" + (commentNum + 1) + "楼</p>\n" +
                "            </div>" +
                "<input type=\"hidden\" id=\"floorUserId[" + currentNum + "]\" value=\"${user.id}\">" +
                "            <div class=\"col-md-9\">\n"

            var replyFloor = $("#reply-floor").text().trim();
            if (validate(replyFloor)) {
                var replyUsername = $("#reply-username").text().trim()
                replyFloor = parseInt(replyFloor);
                var replyCommentContent = $("p[id='comments[" + replyFloor + "].comment']").text();
                if (replyCommentContent.length > 100) {
                    replyCommentContent = replyCommentContent.substr(0, 100);
                    replyCommentContent += "[略略略...]";
                }
                commentHtml = commentHtml.concat("<blockquote>\n" +
                    "                    <span>回复<span class=\"reply-floor\">" + replyFloor + "</span>楼:@<a href=\"/user/info/" + floorUserId + "\">" + replyUsername + "</a></span>\n" +
                    "                    <p>" + replyCommentContent + "</p>\n" +
                    "                </blockquote>\n")

            }
            commentHtml = commentHtml.concat("<h5>\n" +
                "                                 <a id=\"comments[" + currentNum + "].username\" href=\"/user/info/${user.id}\">" + '${user.nickname}' + "</a>\n" +
                "                             </h5>\n" +
                "                <div class=\"comment\">\n" +
                "                    <p id=\"comments[" + currentNum + "].comment\">" + commentContent + "</p>\n" +
                "                </div>\n" +
                "                <h5 style=\"border-top: 1px dashed grey;padding: 5px;\">\n" +
                "                    <img class=\"comment-time-img\" src=\"/img/time-logo.png\" class=\"img-fluid\"/><span class=\"comment-time\">" + commentTime + "</span>\n" +
                "                    <span class=\"comment-reply\" onclick=\"replay(" + currentNum + ")\">回复</span>\n" +
                "                </h5>\n" +
                "            </div>\n" +
                "        </div>")

            if (commentNum == 0) {
                $(".comment-null").fadeOut();
                $("#page-comment-list").append(commentHtml);
            } else {
                $("div[id='comments[" + i + "]").after(commentHtml);
                i++;
            }
            //存入数据库
            commentNum++;
            closeReply()
            var replyCon = $("p[id='comments[" + replyFloor + "].comment']").text();
            $.ajax({
                data: {
                    "article.id": articleId,
                    "user.id": userId,
                    "replyUser.id": floorUserId,
                    floor: currentNum,
                    content: commentContent,
                    replyFloor: replyFloor,
                    replyContent: replyCon
                },
                url: '/comment/add',
                success: function (res) {
                    if (res.code == '-1') {
                        alert('评论发表失败')
                    }
                },
                error: function () {
                    alert('后台请求出错')
                }
            })
        })

    })
</script>