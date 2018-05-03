<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/27
  Time: 12:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <legend>比赛选择</legend>
            </fieldset>
            <form class="layui-form" action="" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="match-process-date" placeholder=" - "
                                   lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">比赛双方</label>
                        <div class="layui-input-inline">
                            <select id="matchInfoId" name="matchInfo.id" lay-search lay-verify="required"
                                    lay-filter="match-process-select">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                </div>

                <%--<div style="width: 50%;float: left">--%>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend id="homeClubLegend">主场</legend>
                </fieldset>
                <table class="layui-table homeClub-table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>比赛时刻</th>
                        <th>比赛事件</th>
                        <th>球员</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="homeClub-table-tbody">
                    <tr>
                        <td>1</td>
                        <td>
                            <%--隐藏域 matchInfoId matchClubId--%>
                            <input type="hidden" id="homeMatchProcess[0].club.id" name="homeMatchProcess[0].club.id"
                                   value="">
                            <%--隐藏域 matchInfoId matchClubId--%>
                            <input type="hidden" id="homeMatchProcess[0].matchInfo.id"
                                   name="homeMatchProcess[0].matchInfo.id"
                                   value="">
                            <%--比赛时刻--%>
                            <input id="homeMatchProcess[0].time" type="number" name="homeMatchProcess[0].time"
                                   lay-verify="required|verifyMatchTime"
                                   class="layui-input">
                        </td>
                        <td>
                            <%--比赛事件Id--%>
                            <select id="homeMatchProcess[0].matchEvent.id" name="homeMatchProcess[0].matchEvent.id"
                                    lay-search
                                    lay-verify="required"
                                    lay-filter="match-process-event-select">
                                <option value=""></option>
                                <option value="1">上场</option>
                                <option value="2">下场</option>
                                <option value="3">进球</option>
                                <option value="4">助攻</option>
                                <option value="5">点球</option>
                                <option value="6">点球未进</option>
                                <option value="7">乌龙球</option>
                                <option value="8">黄牌</option>
                                <option value="9">黄红牌</option>
                                <option value="10">红牌</option>
                            </select>
                        </td>
                        <td>
                            <%--比赛球员--%>
                            <select id="homeMatchProcess[0].player.id" name="homeMatchProcess[0].player.id" lay-search
                                    lay-verify="required"
                                    lay-filter="match-process-player-select">
                                <option value=""></option>
                            </select>
                        </td>
                        <td style="text-align: center">
                            <button type="button" onclick="appendTd('home',0,this)" class="layui-btn layui-btn-xs ">继续添加
                            </button>
                            <button type="button" onclick="deleteTd('home',0,this)"
                                    class="layui-btn layui-btn-xs layui-btn-danger">删除
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend id="awayClubLegend">客场</legend>
                </fieldset>

                <table class="layui-table awayClub-table">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>比赛时刻</th>
                        <th>比赛事件</th>
                        <th>球员</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="awayClub-table-tbody">
                    <tr>
                        <td>1</td>
                        <td>
                            <%--隐藏域 matchInfoId matchClubId--%>
                            <input type="hidden" id="awayMatchProcess[0].club.id" name="awayMatchProcess[0].club.id"
                                   value="">
                            <%--隐藏域 matchInfoId matchClubId--%>
                            <input type="hidden" id="awayMatchProcess[0].matchInfo.id"
                                   name="awayMatchProcess[0].matchInfo.id"
                                   value="">
                            <%--比赛时刻--%>
                            <input id="awayMatchProcess[0].time" type="number" name="awayMatchProcess[0].time"
                                   lay-verify="required|verifyMatchTime"
                                   class="layui-input">
                        </td>
                        <td>
                            <%--比赛事件Id--%>
                            <select id="awayMatchProcess[0].matchEvent.id" name="awayMatchProcess[0].matchEvent.id"
                                    lay-search
                                    lay-verify="required"
                                    lay-filter="match-process-event-select">
                                <option value=""></option>
                                <option value="1">上场</option>
                                <option value="2">下场</option>
                                <option value="3">进球</option>
                                <option value="4">助攻</option>
                                <option value="5">点球</option>
                                <option value="6">点球未进</option>
                                <option value="7">乌龙球</option>
                                <option value="8">黄牌</option>
                                <option value="9">黄红牌</option>
                                <option value="10">红牌</option>
                            </select>
                        </td>
                        <td>
                            <%--比赛球员--%>
                            <select id="awayMatchProcess[0].player.id" name="awayMatchProcess[0].player.id" lay-search
                                    lay-verify="required"
                                    lay-filter="match-process-player-select">
                                <option value=""></option>
                            </select>
                        </td>
                        <td style="text-align: center">
                            <button type="button" onclick="appendTd('away',0,this)" class="layui-btn layui-btn-xs ">继续添加
                            </button>
                            <button type="button" onclick="deleteTd('away',0,this)"
                                    class="layui-btn layui-btn-xs layui-btn-danger">删除
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="match-process-submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/match.js"></script>
</body>
</html>
<script>

    function appendTd(type, num, obj) {
        var matchInfoId = $("#matchInfoId").next().find('dd[class=layui-this]').attr('lay-value')
        var homeClubId = $("input[id='homeMatchProcess[0].club.id']").attr("value")
        var awayClubId = $("input[id='awayMatchProcess[0].club.id']").attr("value")
        if (homeClubId == "") {
            layui.use(['layer'], function () {
                layer.msg('请先选择比赛双方')
            })
            return false
        }
        if (type == 'home') {
            var length = $("#homeClub-table-tbody").children().length
            var html = "<tr>\n" +
                "                        <td>" + (length + 1) + "</td>\n" +
                "                        <td>\n" +
                "                            <input type=\"hidden\" id=\"homeMatchProcess[" + length + "].club.id\" name=\"homeMatchProcess[" + length + "].club.id\" value=\"" + homeClubId + "\">\n" +
                "                            <input type=\"hidden\" id=\"homeMatchProcess[" + length + "].matchInfo.id\" name=\"homeMatchProcess[" + length + "].matchInfo.id\"\n" +
                "                                   value=\"" + matchInfoId + "\">\n" +
                "                            <input id=\"homeMatchProcess[" + length + "].time\" type=\"number\" name=\"homeMatchProcess[" + length + "].time\"\n" +
                "                                   lay-verify=\"required|verifyMatchTime\"\n" +
                "                                   class=\"layui-input\">\n" +
                "                        </td>\n" +
                "                        <td>\n" +
                "                            <select id=\"homeMatchProcess[" + length + "].matchEvent.id\" name=\"homeMatchProcess[" + length + "].matchEvent.id\" lay-search\n" +
                "                                    lay-verify=\"required\"\n" +
                "                                    lay-filter=\"match-process-event-select\">\n" +
                "                                <option value=\"\"></option>\n" +
                "                                <option value=\"1\">上场</option>\n" +
                "                                <option value=\"2\">下场</option>\n" +
                "                                <option value=\"3\">进球</option>\n" +
                "                                <option value=\"4\">助攻</option>\n" +
                "                                <option value=\"5\">点球</option>\n" +
                "                                <option value=\"6\">点球未进</option>\n" +
                "                                <option value=\"7\">乌龙球</option>\n" +
                "                                <option value=\"8\">黄牌</option>\n" +
                "                                <option value=\"9\">黄红牌</option>\n" +
                "                                <option value=\"10\">红牌</option>\n" +
                "                            </select>\n" +
                "                        </td>\n" +
                "                        <td>\n" +
                "                            <select id=\"homeMatchProcess[" + length + "].player.id\" name=\"homeMatchProcess[" + length + "].player.id\" lay-search lay-verify=\"required\"\n" +
                "                                    lay-filter=\"match-process-player-select\">\n" +
                "                                <option value=\"\"></option>\n" +
                "" + generateHtml(type, homeClubId) + "" +
                "                            </select>\n" +
                "                        </td>\n" +
                "                        <td style=\"text-align: center\">\n" +
                "                            <button type=\"button\" onclick=\"appendTd('home'," + length + ",this)\" class=\"layui-btn layui-btn-xs \">继续添加\n" +
                "                            </button>\n" +
                "                            <button type=\"button\" onclick=\"deleteTd('home'," + length + ",this)\"\n" +
                "                                    class=\"layui-btn layui-btn-xs layui-btn-danger\">删除\n" +
                "                            </button>\n" +
                "                        </td>\n" +
                "                    </tr>"
            $("#homeClub-table-tbody").append(html);
        } else {
            var length = $("#awayClub-table-tbody").children().length
            var html = "<tr>\n" +
                "                        <td>" + (length + 1) + "</td>\n" +
                "                        <td>\n" +
                "                            <input type=\"hidden\" id=\"awayMatchProcess[" + length + "].club.id\" name=\"awayMatchProcess[" + length + "].club.id\" value=\"" + awayClubId + "\">\n" +
                "                            <input type=\"hidden\" id=\"awayMatchProcess[" + length + "].matchInfo.id\" name=\"awayMatchProcess[" + length + "].matchInfo.id\"\n" +
                "                                   value=\"" + matchInfoId + "\">\n" +
                "                            <input id=\"awayMatchProcess[" + length + "].time\" type=\"number\" name=\"awayMatchProcess[" + length + "].time\"\n" +
                "                                   lay-verify=\"required|verifyMatchTime\"\n" +
                "                                   class=\"layui-input\">\n" +
                "                        </td>\n" +
                "                        <td>\n" +
                "                            <select id=\"awayMatchProcess[" + length + "].matchEvent.id\" name=\"awayMatchProcess[" + length + "].matchEvent.id\" lay-search\n" +
                "                                    lay-verify=\"required\"\n" +
                "                                    lay-filter=\"match-process-event-select\">\n" +
                "                                <option value=\"\"></option>\n" +
                "                                <option value=\"1\">上场</option>\n" +
                "                                <option value=\"2\">下场</option>\n" +
                "                                <option value=\"3\">进球</option>\n" +
                "                                <option value=\"4\">助攻</option>\n" +
                "                                <option value=\"5\">点球</option>\n" +
                "                                <option value=\"6\">点球未进</option>\n" +
                "                                <option value=\"7\">乌龙球</option>\n" +
                "                                <option value=\"8\">黄牌</option>\n" +
                "                                <option value=\"9\">黄红牌</option>\n" +
                "                                <option value=\"10\">红牌</option>\n" +
                "                            </select>\n" +
                "                        </td>\n" +
                "                        <td>\n" +
                "                            <select id=\"awayMatchProcess[" + length + "].player.id\" name=\"awayMatchProcess[" + length + "].player.id\" lay-search lay-verify=\"required\"\n" +
                "                                    lay-filter=\"match-process-player-select\">\n" +
                "                                <option value=\"\"></option>\n" +
                "" + generateHtml(type, awayClubId) + "" +
                "                            </select>\n" +
                "                        </td>\n" +
                "                        <td style=\"text-align: center\">\n" +
                "                            <button type=\"button\" onclick=\"appendTd('away'," + length + ",this)\" class=\"layui-btn layui-btn-xs \">继续添加\n" +
                "                            </button>\n" +
                "                            <button type=\"button\" onclick=\"deleteTd('away'," + length + ",this)\"\n" +
                "                                    class=\"layui-btn layui-btn-xs layui-btn-danger\">删除\n" +
                "                            </button>\n" +
                "                        </td>\n" +
                "                    </tr>"
            $("#awayClub-table-tbody").append(html);
        }
        layui.use(['form'], function () {
            var form = layui.form
            form.render('select')
        })
    }

    function deleteTd(type, num, obj) {
        if (num == 0) {
            layui.use(['layer'], function () {
                layer.msg('您不能删除第一个')
            })
            return
        }
        var length
        if (type == 'home') {
            length = $("#homeClub-table-tbody").children().length
        } else {
            length = $("#awayClub-table-tbody").children().length
        }
        if (num != (length - 1)) {
            layui.use(['layer'], function () {
                layer.msg('请从后向前删')
            })
            return
        }
        $(obj).parent().parent().remove()
    }

    function generateHtml(type, clubId) {
        var html = ""
        $.ajax({
            data: {clubId: clubId},
            url: '/admin/player/searchPlayerByClubId',
            async: false,
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].name + "</option>"
                }
            }
        })
        return html
    }

</script>
