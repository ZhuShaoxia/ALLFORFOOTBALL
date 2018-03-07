var InterValObj; //timer变量，控制时间
var count = 30; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
//TODO:验证码长度
var codeLength = 6;//验证码长度
function sendMessage(account, dealType) {
    curCount = count;
    var dealType; //验证方式
    //TODO:优化验证  发送之后函数接受返回验证码
    if ($("#phone").attr("checked") == true) {
        dealType = "phone";
    }
    else {
        dealType = "email";
    }
    //产生验证码
    for (var i = 0; i < codeLength; i++) {
        code += parseInt(Math.random() * 9).toString();
    }
    //设置button效果，开始计时
    $("#btnSendCode").attr("disabled", "true");
    $("#btnSendCode").text("重发(" + curCount + " s)");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次

    //向后台发送处理数据 TODO:发送验证码 并返回
//        $.ajax({
//            type: "POST", //用POST方式传输
//            dataType: "text", //数据格式:JSON
//            url: 'Login.ashx', //目标地址
//            data: "dealType=" + dealType +"&uid=" + uid + "&code=" + code,
//            error: function (XMLHttpRequest, textStatus, errorThrown) { },
//            success: function (msg){ }
//        });
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