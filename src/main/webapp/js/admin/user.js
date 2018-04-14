layui.use(['element', 'upload', 'form', 'table', 'layer'], function () {
    var element = layui.element;
    var form = layui.form;
    var layer = layui.layer;
    element.init()
    form.render()
    //user-insert.jsp 监听提交
    form.on('submit(user-add-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src");
        if (typeof imgUrl == 'undefined') {
            // imgUrl = '/uploadImg/defaultImg.png'
            layer.msg('请上传头像...')
            return false;
        }
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/user/add?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据添加成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/user/list"
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

    //user_update.jsp
    //监听提交
    form.on('submit(user-update-submit)', function (data) {
        var imgUrl = $("#uploadImg").attr("src")
        if (typeof imgUrl == 'undefined') {
            // imgUrl = '/uploadImg/defaultImg.png'
            layer.msg('请上传头像...')
            return false;
        }
        layer.confirm('请确认数据无误', {
            btn: ['确定', '取消'],
        }, function (index) {
            $.ajax({
                data: data.field,
                url: "/user/update?imgUrl=" + imgUrl,
                success: function (res) {
                    if (res.code == -1) {
                        layer.close(index)
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('数据修改成功,页面即将跳转')
                        setTimeout(function () {
                            window.location.href = "/admin/user/list"
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


    //验证之前获得值
    var account = $("#account").val()
    var phone = $("#phone").val()
    var email = $("#email").val()
    var nickname = $("#nickname").val()
    var otherClubName = $("#otherClubName").val()
    //表单验证
    form.verify({
        //value：表单的值、item：表单的DOM对象
        passwordLength: function (value, item) {
            if (value.length < 6) {
                return '请输入6位以上密码'
            }
        },
        accountIsExist: function (value, item) {
            if (value != account) {
                var code = 200
                $.ajax({
                    data: {account: value},
                    url: "/user/verify/account",
                    async: false,
                    success: function (res) {
                        code = res.code
                    }
                })
                if (code == -1) {
                    return '当前账号已经存在，请重新输入'
                }
                if (value.length < 6) {
                    return '请输入6位以上账号'
                }
            }
        },
        phoneIsExist: function (value, item) {
            if (phone != value) {
                var code = 200
                $.ajax({
                    data: {phone: value},
                    url: "/user/verify/phone",
                    async: false,
                    success: function (res) {
                        code = res.code
                    }
                })
                if (code == -1) {
                    return '当前手机号已经存在,请重新输入'
                }
            }
        },
        nicknameIsExist: function (value, item) {
            if (nickname != value) {
                var code = 200
                $.ajax({
                    data: {nickname: value},
                    url: "/user/verify/nickname",
                    async: false,
                    success: function (res) {
                        code = res.code
                    }
                })
                if (code == -1) {
                    return '当前昵称已经存在,请重新输入'
                }
            }
        },
        emailIsExist: function (value, item) {
            if (email != value) {
                var code = 200
                $.ajax({
                    data: {email: value},
                    url: "/user/verify/email",
                    async: false,
                    success: function (res) {
                        code = res.code
                    }
                })
                if (code == -1) {
                    return '当前邮箱已存在,请重新输入'
                }
            }
        }
        //    TODO :验证俱乐部名字是否存在
    })

    //user-add.jsp 俱乐部联动
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


    //user-list.jsp
    var table = layui.table;
    //执行一个 table 实例
    table.render({
        elem: '#user-list-table'
        , height: 450
        , url: '/admin/user/table/list' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: 'nickname', title: '昵称', width: 80}
            , {field: 'name', title: '用户名', width: 80}
            , {field: 'sex', title: '性别', width: 80, templet: '#sexTpl'}
            , {field: 'email', title: '邮箱', width: 130}
            , {field: 'phone', title: '手机', width: 130}
            , {field: 'club', title: '主队', width: 100, templet: '#clubTpl'}
            , {field: 'role', title: '角色', width: 100, templet: '#roleTpl'}
            , {field: 'modifiedTime', title: '最后一次修改时间', width: 120, sort: true}
            , {field: 'createTime', title: '创建时间', width: 120, sort: true}
            , {fixed: 'right', align: 'center', toolbar: '#user-list-table-bar'}
        ]],
        response: {
            statusName: 'code',
            statusCode: '200',
            countName: 'count',
            dataName: 'data'
        },
        done: function (res, curr, count) {
            // console.log(res);
            //
            // //得到当前页码
            // console.log(curr);
            //
            // //得到数据总量
            // console.log(count);
        }
    });

    //监听工具条
    table.on('tool(user-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            console.log(data)
            //信息查看
            layer.open({
                title: '用户详细信息-查看',
                // btn: ['确定修改', '取消'],
                btnAlign: 'c',
                content: "<div><label>用户头像</label><img src='" + data.imgUrl + "' style='width: 40px;height: 40px'></div>\n" +
                "<div><label>账号:</label><span>" + data.account + "</span></div>\n" +
                "<div><label>昵称:</label><span>" + data.nickname + "</span></div>\n" +
                "<div><label>姓名:</label><span>" + data.name + "</span></div>\n" +
                "<div><label>性别:</label><span>" + data.sex + "</span></div>\n" +
                "<div><label>邮箱:</label><span>" + data.email + "</span></div>\n" +
                "<div><label>手机:</label><span>" + data.phone + "</span></div>\n" +
                "<div><label>角色:</label><span>" + data.role + "</span></div>\n" +
                "<div><label>主队:</label><span>" + data.otherClubName + "</span></div>\n" +
                "<div><label>简介:</label><span>" + data.profile + "</span></div>",
                yes: function (index, layero) {
                    layer.close(index)
                }
            })
        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
                $.ajax({
                    data: {id: data.id},
                    url: '/user/delete',
                    success: function (res) {
                        layer.msg("删除成功")
                    }
                })
            });
        } else if (layEvent === 'edit') {
            location.href = "/user/edit?id=" + data.id
        }
    });

    $("#user-list-search-btn").on('click', function () {
        var condition = $("#user-list-bale-reload").val()
        //搜索 表格重载
        table.reload('user-list-table', {
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
