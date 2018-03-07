$(function () {
    $("#setting-changePwd-form").validate({
        rules: {
            "setting-changePwd-oldPwd": {
                required: true,
                rangelength: [8, 8]
                //TODO:添加原有密码验证
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
                rangelength: "请输入八位密码"
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

    $("#setting-changePwd-Btn").on('click', function () {
        if ($("#setting-changePwd-form").valid()) {
            $("#setting-changePwd-form").submit()
        }

    })

    //TODO:添加验证方法 验证原有密码是否输入正确

    //TODO:ajax修改数据库中密码


})