$(function () {
    $("#setting-changePwd-form").validate({
        rules: {
            "setting-changePwd-oldPwd": {
                required: true,
                rangelength: [8, 8],
                verifyPwd: true
            },
            "setting-changePwd-newPwd": {
                required: true,
                rangelength: [8, 8]
            },
            "setting-changePwd-newPwd2": {
                required: true,
                rangelength: [8, 8],
                equalTo: "#setting-changePwd-newPwd"
            }
        },
        messages: {
            "setting-changePwd-oldPwd": {
                required: "请输入原密码",
                rangelength: "请输入八位密码",
                verifyPwd: "原始密码输入错误"
            },
            "setting-changePwd-newPwd": {
                required: "请输入新密码",
                rangelength: "请输入八位密码"
            },
            "setting-changePwd-newPwd2": {
                required: "请再次输入密码",
                rangelength: "请输入八位密码",
                equalTo: "两次密码不一致，请重新输入"

            }
        }

    })



    $.validator.addMethod("verifyPwd", function (value, element) {
        var userId = $("#userId").val()
        var password = value;
        var flag = true;
        var resp = '';
        var phone = value;
        $.ajax({
            data: {id: userId, password: password},
            url: '/user/verify/password',
            async: false,
            success: function (res) {
                resp = res;
            }
        })
        if (resp.code == '-1') {
            flag = false
        }
        return this.optional(element) || flag
    }, "原始密码错误");

    $("#setting-changePwd-Btn").on('click', function () {
        if ($("#setting-changePwd-form").valid()) {
            var userId = $("#userId").val()
            var password = $("#setting-changePwd-newPwd").val()
            $.ajax({
                data:{
                    id:userId,
                    password:password
                },
                url:'/user/changePwd',
                success: function (res) {
                    if (res.code == '-1') {
                        alert('后台请求出错 请联系系统管理员')
                        return false;
                    }
                    alert('修改成功')
                    $("#setting-changePwd-oldPwd").val('')
                    $("#setting-changePwd-newPwd").val('')
                    $("#setting-changePwd-newPwd2").val('')
                }
            })
        }
    })

})