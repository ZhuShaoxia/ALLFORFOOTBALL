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
    //TODO:登录验证
    $("#loginForm").submit()
    console.log("123")
})


//忘记密码 跳转页面
$("#forgetBtn").on('click', function () {
    window.location.href = "forgetPwd.jsp"
})

