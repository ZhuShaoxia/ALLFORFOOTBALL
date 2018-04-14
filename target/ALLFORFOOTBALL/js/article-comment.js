
var commentNum = 0;
var i = 0;
function commentBtn() {
    var commentContent = $("#comment-textarea").val()
    if (!validate(commentContent.trim())) {
        alert("请输入评论内容")
        return;
    }
    $("#comment-textarea").val("");
    var commentTime = new Date().Format("yyyy-MM-dd HH:mm:ss")
    var commentHtml = "<div class=\"row page-comment-item\" id=\"comments[" + commentNum + "]\">\n" +
        "            <div class=\"col-md-1 head-img\" style=\"text-align: center;\">\n" +
        "                <img id=\"comments[" + commentNum + "].headImg\" src=\"/img/club/spanish/fcb_club.png\" class=\"img-fluid\"/>\n" +
        "                <p>" + (commentNum + 1) + "楼</p>\n" +
        "            </div>\n" +
        "            <div class=\"col-md-9\">\n"

    var replyFloor = $("#reply-floor").text().trim();
    if (validate(replyFloor)) {
        var replyUsername = $("#reply-username").text().trim()
        replyFloor = parseInt(replyFloor);
        var replyCommentContent = $("p[id='comments[" + (replyFloor - 1) + "].comment']").text();
        replyCommentContent = replyCommentContent.substr(0, 100);
        if (replyCommentContent.length > 100) {
            replyCommentContent += "[略略略...]";
        }
        commentHtml = commentHtml.concat("<blockquote>\n" +
            "                    <span>回复<span class=\"reply-floor\">" + replyFloor + "</span>楼:@<a href=\"\">" + replyUsername + "</a></span>\n" +
            "                    <p>" + replyCommentContent + "</p>\n" +
            "                </blockquote>\n")

    }
    commentHtml = commentHtml.concat("<h5>\n" +
        "                                 <a id=\"comments[" + commentNum + "].username\" href=\"#个人信息\">朱晓磊</a>\n" +
        "                             </h5>\n" +
        "                <div class=\"comment\">\n" +
        "                    <p id=\"comments[" + commentNum + "].comment\">" + commentContent + "</p>\n" +
        "                </div>\n" +
        "                <h5 style=\"border-top: 1px dashed grey;padding: 5px;\">\n" +
        "                    <img class=\"comment-time-img\" src=\"img/time-logo.png\" class=\"img-fluid\"/><span class=\"comment-time\">" + commentTime + "</span>\n" +
        "                    <span class=\"comment-reply\" onclick=\"replay(" + commentNum + ")\">回复</span>\n" +
        "                </h5>\n" +
        "            </div>\n" +
        "        </div>")

    if (commentNum == 0) {
        $(".comment-null").fadeOut();
        $("#page-comment-list").html(commentHtml);
    } else {
        $("div[id='comments[" + i + "]").after(commentHtml);
        i++;
    }
    //存入数据库

    commentNum++;
    closeReply()

}

//验证输入内容是否为空
function validate(obj) {
    if (obj == "" || obj == null) {
        return false;
    } else {
        return true;
    }
}

//回复按钮
function replay(commentNum) {
    $(".reply").show()
    var replyUsername = $("a[id='comments[" + commentNum + "].username']").text();
    $("#reply-floor").text(commentNum + 1);
    $("#reply-username").text(replyUsername);
    $("#comment-textarea").focus()
}

//关闭回复提示
function closeReply(){
    $(".reply").hide()
    $("#reply-floor").text("");
    $("#reply-username").text("");
}

//获取当前系统时间
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}
//时间格式化
Date.prototype.Format = function(fmt) {
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

