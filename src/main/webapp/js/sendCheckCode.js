var InterValObj; //timer变量，控制时间
var count = 30; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度
function sendMessage(account, dealType) {
    curCount = count;
    // if ($("#phone").attr("checked") == true) {
    //     dealType = "phone";
    // }
    // else {
    //     dealType = "email";
    // }
    //设置button效果，开始计时
    $("#btnSendCode").attr("disabled", "true");
    $("#btnSendCode").text("重发(" + curCount + " s)");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次

    var resp = ""
    if(dealType=='phone'){
        $.ajax({
            data: {phone: account},
            url: '/send/sms/verificationCode',
            async: false,
            success: function (res) {
                resp = res
            }
        })
    }else if(dealType=='email'){
        $.ajax({
            data: {email: account},
            url: '/send/email/verificationCode',
            async: false,
            success: function (res) {
                resp = res
            }
        })
    }
    if (resp.code != '-1') {
        return resp.smscode
    }else {
        return false;
    }

}

//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {
        removeSth("重发")
    }
    else {
        curCount--;
        $("#btnSendCode").text("重发(" + curCount + " s)");
    }
}

/**
 * 模态框关闭的时候移除倒计时
 */
$("#registerModal").on('hide.bs.modal', function () {
    removeSth("获取验证码")
})


/**
 * 移除倒计时
 * @param text
 */
function removeSth(text) {
    window.clearInterval(InterValObj);//停止计时器
    $("#btnSendCode").removeAttr("disabled");//启用按钮
    $("#btnSendCode").text(text);
    code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效
}

function getSMSCode(phone) {
    var resp = ""
    $.ajax({
        data: {phone: phone},
        url: '/send/sms/verificationCode',
        async: true,
        success: function (res) {
            resp = res
        }
    })
    if (resp.code != '-1') {
        return resp.SMSCode
    }
    return false;
}
