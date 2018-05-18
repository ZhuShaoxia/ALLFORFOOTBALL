layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    var laydate = layui.laydate;
    element.init()
    form.render()

    //LAY_FORM_SUBMIT
    /**
     * 比赛信息 表单提交
     */
    form.on('submit(match-info-add-submit)', function (data) {

        var homeClubId = $("#homeClubId").next().find('dd[class=layui-this]').attr('lay-value')

        var awayClubId = $("#awayClubId").next().find('dd[class=layui-this]').attr('lay-value')

        if (homeClubId == 0 || awayClubId == 0 || homeClubId == awayClubId) {
            layer.msg('请选择不同的比赛双方')
            return false;
        } else {
            $.ajax({
                data: data.field,
                async: true,
                url: "/match/info/search",
                success: function (res) {
                    if (res.code == -2) {
                        layer.msg('当轮比赛,比赛双方已经存在')
                        return false;
                    } else if (res.code == -1) {
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
        }

        var matchDate = data.field.match_date
        if (matchDate == null || matchDate == "") {
            layer.msg('请选择比赛日期...')
            return false;
        }

        var date = matchDate.substring(0, 11)
        var time = matchDate.substring(11, 19)
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/match/info/add?matchDate=" + date + "&matchTime=" + time,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据添加成功,页面即将跳转')
                        // setTimeout(function () {
                        //     window.location.href = "/admin/match/list"
                        // }, 2000)
                        window.location.href = "/admin/match/info/add"
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
        }, function (index) {
            layer.close(index)
        })
        return false;
    });

    /**
     * 比赛阵容 表单提交
     */
    form.on('submit(match-lineUp-submit)', function (data) {
        var homeClubPlayerFirstStart = []
        $("input:checkbox[name='homeClubPlayerFirstStart']:checked").each(function () {
            homeClubPlayerFirstStart.push($(this).val().trim())
        });
        var homeClubPlayerSubstitutes = []
        $("input:checkbox[name='homeClubPlayerSubstitutes']:checked").each(function () {
            homeClubPlayerSubstitutes.push($(this).val().trim())
        });
        var awayClubPlayerFirstStart = []
        $("input:checkbox[name='awayClubPlayerFirstStart']:checked").each(function () {
            awayClubPlayerFirstStart.push($(this).val().trim())
        });

        var awayClubPlayerSubstitutes = []
        $("input:checkbox[name='awayClubPlayerSubstitutes']:checked").each(function () {
            awayClubPlayerSubstitutes.push($(this).val().trim())
        });

        data.field['homeClubPlayerFirstStart'] = homeClubPlayerFirstStart;
        data.field['homeClubPlayerSubstitutes'] = homeClubPlayerSubstitutes;
        data.field['awayClubPlayerFirstStart'] = awayClubPlayerFirstStart;
        data.field['awayClubPlayerSubstitutes'] = awayClubPlayerSubstitutes;

        var matchInfoId = $("#matchInfoId").next().find('dd[class=layui-this]').attr('lay-value')
        var homeClubId = $("#homeClubId").val()
        var awayClubId = $("#awayClubId").val()
        data.field['matchInfoId'] = matchInfoId;
        data.field['homeClubId'] = homeClubId;
        data.field['awayClubId'] = awayClubId;


        if (compare(homeClubPlayerFirstStart, homeClubPlayerSubstitutes)) {
            layer.msg('请检查主队首发与替补 存在相同球员')
            return false
        }
        if (compare(awayClubPlayerFirstStart, awayClubPlayerSubstitutes)) {
            layer.msg('请检查客队首发与替补 存在相同球员')
            return false
        }
        console.log(data.field)
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                async: true,
                url: "/match/lineUp/add",
                success: function (res) {
                    if (res.code == -2) {
                        layer.msg('当轮比赛,比赛双方已经存在')
                        return false;
                    } else if (res.code == -1) {
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    }
                    layer.msg('123')
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
        })
        return false;
    })

    /**
     * 比赛技术统计 表单提交
     */
    form.on('submit(match-technology-submit)', function (data) {
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/match/technology/add",
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据添加成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/match/list"
                        }, 2000)
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
        }, function (index) {
            layer.close(index)
        })
        return false;
    })

    /**
     * 比赛过程 表单提交
     */
    form.on('submit(match-process-submit)', function (data) {
        console.log(data.field)
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/match/process/add",
                success: function (res) {
                    if (res.code == -1) {
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false
                    } else {
                        layer.msg('当轮比赛事件录入成功,页面即将跳转')
                        setTimeout(function () {
                            location.href = "/admin/match/list"
                        }, 300)
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false
                }
            })
        })
        return false;
    })

    /**
     * 比赛结果 表单提交
     */
    form.on('submit(match-result-submit)', function (data) {
        console.log(data.field)
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            var matchInfoId = $("#matchInfoId").val()
            var homeClubId = $("input[name='homeClubName[" + matchInfoId + "]']").val()
            var homeClubScore = data.field.homeClubScore
            var awayClubScore = data.field.awayClubScore
            var awayClubId = $("input[name='awayClubName[" + matchInfoId + "]']").val()
            var matchTypeId = $("input[name='matchTypeId[" + matchInfoId + "]']").val()
            $.ajax({
                data: {
                    'matchInfo.id': matchInfoId,
                    homeClubScore: homeClubScore,
                    homeClubId: homeClubId,
                    awayClubScore: awayClubScore,
                    awayClubId: awayClubId,
                    matchTypeId:matchTypeId
                },
                url: '/match/result/add',
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('比赛结果录入成功')
                        setTimeout(function () {
                            location.reload()
                        }, 300)
                    }
                }
            })
        })
        return false;
    })

    /**
     * 表单验证
     */
    form.verify({
        maxLength: function (value, item) {
            if (value > 100 || value <= 0) {
                return '请输入0-100之间数值'
            }
        },
        verifyClubIdAndMatchTimes: function (value, item) {
            var matchTimes = $("#matchTimes").next().find("dd[class='layui-this']").attr('lay-value');
            var matchTypeId = $("#matchTypeId").next().find('dd[class=layui-this]').attr('lay-value');

            if (matchTimes > 1) {
                matchTimes = matchTimes - 1
                var selectVal = value
                $.ajax({
                    data: {
                        'matchType.id':matchTypeId,
                        matchTimes: matchTimes,
                        'homeClub.id': selectVal
                    },
                    url: '/match/info/verify/clubIdAndMatchTimes',
                    success: function (res) {
                        if (res.code == '-2') {
                            layer.msg('当前俱乐部上轮比赛未录入，请重新录入')
                        } else if (res.code == '-1') {
                            layer.msg('后台请求出错，请联系系统管理员')
                        }
                    },
                    error: function (data) {
                        layer.msg('后台请求出错，请联系系统管理员')
                    }
                })
            }
        },
        verifyMatchTime: function (value, item) {
            if (value > 120 || value <= 0) {
                return '请输入0-120之间数值'
            }
        }
    })

    /**
     * 比赛信息录入选择 俱乐部选择
     */
    form.on('select(matchClubSelect)', function (data) {
        var matchTimes = $("#matchTimes").next().find("dd[class='layui-this']").attr('lay-value');
        var matchTypeId = $("#matchTypeId").next().find('dd[class=layui-this]').attr('lay-value')

        if (matchTimes > 1) {
            matchTimes = matchTimes - 1
            var selectVal = data.value
            $.ajax({
                data: {
                    'matchType.id': matchTypeId,
                    matchTimes: matchTimes,
                    'homeClub.id': selectVal
                },
                url: '/match/info/verify/clubIdAndMatchTimes',
                success: function (res) {
                    if (res.code == '-2') {
                        layer.msg('当前俱乐部上轮比赛未录入，请重新录入')
                    } else if (res.code == '-1') {
                        layer.msg('后台请求出错，请联系系统管理员')
                    }
                },
                error: function (data) {
                    layer.msg('后台请求出错，请联系系统管理员')
                }
            })
        }

    })


    /**
     * 比赛类型选择 比赛联动 OK
     */
    form.on('select(matchTypeSelect)', function (data) {
        var selectVal = data.value;
        $("#homeClubId").empty()
        $("#awayClubId").empty()
        var html = "<option value=''></option>"
        $.ajax({
            data: {countryId: selectVal},
            url: '/club/search/condition/countryId',
            success: function (data) {
                var length = data.length
                for (var i = 0; i < length; i++) {
                    html += "<option value=\"" + data[i].id + "\">" + data[i].name + "</option>"
                }
                $('#homeClubId').append(html)
                $('#awayClubId').append(html)
                form.render('select')
            }
        })
        /**
         * 设置当前比赛轮次
         */
        $("#matchTimes").empty()
        var matchHtml = ""
        $.ajax({
            data: {matchTypeId: selectVal},
            url: '/match/maxMatchNum',
            success: function (data) {
                var length = data.matchNum
                for (var i = 0; i < length; i++) {
                    matchHtml += "<option value=\"" + (i + 1) + "\">" + (i + 1) + "</option>"
                }
                $('#matchTimes').append(matchHtml)
                form.render('select')
            }
        });
    })

    /**
     * 比赛轮次选择 OK
     */
    form.on('select(matchTimes)', function (data) {
        var matchType = $("#matchTypeId").next().find('dd[class=layui-this]').attr('lay-value')
        var matchTime = data.value;
        $("#match-info-add-table-tbody").empty()
        var html = ""
        $.ajax({
            // data: {matchType: matchType, matchTime: matchTime},
            url: "/match/info/" + matchType + "/" + matchTime + "",
            success: function (data) {
                var length = data.length
                for (var i = 0; i < length; i++) {
                    html += "<tr>\n" +
                        "                            <td>" + data[i].homeClub.name + "</td>\n" +
                        "                            <td>" + data[i].awayClub.name + "</td>\n" +
                        "                            <td>" + data[i].matchDate + "</td>\n" +
                        "                            <td>" + data[i].matchTime + "</td>\n" +
                        "                            <td>" + data[i].matchState.state + "</td>\n" +
                        "                        </tr>"
                }
                $('#match-info-add-table-tbody').append(html)
                form.render('select')
            }
        });
    });


    /**
     * 比赛录入阵容：选择比赛双方
     */
    form.on('select(match-lineUp-select)', function (data) {
        var text = $("#matchInfoId").next().find('dd[class=layui-this]').text()
        var matchInfoId = $("#matchInfoId").next().find('dd[class=layui-this]').attr('lay-value')
        var strs = new Array()
        strs = text.split('VS');
        if (strs[0] == null || strs[0] == "") {
            $("#homeClubLegend").text('主场')
            $("#awayClubLegend").text('客场')
        } else {
            $("#homeClubLegend").text(strs[0])
            $("#awayClubLegend").text(strs[1])
        }
        $("#homeClubPlayerFirstStart").empty();
        $("#homeClubPlayerSubstitutes").empty();
        $("#awayClubPlayerFirstStart").empty();
        $("#awayClubPlayerSubstitutes").empty();
        //加载球员
        if (matchInfoId != null) {
            $.ajax({
                data: {matchInfoId: matchInfoId},
                url: '/admin/player/searchByMatchInfoId',
                success: function (data) {
                    if (data != null) {
                        var html1 = ""
                        var html2 = ""
                        var html3 = ""
                        var html4 = ""
                        var homeClubId = $("input[name='homeClubName[" + matchInfoId + "]']").val()
                        var awayClubId = $("input[name='awayClubName[" + matchInfoId + "]']").val()
                        for (var i = 0; i < data.length; i++) {
                            if (homeClubId == data[i].club.id) {
                                html1 += "<p><input type=\"checkbox\" name=\"homeClubPlayerFirstStart\" title=\"" + data[i].playerPosition.position + ":" + data[i].number + ":" + data[i].name + "\" value='" + data[i].id + "'></p>\n"
                                html2 += "<p><input type=\"checkbox\" name=\"homeClubPlayerSubstitutes\" title=\"" + data[i].playerPosition.position + ":" + data[i].number + ":" + data[i].name + "\" value='" + data[i].id + "'></p>\n"
                            } else {
                                html3 += "<p><input type=\"checkbox\" name=\"awayClubPlayerFirstStart\" title=\"" + data[i].playerPosition.position + ":" + data[i].number + ":" + data[i].name + "\" value='" + data[i].id + "'></p>\n"
                                html4 += "<p><input type=\"checkbox\" name=\"awayClubPlayerSubstitutes\" title=\"" + data[i].playerPosition.position + ":" + data[i].number + ":" + data[i].name + "\" value='" + data[i].id + "'></p>\n"
                            }
                            clubId = data[i].club.id
                        }
                        var html = "<input type='hidden' id='homeClubId'  value='" + homeClubId + "' />" +
                            "<input type='hidden' id='awayClubId' value='" + awayClubId + "' />"
                        $("#homeClubPlayerFirstStart").append(html1);
                        $("#homeClubPlayerSubstitutes").append(html2);
                        $("#awayClubPlayerFirstStart").append(html3);
                        $("#awayClubPlayerSubstitutes").append(html4).append(html);
                        form.render()
                    }
                },
                error: function (data) {

                }
            })
        }
    })

    /**
     * 比赛技术统计 选择比赛双方
     */
    form.on('select(match-technology-select)', function (data) {
        var text = $("#matchInfoId").next().find('dd[class=layui-this]').text()
        var strs = new Array()
        strs = text.split('VS');
        if (strs[0] == null || strs[0] == "") {
            $("#homeClubLegend").text('主场')
            $("#awayClubLegend").text('客场')
        } else {
            $("#homeClubLegend").text(strs[0])
            $("#awayClubLegend").text(strs[1])
        }
    })

    /**
     * 比赛过程录入 选择比赛双方
     */
    form.on('select(match-process-select)', function (data) {
        var text = $("#matchInfoId").next().find('dd[class=layui-this]').text()
        var strs = new Array()
        strs = text.split('VS');
        if (strs[0] == null || strs[0] == "") {
            $("#homeClubLegend").text('主场')
            $("#awayClubLegend").text('客场')
        } else {
            $("#homeClubLegend").text(strs[0])
            $("#awayClubLegend").text(strs[1])
        }
        /**
         * 比赛场次编号
         */
        var matchInfoId = data.value
        /**
         * 主场俱乐部编号
         * @type {jQuery}
         */
        var homeClubId = $("input[id='homeClub[" + matchInfoId + "]']").val()
        /**
         * 客场俱乐部编号
         * @type {jQuery}
         */
        var awayClubId = $("input[id='awayClub[" + matchInfoId + "]']").val()
        $("input[id='homeMatchProcess[0].club.id']").attr("value", homeClubId);
        $("input[id='homeMatchProcess[0].matchInfo.id']").attr("value", matchInfoId);
        $("input[id='awayMatchProcess[0].club.id']").attr("value", awayClubId);
        $("input[id='awayMatchProcess[0].matchInfo.id']").attr("value", matchInfoId);
        $("input[id='homeMatchProcess[0].player.id']").empty()
        $("input[id='awayMatchProcess[0].player.id']").empty()

        /**
         * 保留第一个事件
         */
        $("#homeClub-table-tbody tr:not(:first)").remove()
        $("#awayClub-table-tbody tr:not(:first)").remove()
        var homeHtml = "<option value=''></option>"

        $("select[id='homeMatchProcess[0].player.id']").empty()
        $("select[id='awayMatchProcess[0].player.id']").empty()
        $.ajax({
            data: {clubId: homeClubId},
            url: '/admin/player/searchPlayerByClubId',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    homeHtml += "<option value='" + data[i].id + "'>" + data[i].name + "</option>"
                }
                $("select[id='homeMatchProcess[0].player.id']").append(homeHtml)
                form.render()
            }
        })
        var awayHtml = "<option value=''></option>"
        $.ajax({
            data: {clubId: awayClubId},
            url: '/admin/player/searchPlayerByClubId',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    awayHtml += "<option value='" + data[i].id + "'>" + data[i].name + "</option>"
                }
                $("select[id='awayMatchProcess[0].player.id']").append(awayHtml)
                form.render()
            }
        })
    })


    var matchListDate = ""
    /**
     * 比赛列表日期选择 match-list-date
     */
    laydate.render({
        elem: "#match-list-date",
        range: true,
        done: function (value, date, endDate) {
            matchListDate = value;
            // console.log('你选择的日期是：' + value + '<br>获得的对象是1' + JSON.stringify(date) + '  获得的对象是2' + JSON.stringify(endDate))
        }
    })

    /**
     * 比赛信息录入日期选择
     */
    laydate.render({
        elem: "#match-add-date",
        type: "datetime",
        // min: 0,//TODO:录入一些数据之后修改这个范围
        done: function (value, date) {
            // layer.alert(JSON.stringify(date))
        }
    })

    /**
     * 比赛阵容录入 日期选择match-lineUp-date OK
     */
    laydate.render({
        elem: "#match-lineUp-date",
        type: "date",
        max: 3,
        // min: -1,
        done: function (value, date) {
            $("#matchInfoId").empty()
            var html = "<option value=''></option>"
            var inputHtml = ""
            $.ajax({
                data: {matchDate: value},
                url: '/match/info/searchByMatchDateForLineUp',
                success: function (data) {
                    var length = data.length
                    for (var i = 0; i < length; i++) {
                        html += "<option value='" + data[i].id + "'>" + data[i].homeClub.name + "VS" + data[i].awayClub.name + "</option>"
                        inputHtml += "<input type='hidden' name='homeClubName[" + data[i].id + "]' value='" + data[i].homeClub.id + "'/>" +
                            "<input type='hidden' name='awayClubName[" + data[i].id + "]' value='" + data[i].awayClub.id + "'/>"
                    }
                    $("#matchInfoId").append(html).append(inputHtml)
                    form.render('select')
                }

            })
        }
    })

    /**
     * 比赛过程录入 日期选择
     */
    laydate.render({
        elem: "#match-process-date",
        type: "date",
        max: 3,
        // min: -2,
        done: function (value, date) {
            $("#matchInfoId").empty()
            var html = "<option value=''></option>"
            var inputHtml = ""
            $.ajax({
                data: {matchDate: value},
                url: '/match/info/searchByMatchDateForProcess',
                success: function (data) {
                    var length = data.length
                    for (var i = 0; i < length; i++) {
                        html += "<option value='" + data[i].id + "'>" + data[i].homeClub.name + "VS" + data[i].awayClub.name + "</option>"
                        inputHtml += "<input type='text' id='homeClub[" + data[i].id + "]' value='" + data[i].homeClub.id + "'/>" +
                            "<input type='text' id='awayClub[" + data[i].id + "]' value='" + data[i].awayClub.id + "'/>"
                    }
                    $("#matchInfoId").append(html).append(inputHtml)
                    form.render('select')
                }

            })
        }
    })

    /**
     * 比赛集锦录入 日期选择match-highlights-date
     */
    laydate.render({
        elem: "#match-highlights-date",
        type: "date",
        max: 3,
        // min: -2,
        done: function (value, date) {
            $("#matchInfoId").empty()
            var html = "<option value=''></option>"
            $.ajax({
                data: {matchDate: value},
                url: '/match/info/searchByMatchDateForHighlignts',
                success: function (data) {
                    var length = data.length
                    for (var i = 0; i < length; i++) {
                        html += "<option value='" + data[i].id + "'>" + data[i].homeClub.name + "VS" + data[i].awayClub.name + "</option>"
                    }
                    $("#matchInfoId").append(html)
                    form.render('select')
                }

            })
        }
    })

    /**
     * 比赛结果录入 ：日期选择
     */
    laydate.render({
        elem: "#match-result-date",
        type: "date",
        max: 3,
        // min: -2,
        done: function (value, date) {
            $("#matchInfoId").empty()
            var html = "<option value=''></option>"
            var inputHtml = ""
            $.ajax({
                data: {matchDate: value},
                url: '/match/info/searchByMatchDateForRes',
                success: function (data) {
                    var length = data.length
                    for (var i = 0; i < length; i++) {
                        html += "<option value='" + data[i].id + "'>" + data[i].homeClub.name + "VS" + data[i].awayClub.name + "</option>"
                        inputHtml += "<input type='hidden' name='homeClubName[" + data[i].id + "]' value='" + data[i].homeClub.id + "'/>" +
                            "<input type='hidden' name='awayClubName[" + data[i].id + "]' value='" + data[i].awayClub.id + "'/>" +
                            "<input type='hidden' name='matchTypeId[" + data[i].id + "]' value='" + data[i].matchType.id + "'>"
                    }
                    $("#matchInfoId").append(html).append(inputHtml)
                    form.render('select')
                }

            })
        }
    })


    /**
     * 比赛技术统计录入 日期选择 match-technology-date OK
     */
    laydate.render({
        elem: "#match-technology-date",
        type: "date",
        max: 3,
        min: -2,
        done: function (value, date) {
            $("#matchInfoId").empty()
            var html = "<option value=''></option>"
            $.ajax({
                data: {matchDate: value},
                url: '/match/info/searchByMatchDateForTec',
                success: function (data) {
                    var length = data.length
                    for (var i = 0; i < length; i++) {
                        html += "<option value='" + data[i].id + "'>" + data[i].homeClub.name + "VS" + data[i].awayClub.name + "</option>"
                    }
                    $("#matchInfoId").append(html)
                    form.render('select')
                }

            })
        }
    })


    /**
     * 比赛列表 表格
     */
    var table = layui.table
    //执行一个 table 实例
    table.render({
        elem: '#match-list-table',
        height: 450,
        // , cellMinWidth: 120
        url: '/admin/match/info/table/list', //数据接口
        page: true, //开启分页
        cols: [[ //表头
            {field: 'id', title: 'ID', sort: true, fixed: 'left'},
            {field: 'matchTimes', sort: true, title: '场次'},
            {field: 'homeClub', title: '主场', templet: '#homeClubTpl'},
            {field: 'awayClub', title: '客场', templet: '#awayClubTpl'},
            {field: 'matchDate', title: '日期', sort: true},
            {field: 'matchTime', title: '时间'},
            {field: 'matchType', title: '比赛性质', templet: '#matchTypeTpl'},
            {field: 'matchState', title: '比赛状态', templet: '#matchStateTpl'},
            {fixed: 'right', align: 'center', width: 230, toolbar: '#match-list-table-bar'}
        ]],
        response: {
            statusName: 'code',
            statusCode: '200',
            countName: 'count',
            dataName: 'data'
        }
    });
    //监听工具条
    table.on('tool(match-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            layer.msg('查看操作');
        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                $.ajax({
                    data: {id: data.id},
                    url: '/match/delete',
                    success: function (res) {
                        if (res.code == '-1') {
                            layer.msg('后台请求出错')
                        }
                    }
                })
            });
        } else if (layEvent === 'edit') {
            layer.open({
                type: 1,
                title: '比赛状态修改',
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '200px'], //宽高
                content: '<div class="layui-form" style="padding-top: 30px">\n' +
                '                <div class="layui-inline">\n' +
                '                    <label for="matchState" class="layui-form-label">比赛状态</label>\n' +
                '                    <div class="layui-input-block">\n' +
                '                        <select name="matchState" id="matchState">\n' +
                '                            <option value="1">未开始</option>\n' +
                '                            <option value="2">上半场</option>\n' +
                '                            <option value="3">中场</option>\n' +
                '                            <option value="4">下半场</option>\n' +
                '                            <option value="5">结束</option>\n' +
                '                            <option value="6">延期</option>\n' +
                '                        </select>\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '                <button id="match-list-matchState-btn" class="layui-btn">状态修改</button>\n' +
                '            </div>'
            });
            form.render()
            /**
             * 比赛状态修改
             */
            var matchInfoId = data.id
            $("#match-list-matchState-btn").on('click', function () {
                var matchState = $("#matchState").next().find('dd[class=layui-this]').attr('lay-value')
                $.ajax({
                    data: {
                        matchState: matchState,
                        matchInfoId: matchInfoId
                    },
                    url: '/match/updateMatchState',
                    success: function (res) {
                        if (res.code == '-1') {
                            layer.msg('后台请求出错,请联系系统管理员')
                        } else {
                            layer.msg('比赛状态修改成功')
                        }
                    }
                })
            })
        }
    });


    /**
     * 模糊搜索
     */
    $("#match-list-search-btn").on('click', function () {
        var condition = $("#match-list-bale-reload").val()
        var matchTypeId = $("#matchTypeId").next().find('dd[class=layui-this]').attr('lay-value')
        if (typeof matchTypeId === 'undefined') {
            matchTypeId = null
        }
        var startTime = matchListDate.substr(0, 10)
        var endTime = matchListDate.substr(13)

        // 搜索 表格重载
        table.reload('match-list-table', {
            // where: {matchTypeId: matchTypeId, condition: condition, startTime: '', endTime: ''},
            where: {
                condition: condition,
                matchTypeId: matchTypeId,
                startTime: startTime,
                endTime: endTime
            },
            page: {curr: 1}
        })
    });

});
Array.intersect = function () {
    var result = new Array();
    var obj = {};
    for (var i = 0; i < arguments.length; i++) {
        for (var j = 0; j < arguments[i].length; j++) {
            var str = arguments[i][j];
            if (!obj[str]) {
                obj[str] = 1;
            }
            else {
                obj[str]++;
                if (obj[str] == arguments.length) {
                    result.push(str);
                }
            }//end else
        }//end for j
    }//end for i
    return result;
}

function compare(arg1, arg2) {
    var result = Array.intersect(arg1, arg2)
    if (result == null || result.length == 0) {
        return false
    } else {
        return true
    }
}
