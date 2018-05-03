//回复按钮
function replay(commentNum) {
    var isLogin = $("#checkUser").val()
    if (isLogin == "") {
        alert('请您登录后回复')
    }
    $(".reply").show()
    var replyUsername = $("a[id='comments[" + commentNum + "].username']").text();
    $("#reply-floor").text(commentNum);
    $("#reply-username").text(replyUsername);
    var userId = $("input[id='floorUserId["+commentNum+"]'").val()
    $("#reply-username").attr("href", "/user/info/" + userId)
    $("#comment-textarea").focus()
}

//关闭回复提示
function closeReply() {
    $(".reply").hide()
    $("#reply-floor").text("");
    $("#reply-username").text("");
}

//验证输入内容是否为空
function validate(obj) {
    if (obj == "" || obj == null) {
        return false;
    } else {
        return true;
    }
}

//时间格式化
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}