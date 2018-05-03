<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2017/11/18
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登陆</title>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
</head>
<body class="login-body body" style="background-color: #1b6d85">

<div class="layui-container">
    <div class="layui-row" style="padding-top: 10%">
        <div class="layui-col-md6 layui-col-md-offset4">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <h2 style="padding-left: 40px">懂球儿后台登录系统</h2>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">账号：</label>

                    <div class="layui-input-inline">
                        <input type="text" name="account" class="layui-input" lay-verify="account"
                               placeholder="账号/手机号/邮箱"
                               autocomplete="on" maxlength="20"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>

                    <div class="layui-input-inline">
                        <input type="password" name="password" class="layui-input" lay-verify="password"
                               placeholder="密码"
                               maxlength="20"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button type="reset" class="layui-btn layui-btn-danger btn-reset">重置</button>
                    <button type="button" class="layui-btn btn-submit" lay-submit lay-filter="admin-login">立即登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;
        // 验证
        form.verify({
            account: function (value) {
                if (value == "") {
                    return "请输入账号/手机号/邮箱";
                }
            },
            password: function (value) {
                if (value == "") {
                    return "请输入密码";
                }
            }
        });
        // 提交监听
        form.on('submit(admin-login)', function (data) {
            $.ajax({
                data: data.field,
                url: '/user/login?role=0',
                success: function (res) {
                    if (res.code == '-1') {
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else if (res.code == '-2') {
                        layer.msg('账号不存在或密码输入错误,请重新输入')
                        return false;
                    }
                    else {
                        layer.msg('登录成功...页面即将跳转...')
                        setTimeout(function () {
                            window.location.href = "/admin/index/article/carousel"
                        }, 300)
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
            return false;
        })
    })
</script>
</body>
</html>