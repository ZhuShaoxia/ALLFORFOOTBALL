layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var laydate = layui.laydate;
    //club-add.jsp 监听提交
    form.on('submit(club-add-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src")
        if (typeof imgUrl == 'undefined') {
            // imgUrl = '/uploadImg/defaultImg.png'
            layer.msg('请上传俱乐部队徽...')
            return false;
        }
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/club/add?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据添加成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/club/list"
                        }, 2000)
                    }
                },
                error: function () {
                    layer.msg('用户信息添加失败,请重新添加')
                    return
                }
            })
        }, function (index) {
            layer.close(index)
        })
        return false;
    });

    //club_update.jsp
    //监听提交
    form.on('submit(club-update-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src")
        if (typeof imgUrl == 'undefined') {
            // imgUrl = '/uploadImg/defaultImg.png'
            layer.msg('请上传俱乐部队徽...')
            return false;
        }
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/club/update?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据修改成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/club/list"
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


    var name = $("#name").val()
    form.verify({
        verifyNameIsExist: function (value, item) {
            if (name != value) {
                var code = 200
                $.ajax({
                    data: {name: value},
                    url: "/club/verify/name",
                    async: false,
                    success: function (res) {
                        code = res.code
                    }
                })
                if (code == -1) {
                    return '当前俱乐部名字已经存在,请重新输入'
                }
            }
        }
    })


    element.init()
    form.render()
    laydate.render({
        elem: '#established', //指定元素
        type: 'month',
        max: 0
    })


    //club-list.jsp
    var table = layui.table;
    //执行一个 table 实例
    table.render({
        elem: '#club-list-table'
        , height: 450
        , url: '/admin/club/table/list' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: 'name', title: '中文名', width: 100},
            {field: 'otherName', title: '英文名', width: 100},
            {field: 'established', title: '成立时间', width: 100},
            {field: 'country', title: '国家和地区', width: 130, templet: '#countryNameTpl'},
            {field: 'homeField', title: '主场', width: 100},
            {field: 'city', title: '城市', width: 100},
            {field: 'phone', title: '电话', width: 100},
            {field: 'email', title: '邮箱', width: 100},
            {field: 'address', title: '地址', width: 150},
            {fixed: 'right', width: 178, align: 'center', toolbar: '#club-list-table-bar'}
        ]],
        response: {
            statusName: 'code',
            statusCode: '200',
            countName: 'count',
            dataName: 'data'
        }
    });
    //监听工具条
    table.on('tool(club-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
                    url: '/club/delete',
                    success: function (res) {

                    }
                })
            });
        } else if (layEvent === 'edit') {
            location.href = "/club/edit?id=" + data.id
        }
    });

    $("#club-list-search-btn").on('click', function () {
        var condition = $("#club-list-bale-reload").val()
        //搜索 表格重载
        table.reload('club-list-table', {
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
