<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 13:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>当前轮播文章</legend>
            </fieldset>
            <div class="">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>文章标题</th>
                        <th>文章副标题</th>
                        <th>作者</th>
                        <th>发表时间</th>
                        <th>类型</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="articleCarouselTbody">
                    <c:forEach items="${articlesIsCarousel}" var="articleIsCarousel">
                        <tr>
                            <td>${articleIsCarousel.title}</td>
                            <td>${articleIsCarousel.subtitle}</td>
                            <td>${articleIsCarousel.user.name}</td>
                            <td>${articleIsCarousel.createTime}</td>
                            <td>${articleIsCarousel.articleType.type}</td>
                            <td align="center">
                                <button onclick="delTd(this,'${articleIsCarousel.id}')"
                                        class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">取消
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>最近两天发表文章</legend>
            </fieldset>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>文章标题</th>
                    <th>文章副标题</th>
                    <th>作者</th>
                    <th>发表时间</th>
                    <th>类型</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${articles}" var="article">
                    <tr>
                        <td>${article.title}</td>
                        <td>${article.subtitle}</td>
                        <td>${article.user.name}</td>
                        <td>${article.createTime}</td>
                        <td>${article.articleType.type}</td>
                        <td align="center">
                            <button onclick="setTd(this,'${article.id}')"
                                    class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">轮播展示设置
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/index.js"></script>
<script>
    function delTd(obj, id) {
        var $tr = $(obj).parent().parent();
        layui.use(['layer'], function () {
            layer.confirm('轮播展示取消，请确认', function (index) {
                layer.close(index);
                $.ajax({
                    data: {id: id, isCarousel: 0},
                    url: '/index/article/carousel/update',
                    success: function (data) {
                        location.reload();
//                        $tr.remove()
//                        layer.msg('删除成功')
                    },
                    error: function (data) {
                        layer.msg('后台请求出错,删除失败')
                    }
                })
            });
        })
    }

    function setTd(obj, id) {
        var length = $("#articleCarouselTbody").children().length;

        if (length >5) {
            layui.use(['layer'], function () {
                layer.msg('最大轮播数量为5，请先取消')
            })
            return false;
        }
        layui.use(['layer'], function () {
            layer.confirm('确认添加当前文章轮播', function (index) {
                layer.close(index);
                $.ajax({
                    data: {id: id, isCarousel: 1},
                    url: '/index/article/carousel/update',
                    success: function (data) {
//                        layer.msg('添加成功')
                        location.reload();
                    },
                    error: function (data) {
                        layer.msg('后台请求出错,删除失败')
                    }
                })
            });
        })
    }
</script>
</body>
</html>
