$(function () {
    $("#loginForm").validate({
        rules: {
            "login_account": {
                required: true
            },
            "login_pwd": {
                required: true
            }
        },
        messages: {
            "login_account": {
                required: "请输入账号/邮箱/手机号"
            },
            "login_pwd": {
                required: "请输入有效密码"
            }
        }

    })
})

//登录验证
$("#loginBtn").on('click', function () {
    var account = $("#login-account").val()
    var password = $("#login-password").val()
    $.ajax({
        data: {
            account: account,
            password: password
        },
        url: '/user/login',
        success: function (res) {
            if (res.code == '-1') {
                alert('后台请求出错,请联系系统管理员')
                return false;
            } else if (res.code == '-2') {
                alert('账号不存在或密码输入错误,请重新输入')
                return false;
            }
            window.location.href = "/"
        }
    })
})


//忘记密码 跳转页面
$("#forgetBtn").on('click', function () {
    window.location.href = "/forgetPwd"
})

