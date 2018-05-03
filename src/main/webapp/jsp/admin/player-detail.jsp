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
                <legend>球员基本信息录入</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">球员面貌</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg" src="${player.imgUrl}">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="id" value="${player.id}">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">球员姓名</label>
                            <%--<input value="${player.name}" type="text" name="name" lay-verify="required"--%>
                                   <%--autocomplete="off"--%>
                                   <%--class="layui-input">--%>
                                <label class="layui-form-label">球员姓名</label>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">外文名</label>
                        <div class="layui-input-inline">
                            <input value="${player.otherName}" type="text" name="otherName" lay-verify="required"
                                   autocomplete="off" placeholder=""
                                   class="layui-input">
                            <span>${player.otherName}</span>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="clubId" class="layui-form-label">主队</label>
                        <div class="layui-input-inline">
                            <select id="countryId" name="club.country.id" lay-search lay-filter="countrySelect">
                                <option value="0"></option>
                                <c:forEach items="${countries}" var="country">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select id="clubId" name="club.id" lay-search lay-filter="clubSelect">
                                <c:forEach items="${clubs}" var="club">
                                    <option value="${club.id}">${club.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="playerPositionId" class="layui-form-label">位置</label>
                        <div class="layui-input-inline">
                            <select id="playerPositionId" name="playerPosition.id" lay-verify="required">
                                <option value="0"></option>
                                <c:forEach items="${playerPositions}" var="playerPosition">
                                    <option value="${playerPosition.id}">${playerPosition.position}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="number" class="layui-form-label">号码</label>
                        <div class="layui-input-inline">
                            <input value="${player.number}" id="number" type="number" name="number"
                                   lay-verify="required" autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="country" class="layui-form-label">国籍</label>
                        <div class="layui-input-inline">
                            <input value="${player.country}" id="country" type="text" name="country"
                                   lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="birthday" class="layui-form-label">生日</label>
                        <div class="layui-input-inline">
                            <input value="${player.birthday}" name="birthday" type="text" class="layui-input"
                                   id="birthday" lay-verify="required">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="age" class="layui-form-label">年龄</label>
                        <div class="layui-input-inline">
                            <input value="${player.age}" id="age" type="number" name="age" lay-verify=""
                                   autocomplete="off"
                                   class="layui-input"
                                   disabled>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="height" class="layui-form-label">身高</label>
                        <div class="layui-input-inline">
                            <input value="${player.height}" id="height" type="number" name="height"
                                   lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入(单位cm)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="weight" class="layui-form-label">体重</label>
                        <div class="layui-input-inline">
                            <input value="${player.weight}" id="weight" type="number" name="weight"
                                   lay-verify="required" autocomplete="off"
                                   class="layui-input" placeholder="请输入(单位kg)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="usualFoot" class="layui-form-label">惯用脚</label>
                        <div class="layui-input-inline">
                            <select id="usualFoot" name="usualFoot">
                                <option value="1">左脚</option>
                                <option value="2">右脚</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="power" class="layui-form-label">力量</label>
                        <div class="layui-input-inline">
                            <input value="${player.power}" id="power" type="number" name="power"
                                   lay-verify="required|maxLength"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="speed" class="layui-form-label">速度</label>
                        <div class="layui-input-inline">
                            <input value="${player.speed}" id="speed" type="number" name="speed"
                                   lay-verify="required|maxLength"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="shooting" class="layui-form-label">射门</label>
                        <div class="layui-input-inline">
                            <input value="${player.shooting}" id="shooting" type="number" name="shooting"
                                   lay-verify="required|maxLength" autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="pass" class="layui-form-label">传球</label>
                        <div class="layui-input-inline">
                            <input value="${player.pass}" id="pass" type="number" name="pass"
                                   lay-verify="required|maxLength"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label for="dribbling" class="layui-form-label">盘带</label>
                        <div class="layui-input-inline">
                            <input value="${player.dribbling}" id="dribbling" type="number" name="dribbling"
                                   lay-verify="required|maxLength"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label for="defensive" class="layui-form-label">防守</label>
                        <div class="layui-input-inline">
                            <input value="${player.defensive}" id="defensive" type="number" name="defensive"
                                   lay-verify="required|maxLength"
                                   autocomplete="off"
                                   class="layui-input" placeholder="请输入(最大100)">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="player-update-submit">更新球员信息</button>
                        <a class="layui-btn layui-btn-primary" href="/admin/player/list">返回上一步</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/player.js"></script>
</body>
</html>
<script>
    $(function () {
        layui.use('form', function () {
            var form = layui.form
            //惯用脚
            $('select[name=usualFoot]').children().each(function (index, item) {
                if ($(item).val() == "${player.usualFoot}") {
                    $(item).prop("selected", true);
                    form.render('select')
                    return
                }
            })
            //位置
            $('#playerPositionId').children().each(function (index, item) {
                if ($(item).val() == "${player.usualFoot}") {
                    $(item).prop("selected", true);
                    form.render('select')
                    return
                }
            })


            //国家
            $("#countryId").children().each(function (index, item) {
                if ($(item).val() == "${player.club.country.id}") {
                    $(item).prop("selected", true);
                    form.render('select')
                    return
                }
            })
            //俱乐部
            $("#clubId").children().each(function (index, item) {
                    if ($(item).val() == "${player.club.id}") {
                        $(item).prop("selected", true);
                        form.render('select')
                        return
                    }
                }
            )
        })

//        layui.use('form', function () {
//            var form = layui.form
//            var $select = $("select[name='club.id']")
//            var $input = $select.next().find("input");
//            var $dl = $select.next().find("dl");
//            $input.on('keyup', function () {
//                $dl.children().removeAttr('class')
//                var condition = $input.val()
//                $select.empty()
//                $dl.empty()
//                var selectHtml = "<option value='0'></option>"
//                var dlHtml = "<dd lay-value='0' class></dd>"
//                $.ajax({
//                    url: '/club/search/condition/string',
//                    data: {condition: condition},
//                    async: false,
//                    success: function (data) {
//                        for (var i = 0; i < data.length; i++) {
//                            selectHtml += "<option value='" + data[i].id + "'>" + data[i].name + "</option>"
//                            dlHtml += "<dd lay-value='" + data[i].id + "'>" + data[i].name + "</dd>"
//                        }
//                        $select.append(selectHtml)
//                        $dl.append(dlHtml)
//
//                    }
//                })
//                $dl.find("dd").on('click', function () {
//                    $dl.children().removeAttr('class')
//                    $(this).attr('class', 'layui-this')
//                    var value = $(this).attr('lay-value')
//                    $select.children("option[value=" + value + "]").attr("selected", true);
//                    var clubName = $(this).text()
//                    $input.removeAttr('placeHolder')
//                    $input.attr('placeHolder', clubName)
//                })
//            })
//
//        })
    })
</script>
