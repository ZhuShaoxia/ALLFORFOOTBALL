$(function () {

    // 注册界面
    // 注册验证
    $("#registerForm").validate({
        rules: {
            username: {
                required: true
            },
            "register-pwd1": {
                required: true,
                rangelength: [8, 8]
            },
            "register-pwd2": {
                required: true,
                rangelength: [8, 8],
                //TODO:两次密码验证不一致
                equalTo: "#register-pwd1"
            },
            mobileNumber: {
                required: true,
                isMobile: true
            }
        },
        messages: {
            username: {
                required: "用户名字不能为空"
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
                isMobile: "请正确填写您的手机号码"
            }
        }
    })

    // 手机号码验证
    $.validator.addMethod("isMobile", function (value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");

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

//注册界面发送验证码
$("#btnSendCode").on('click', function () {
    var mobile_num = $("input[name=mobileNumber]").val()
    sendMessage(mobile_num, 'phone')
})

