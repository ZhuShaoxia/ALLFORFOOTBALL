$(function () {
    $('#reply-content-input').popover({
        placement: "top",
        trigger: 'manual',
    })

    $("#reply-content-btn").on('click', function () {
        var content = $("#reply-content-input").val()
        if (content == "" || content == null) {
            $('#reply-content-input').popover('show')
            // alert("NO ALLOW NULL")
            setTimeout(function () {
                $('#reply-content-input').popover('hide')
            }, 1000)
            return
        }
        //TODO:发送评论内容


        //发送成功之后 显示评论成功
    })


    //下拉框切换发出评论 或 收到评论
    $("#comment-type").on('change', function () {
        var type = $("#comment-type").val();
        $("#commentBody").empty()
        var html = ''
        $.ajax({
            data: {
                typeId: type
            },
            url: '/comment/findByUserId',
            success: function (data) {
                if (type == 1) {
                    for (var i = 0; i < data.length; i++) {
                        html += "<div class=\"comment-item\">\n" +
                            "                        <div class=\"col-md-1 comment-item-left\">\n" +
                            "                            <img src=\"" + data[i].user.imgUrl + "\" alt=\"请上传头像\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-right\">\n" +
                            "                            <div class=\"comment-item-right-user\">\n" +
                            "                                <strong>" + data[i].user.nickname + "</strong>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-time\">\n" +
                            "                                <span>" + data[i].createTime + "</span>\n" +
                            "                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-comment\">\n" +
                            "                                <p>" + data[i].content + "</p>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-article\">\n" +
                            "                                <a href=\"#\">\n" +
                            "                                    <span class=\"theme\">评论@" + data[i].article.user.nickname + "的文章:</span>\n" +
                            "                                    <span class=\"content\"><a href=\"/article/info/" + data[i].article.id + "\">" + data[i].article.title + "</a></span>\n" +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>"
                    }
                } else if (type == 2) {
                    for (var i = 0; i < data.length; i++) {

                        html += "<div class=\"container comment-item\">\n" +
                            "                    <div class=\"row\">\n" +
                            "                        <div class=\"col-md-1 comment-item-left\">\n" +
                            "                            <img src=\"" + data[i].user.imgUrl + "\" alt=\"请上传头像\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-right\">\n" +
                            "                            <div class=\"comment-item-right-user\">\n" +
                            "                                <strong id=\"comment-reply-user\">" + data[i].user.nickname + "</strong>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-time\">\n" +
                            "                                <span>" + data[i].createTime + "</span>\n" +
                            "                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-comment\">\n" +
                            "                                <span>回复@<a href=\"/user/info/" + data[i].replyUser.id + "\">" + data[i].replyUser.nickname + "</a>:</span>\n" +
                            "                                <p>" + data[i].content + "</p>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-article\">\n" +
                            "                                <a href=\"/article/info/" + data[i].article.id + "\">\n" +
                            "                                    <span class=\"theme\">回复我的评论:</span>\n" +
                            "                                    <span class=\"content\">" + data[i].replyContent + "</span>\n" +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"comment-item-bottom row \">\n" +
                            "                        <button id=\"reply-btn\" type=\"button\" class=\"btn btn-danger btn-block\" data-toggle=\"collapse\" data-target=\"#demo\">回复这个回复你的人</button>\n" +
                            "                    </div>\n" +
                            "                    <div id=\"demo\" class=\"collapse out row comment-item-bottom-reply\">\n" +
                            "                        <div class=\"col-md-1 comment-item-bottom-reply-left\">\n" +
                            "                            <img src=\"" + data[i].replyUser.imgUrl + "\" alt=\"" + data[i].replyUser.nickname + "\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-bottom-reply-right\">\n" +
                            "                            <input data-content=\"评论内容不能为空，请输入评论\" id=\"reply-content-input\" type=\"text\" placeholder=\"回复@" + data[i].user.nickname + ":\">\n" +
                            "                            <button id=\"reply-content-btn\" class=\"btn btn-danger\">评论</button>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>"
                    }
                }
                $("#commentBody").append(html)
            }
        })
    })

    $("#comment-search-btn").on('click', function () {
        var type = $("#comment-type").val();
        var condition = $("#comment-search-condition").val()
        $("#commentBody").empty()
        var html = ''
        $.ajax({
            data: {
                typeId: type,
                condition:condition
            },
            url: '/comment/findByUserId',
            success: function (data) {
                if (type == 1) {
                    for (var i = 0; i < data.length; i++) {
                        html += "<div class=\"comment-item\">\n" +
                            "                        <div class=\"col-md-1 comment-item-left\">\n" +
                            "                            <img src=\"" + data[i].user.imgUrl + "\" alt=\"请上传头像\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-right\">\n" +
                            "                            <div class=\"comment-item-right-user\">\n" +
                            "                                <strong>" + data[i].user.nickname + "</strong>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-time\">\n" +
                            "                                <span>" + data[i].createTime + "</span>\n" +
                            "                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-comment\">\n" +
                            "                                <p>" + data[i].content + "</p>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-article\">\n" +
                            "                                <a href=\"#\">\n" +
                            "                                    <span class=\"theme\">评论@" + data[i].article.user.nickname + "的文章:</span>\n" +
                            "                                    <span class=\"content\"><a href=\"/article/info/" + data[i].article.id + "\">" + data[i].article.title + "</a></span>\n" +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>"
                    }
                } else if (type == 2) {
                    for (var i = 0; i < data.length; i++) {

                        html += "<div class=\"container comment-item\">\n" +
                            "                    <div class=\"row\">\n" +
                            "                        <div class=\"col-md-1 comment-item-left\">\n" +
                            "                            <img src=\"" + data[i].user.imgUrl + "\" alt=\"请上传头像\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-right\">\n" +
                            "                            <div class=\"comment-item-right-user\">\n" +
                            "                                <strong id=\"comment-reply-user\">" + data[i].user.nickname + "</strong>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-time\">\n" +
                            "                                <span>" + data[i].createTime + "</span>\n" +
                            "                                <span>&nbsp;&nbsp;&nbsp;来自懂球儿</span>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-comment\">\n" +
                            "                                <span>回复@<a href=\"/user/info/" + data[i].replyUser.id + "\">" + data[i].replyUser.nickname + "</a>:</span>\n" +
                            "                                <p>" + data[i].content + "</p>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"comment-item-right-article\">\n" +
                            "                                <a href=\"/article/info/" + data[i].article.id + "\">\n" +
                            "                                    <span class=\"theme\">回复我的评论:</span>\n" +
                            "                                    <span class=\"content\">" + data[i].replyContent + "</span>\n" +
                            "                                </a>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                    <div class=\"comment-item-bottom row \">\n" +
                            "                        <button id=\"reply-btn\" type=\"button\" class=\"btn btn-danger btn-block\" data-toggle=\"collapse\" data-target=\"#demo\">回复这个回复你的人</button>\n" +
                            "                    </div>\n" +
                            "                    <div id=\"demo\" class=\"collapse out row comment-item-bottom-reply\">\n" +
                            "                        <div class=\"col-md-1 comment-item-bottom-reply-left\">\n" +
                            "                            <img src=\"" + data[i].replyUser.imgUrl + "\" alt=\"" + data[i].replyUser.nickname + "\">\n" +
                            "                        </div>\n" +
                            "                        <div class=\"col-md-11 comment-item-bottom-reply-right\">\n" +
                            "                            <input data-content=\"评论内容不能为空，请输入评论\" id=\"reply-content-input\" type=\"text\" placeholder=\"回复@" + data[i].user.nickname + ":\">\n" +
                            "                            <button id=\"reply-content-btn\" class=\"btn btn-danger\">评论</button>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>"
                    }
                }
                $("#commentBody").append(html)
            }
        })
    })

    //回复回复你的人按钮
    $("#reply-btn").on('click', function () {
        var reply_user = '回复@' + $("#comment-reply-user").text() + ':'
        $("#reply-content-input").attr('placeholder', reply_user)
    })
})
