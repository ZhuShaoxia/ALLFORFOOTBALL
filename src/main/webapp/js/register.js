$(function () {

    // 注册界面
    // 注册验证
    $("#registerForm").validate({
        rules: {
            account: {
                required: true,
                rangelength: [6, 10],
                verifyAccount: true
            },
            nickname: {
                required: true,
                verifyNickname: true
            },
            "register-pwd1": {
                required: true,
                rangelength: [8, 8]
            },
            "register-pwd2": {
                required: true,
                rangelength: [8, 8],
                equalTo: "#register-pwd1"
            },
            mobileNumber: {
                required: true,
                isMobile: true,
                verifyPhone: true
            }
        },
        messages: {
            account: {
                required: "账号不能为空",
                rangelength: "请输入六位到十位账号",
                verifyAccount: "账号已存在 请重新输入"
            },
            nickname: {
                required: "昵称不能为空",
                verifyNickname: "昵称已存在,请重新输入"
            },
            "register-pwd1": {
                required: "密码不能为空",
                rangelength: "请输入八位密码"
            },
            "register-pwd2": {
                required: "密码不能为空",
                rangelength: "请输入八位密码",
                equalTo: "两次密码不一致，请重新输入"
            },
            mobileNumber: {
                required: "手机号不能为空",
                isMobile: "请正确填写您的手机号码",
                verifyPhone: "当前手机号已经注册，请找回密码或重新输入"
            }
        }
    })

    // 手机号码验证
    $.validator.addMethod("isMobile", function (value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");

    //账号是否存在验证
    $.validator.addMethod("verifyAccount", function (value, element) {
        var flag = true;
        var resp = '';
        var account = value;
        $.ajax({
            data: {account: account},
            url: '/user/verify/account',
            async: false,
            success: function (res) {
                resp = res;
            }
        })
        if (resp.code == '-1') {
            flag = false
        }
        return this.optional(element) || flag
    }, "当前用户名已经存在,请重新输入");

    //手机号是否存在验证
    $.validator.addMethod("verifyPhone", function (value, element) {
        var flag = true;
        var resp = '';
        var phone = value;
        $.ajax({
            data: {phone: phone},
            url: '/user/verify/phone',
            async: false,
            success: function (res) {
                resp = res;
            }
        })
        if (resp.code == '-1') {
            flag = false
        }
        return this.optional(element) || flag
    }, "当前手机号已经存在，请重新输入");

    //验证昵称是否存在
    $.validator.addMethod("verifyNickName", function (value, element) {
        var flag = true;
        var resp = '';
        var nickname = value;
        $.ajax({
            data: {nickname: nickname},
            url: '/user/verify/nickname',
            async: false,
            success: function (res) {
                resp = res;
            }
        })
        if (resp.code == '-1') {
            flag = false
        }
        return this.optional(element) || flag
    }, "当前昵称已存在，请重新输入");
})


var flag = false

$('#checkPanel').slideVerify({
    type: 1,		//类型
    vOffset: 5,	//误差量，根据需求自行调整
    barSize: {
        width: '100%',
        height: '40px',
    },
    ready: function () {
        flag = false
    },
    success: function () {
        flag = true
    },
    error: function () {
        flag = false
    }

});

$("#registerBtn").on('click', function () {
    //验证是通过
    if ($("#registerForm").valid()) {
        if (flag) {
            $('#registerModal').modal('show')
            var mobile_num = $("input[name=mobileNumber]").val()
            $("#modal_mobileNumber").text(mobile_num)
        } else {
            alert("请向右滑动完成验证...")
        }
    }
})

var SMSCode = ''
//注册界面发送验证码
$("#btnSendCode").on('click', function () {
    var mobile_num = $("input[name=mobileNumber]").val()
    SMSCode = sendMessage(mobile_num, 'phone')
})


$("#checkCodeBtn").on('click', function () {
    console.log(SMSCode)
    var textCode = $("#register-sms-code").val()
    if (textCode == "" || textCode == null || textCode.length != 6) {
        alert('请输入六位短信验证码')
    } else if (SMSCode == textCode) {
        var account = $("#register-account").val()
        var password = $("#register-pwd1").val()
        var phone = $("#register-mobileNumber").val()
        $.ajax({
            data: {
                account: account,
                password: password,
                phone: phone,
                role: 1
            },
            url: '/user/add',
            success: function (data) {
                alert('注册成功,请登录')
                location.href = '/'
            },
            error: function () {
                alert('后台请求出错,请联系系统管理员')
            }
        })
    }
})

