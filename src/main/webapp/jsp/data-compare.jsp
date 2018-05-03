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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/head.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/flotr2.min.js" type="text/javascript" charset="utf-8"></script>


    <%--下拉框--%>
    <link href="${pageContext.request.contextPath}/css/select2.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/select2.min.js"></script>

    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>

<body>
<script>
    $(function () {
        basic_radar(container)
    })

    function basic_radar(container) {
        var
            s1 = {label: '${playerLeft.name}', data: [[0, ${playerLeft.speed}], [1, ${playerLeft.shooting}], [2, ${playerLeft.pass}], [3, ${playerLeft.dribbling}], [4, ${playerLeft.defensive}], [5, ${playerLeft.power}]]},
            s2 = {label: '${playerRight.name}', data: [[0, ${playerRight.speed}], [1, ${playerRight.shooting}], [2, ${playerRight.pass}], [3, ${playerRight.dribbling}], [4, ${playerRight.defensive}], [5, ${playerRight.power}]]},
            graph, ticks;

        // Radar Labels
        ticks = [
            [0, "速度"],
            [1, "射门"],
            [2, "传球"],
            [3, "盘带"],
            [4, "防守"],
            [5, "力量"],
        ];

        // Draw the graph.
        graph = Flotr.draw(container, [s1, s2], {
            title: '综合能力',
            fontSize: '15',
            radar: {show: true},
            grid: {circular: true, minorHorizontalLines: true},
            yaxis: {min: 0, max: 100, minorTickFreq: null},
            xaxis: {ticks: ticks, showLabels: true},
            mouse: {track: true}
        });
    }

</script>
<!--导航栏-->
<%@include file="head.jsp" %>

<div class="container userinfo">
    <div class="row comp-item">
        <table class="table">
            <tbody>
            <tr>
                <td style="width: 33.3%;align:center;padding-top: 30px;padding-left: 40px">
                    <span style="font-size: 25px">FOOTPLAYER-数据对比</span>
                </td>
                <td style="width: 33.3%">
                    <div class="col-md-4">
                        <div class="form-group">
                            <select id="playerSelect1" class="form-control selectPlayer">

                            </select>
                        </div>
                    </div>
                    <div class="col-md-4" style="text-align: center"><h3>VS</h3></div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <select id="playerSelect2" class="form-control selectPlayer">

                            </select>
                        </div>
                    </div>
                </td>
                <td style="width: 33.3%;padding: 20px">
                    <button id="dataCompareBtn" class="btn btn-success">数据对比</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row comp-item" style="height: 320px;">
        <div class="col-md-4" style="padding-left:50px;padding-top: 50px">
            <div class="col-md-6">
                <img style="width: 140px;height: 140px" src="${playerLeft.imgUrl}" alt="${playerLeft.name}">
            </div>
            <div class="col-md-6" style="padding-top: 20px;text-align: center;font-size: 20px">
                <p>${playerLeft.name}</p>
                <p>${playerLeft.otherName}</p>
                <p>${playerLeft.number}号 ${playerLeft.playerPosition.position}</p>
                <p>${playerLeft.height}CM</p>
            </div>
        </div>
        <div class="col-md-4">
            <div id="container"
                 style="height: 300px;background-color: RGB(240, 247, 247);margin-bottom: 5px;margin-top: 10px"></div>
        </div>
        <div class="col-md-4" style="padding-right:50px;padding-top: 50px">
            <div class="col-md-6" style="padding-top: 20px;text-align: center;font-size: 20px">
                <p>${playerRight.name}</p>
                <p>${playerRight.otherName}</p>
                <p>${playerRight.number}号 ${playerRight.playerPosition.position}</p>
                <p>${playerRight.height}CM</p>
            </div>
            <div class="col-md-6">
                <img style="width: 140px;height: 140px" src="${playerRight.imgUrl}" alt="${playerRight.name}">
            </div>
        </div>
    </div>
    <div id="data-compare-body" class="row data-compare-body"></div>
</div>
</div>


<!--底部-->
<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<script type="text/javascript">
    var node = [
        5, "进球", 10,
        20, "助攻", 25,
        80, "点球", 75,
        65, "黄牌", 73,
        35, "红牌", 27,
        88, "乌龙球", 72,
        ${playerLeft.speed}, "速度", ${playerRight.speed},
        ${playerLeft.shooting}, "射门", ${playerRight.shooting},
        ${playerLeft.pass}, "传球", ${playerRight.pass},
        ${playerLeft.dribbling}, "盘带", ${playerRight.dribbling},
        ${playerLeft.defensive}, "防守", ${playerRight.defensive},
        ${playerLeft.power}, "力量", ${playerRight.power}
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
                var newLeft = a / (a + b) * 325 - 15 + "px"; //20为vs 的一半
//                var newLeft = a - (a + b) / 2 + "px"; //20为vs 的一半
                $("#vs").animate({left: newLeft}, 1000);
                $("#red").animate({width: newLeft}, 1000);
            });
        });
    })

</script>
<script>
    $(function () {
        $(".selectPlayer").select2({
            placeholder: '球员选择',
            ajax: {
                url: '/player/searchSelect2Player',
                dataType: 'json',
                data: function (params) {
                    return {
                        search: params.term, // search term 请求参数 ， 请求框中输入的参数
                        page: params.page
                    };
                },
                delay: 400,
                processResults: function (data, params) {
                    //返回的选项必须处理成以下格式
                    //var results =  [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];
                    var results = data
                    return {
                        results: results  //必须赋值给results并且必须返回一个obj
                    };
                },
                cache: true
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });

        $("#dataCompareBtn").on('click', function () {
            var p1 = $("#playerSelect1").select2("val")
            var p2 = $("#playerSelect2").select2("val")
            if (p1 == null || p2 == null) {
                alert('请选择比较双方')
                return false;
            }
            if (p1 == p2) {
                alert('请选择不同的双方')
                return false;
            }
            window.location.href="/compare?playerLeftId="+p1+"&playerRightId="+p2
        })

    })
</script>