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
        // console.log(type)
    })

    //回复回复你的人按钮
    $("#reply-btn").on('click', function () {
        var reply_user = '回复@' + $("#comment-reply-user").text() + ':'
        $("#reply-content-input").attr('placeholder', reply_user)
    })
})

function deleteComment(id) {
    confirm("确定要删除该文章嘛")
}