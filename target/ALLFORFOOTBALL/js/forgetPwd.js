$(function () {
    $('#step1Form').validate({
        rules: {
            step1Account: {
                required: true,
                isMobileOrEmail: true
            }
        },
        messages: {
            step1Account: {
                required: "请输入邮箱或手机号码",
                isMobileOrEmail: "请正确填写您的手机号码或邮箱"
            }
        }
    })

    $('#step2Form').validate({
        rules: {
            step2Code: {
                required: true,
                rangelength: [6, 6]
            }
        },
        messages: {
            step2Code: {
                required: "请输入六位验证码",
                rangelength: "请输入六位验证码"
            }
        },
        errorPlacement:function (error ,element) {
            error.appendTo(element.parent().parent());
        }
    })

    $('#step3Form').validate({
        rules: {
            step3Pwd1: {
                required: true,
                rangelength: [8, 8]
            },
            step3Pwd2:{
                required: true,
                rangelength: [8, 8],
                equalTo:"#step3Pwd1"
            }
        },
        messages: {
            step3Pwd1: {
                required: "密码不能为空",
                rangelength: "请输入八位密码"
            },
            step3Pwd2:{
                required: "密码不能为空",
                rangelength: "请输入八位密码",
                equalTo: "两次密码不一致，请重新输入"
            }
        },
        errorPlacement:function (error ,element) {
            error.appendTo(element.parent().parent());
        }
    })


    // 手机号码/邮箱验证
    $.validator.addMethod("isMobileOrEmail", function (value, element) {
        if (value.indexOf('@') != -1) {
            var email = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            return this.optional(element) || (email.test(value));
        } else {
            var length = value.length;
            var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }

    }, "请正确填写您的手机号码或邮箱");
})

var flag
$('#mpanel1').slideVerify({
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

$(".row.step-1").show();

function step1Btn() {

    if ($("#step1Form").valid()) {
        if (flag) {
            $(".row.step-1").hide();
            $(".row.step-2").show();
            $(".row.step-3").hide();
            var step1Account = $("input[name=step1Account]").val()
            var dealType = checkMobilOrEmail(step1Account)
            console.log(dealType)
            if (dealType == 'email') {
                $("#step2H5msg").append("邮箱,请查收")
            }
            if (dealType == 'phone') {
                $("#step2H5msg").append("手机,请查收")
            }
            sendMessage(step1Account, dealType);
            $("#step2Account").val(step1Account)
        } else {
            alert("验证失败,重新验证...")
        }
    }
}

function checkMobilOrEmail(val) {
    if (val.indexOf('@') != -1) {
        return 'email'
    } else {
        return 'phone'
    }
}

function step2Btn() {
    if ($("#step2Form").valid()) {
        $(".row.step-1").hide();
        $(".row.step-2").hide();
        $(".row.step-3").show();
    }
}

function step3Btn() {
    if($("#step3Form").valid()){
        //TODO:提交后台进行修改密码
    }
}