layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var laydate = layui.laydate;
    element.init()

    //player-insert.jsp 监听提交
    form.on('submit(player-add-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src")
        if (typeof imgUrl == 'undefined') {
            layer.msg('请上传球员照片...')
            return false
        }
        //TODO:判断俱乐部是否被选中
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/player/add?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据添加成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/player/list"
                        }, 2000)
                    }
                },
                error: function () {
                    layer.msg('用户信息添加失败,请重新添加')
                    return false;
                }
            })
        }, function (index) {
            layer.close(index)
        })
        return false;
    });

    //player-update.jsp 监听提交
    form.on('submit(player-update-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src")
        if (typeof imgUrl == 'undefined') {
            // imgUrl = '/uploadImg/defaultImg.png'
            layer.msg('请上传球员照片...')
            return false
        }
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/player/update?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据修改成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/player/list"
                        }, 2000)
                    }
                },
                error: function () {
                    layer.msg('用户信息修改失败,请重新添加')
                    return
                }
            })
        }, function (index) {
            layer.close(index)
        })
        return false;
    })

    form.render()
    //表单验证
    form.verify({
        //value：表单的值、item：表单的DOM对象
        maxLength: function (value, item) {
            if (value > 100 || value <= 0) {
                return '请输入0-100之间数值'
            }
        }
    })
    laydate.render({
        elem: '#birthday', //指定元素
        max: 0,
        value: '1985-01-01',
        done: function (value, date) {
            var year = date.year;
            var currentDate = new Date()
            var currentYear = currentDate.getFullYear()
            var age = currentYear - year
            age = age + 1
            $("#age").val(age)
        }
    })

    //-add.jsp 俱乐部联动
    form.on('select(countrySelect)', function (data) {
        var selectVal = data.value;
        $("#clubId").empty()
        var html = "<option value=\"0\"></option>"
        $.ajax({
            data: {countryId: selectVal},
            url: '/club/search/condition/countryId',
            success: function (data) {
                var length = data.length
                for (var i = 0; i < length; i++) {
                    html += "<option value=\"" + data[i].id + "\">" + data[i].name + "</option>"
                }
                $('#clubId').append(html)
                form.render('select')
            }
        })
    })


    //player-list.jsp
    var table = layui.table;
    //执行一个 table 实例
    table.render({
        elem: '#player-list-table'
        , height: 450
        , url: '/admin/player/table/list' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: 'name', title: '姓名', width: 120}
            , {field: 'otherName', title: '外文名', width: 120}
            , {field: 'number', title: '号码', width: 80}
            , {field: 'position', title: '位置', width: 100, templet: '#positionTpl'}
            , {field: 'country', title: '国籍', width: 130}
            , {field: 'club', title: '俱乐部', width: 150, templet: '#clubTpl'}
            , {field: 'birthday', title: '出生日期', width: 150}
            , {fixed: 'right', align: 'center', toolbar: '#player-list-table-bar'}
        ]],
        response: {
            statusName: 'code',
            statusCode: '200',
            countName: 'count',
            dataName: 'data'
        }
    });
    //监听工具条
    table.on('tool(player-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            layer.msg('查看操作');
        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
                $.ajax({
                    data: {id: data.id},
                    url: '/player/delete',
                    success: function (res) {

                    }
                })
            });
        } else if (layEvent === 'edit') {
            location.href = "/player/edit?id=" + data.id
        }
    });

    $("#player-list-search-btn").on('click', function () {
        var condition = $("#player-list-bale-reload").val()
        //搜索 表格重载
        table.reload('player-list-table', {
            where: {condition: condition},
            page: {curr: 1}
        })
    })


    var upload = layui.upload;

    //图片上传
    var uploadInst = upload.render({
        elem: '#uploadBtn'
        , url: '/upload/img'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#uploadImg').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res.code == -1) {
                layer.close(index)
            }
            //上传成功
            layer.msg('上传成功')
            $('#uploadImg').attr('src', res.url);
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#imgText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });

});
