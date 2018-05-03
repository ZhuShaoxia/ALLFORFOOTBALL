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
                <legend>当前焦点比赛</legend>
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
                        <th>主场</th>
                        <th>客场</th>
                        <th>比赛日期</th>
                        <th>比赛时间</th>
                        <th>比赛性质</th>
                        <th>比赛状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="currentFocusMatchInfoTbody">
                    <c:forEach items="${currentFocusMatchInfos}" var="currentFocusMatchInfo">
                        <tr>
                            <td>${currentFocusMatchInfo.homeClub.name}</td>
                            <td>${currentFocusMatchInfo.awayClub.name}</td>
                            <td>${currentFocusMatchInfo.matchDate}</td>
                            <td>${currentFocusMatchInfo.matchTime}</td>
                            <td>${currentFocusMatchInfo.matchType.type}</td>
                            <td>${currentFocusMatchInfo.matchState.state}</td>
                            <td align="center">
                                <button onclick="delTd(this,'${currentFocusMatchInfo.id}')"
                                        class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">取消
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>最近两天比赛</legend>
            </fieldset>
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>主场</th>
                    <th>客场</th>
                    <th>比赛日期</th>
                    <th>比赛时间</th>
                    <th>比赛性质</th>
                    <th>比赛状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${matchInfos}" var="matchInfo">
                    <tr>
                        <td>${matchInfo.homeClub.name}</td>
                        <td>${matchInfo.awayClub.name}</td>
                        <td>${matchInfo.matchDate}</td>
                        <td>${matchInfo.matchTime}</td>
                        <td>${matchInfo.matchType.type}</td>
                        <td>${matchInfo.matchState.state}</td>
                        <td align="center">
                            <button onclick="setTd(this,'${matchInfo.id}')"
                                    class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">设为焦点比赛
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
            layer.confirm('真的删除行么', function (index) {
                layer.close(index);
                $.ajax({
                    data: {id: id, isFocus: 0},
                    url: '/index/match/focus/update',
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
        var length = $("#currentFocusMatchInfoTbody").children().length;

        if (length == 2) {
            layui.use(['layer'], function () {
                layer.msg('当前已经有两个焦点比赛，请先取消')
            })
            return false;
        }
        layui.use(['layer'], function () {
            layer.confirm('确认添加当前行为焦点比赛么', function (index) {
                layer.close(index);
                $.ajax({
                    data: {id: id, isFocus: 1},
                    url: '/index/match/focus/update',
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
