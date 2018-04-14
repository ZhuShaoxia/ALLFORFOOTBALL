<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/16
  Time: 10:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/data-compare.css"/>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<!--导航栏-->
<%@include file="head.jsp" %>

<div class="container userinfo">
    <div class="row"></div>
    <div id="data-compare-body" class="row data-compare-body">

    </div>
    <div class="row">
        <div id="box_bg">
            <div id="container">
                <div id="green" class="line"></div>
                <div id="red" class="line"></div>
                <div id="white" class="line"></div>
                <div id="vs"></div>
            </div>
        </div>
        <div style="width:440px; margin:0px auto;">
            <div id="aa2" class="scope">正方<span id="aa"></span>票</div>
            <div id="bb2" class="scope">反共<span id="bb"></span>票</div>
            <div id="all2" class="scope">总共<span id="all"></span>票</div>
        </div>
    </div>
</div>
</div>


<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script type="text/javascript">
    var node = [
        30, "男性", 25,
        70, "女性", 75,
        10, "60后", 15,
        20, "70后", 15,
        25, "80后", 25,
        40, "90后", 35,
        5, "其他年龄", 10,
        20, "未婚", 25,
        80, "已婚", 75,
        65, "有驾照", 73,
        35, "无驾照", 27,
        88, "有车", 72,
        12, "无车", 28,
        60, "有房", 55,
        40, "无房", 45,
    ]
    var col;
    var a = 0, b = 0
    for (var i = 0; i < node.length; i += 3) {
        col = 'rgb(' + parseInt(( Math.random() * 200 + 55 ), 10) + ',' +
            parseInt(( Math.random() * 200 + 55 ), 10) + ',' +
            parseInt(( Math.random() * 250 + 5 ), 10) + ')';

        var skill = document.createElement('div');
        skill.className = 'skill';
        $("#data-compare-body").append(skill);
        var clearfix1 = document.createElement('div');
        clearfix1.className = 'skillbar1 clearfix';
        $(clearfix1).attr("data-percent", node[i] + "%")
        skill.appendChild(clearfix1);

        var bar1 = document.createElement('div');
        bar1.className = 'skillbar1-bar1';
        bar1.style.background = col;
        clearfix1.appendChild(bar1);

        var percent1 = document.createElement('div');
        percent1.className = 'skill-bar-percent1';
        percent1.textContent = node[i] + '%';
        clearfix1.appendChild(percent1);

        var title = document.createElement('div');
        title.className = 'skillbar-title';
        title.style.background = col;
        title.innerHTML = '<span>' + node[i + 1] + '</span>';
        skill.appendChild(title);

        var clearfix = document.createElement('div');
        clearfix.className = 'skillbar clearfix';
        $(clearfix).attr("data-percent", node[i + 2] + "%");
        skill.appendChild(clearfix);

        var bar = document.createElement('div');
        bar.className = 'skillbar-bar';
        bar.style.background = col;
        clearfix.appendChild(bar);

        var percent = document.createElement('div');
        percent.className = 'skill-bar-percent';
        percent.textContent = node[i + 2] + '%';
        clearfix.appendChild(percent);
//        console.log("a=" + node[i])
        a += node[i]
        b += node[i + 2]
    }
    $(function () {
        $('.skillbar').each(function () {
            $(this).find('.skillbar-bar').animate({
                width: $(this).attr('data-percent')
            }, 2000);
        });
    });

    $(function () {
        $('.skillbar1').each(function () {
            $(this).find('.skillbar1-bar1').animate({
                width: $(this).attr('data-percent')
            }, 2000);
        });
    });

    //    最终结果对比
    $(function () {
        var a = 600;
        var b = 300;
        console.log()
        $("#white").animate({width: 0, left: "250px"}, 1000, function () {
            $("#vs").fadeIn("slow", function () {
                $("#all").html(a + b);
                $("#aa").html(a);
                $("#bb").html(b);
                var newLeft = a / (a + b) * 325 -15 + "px"; //20为vs 的一半
//                var newLeft = a - (a + b) / 2 + "px"; //20为vs 的一半
                $("#vs").animate({left: newLeft}, 1000);
                $("#red").animate({width: newLeft}, 1000);
            });
        });
    })

</script>