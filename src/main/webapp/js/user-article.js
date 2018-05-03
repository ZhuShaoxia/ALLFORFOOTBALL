function deleteArticle(id) {
    if (confirm("确定要删除该文章嘛")) {
        $.ajax({
            data: {id: id},
            url: '/article/delete',
            success: function (res) {
                if (res.code == '-1') {
                    alert('后台请求出错 ')
                } else {
                    location.reload()
                }
            }
        })
    }
}

function newArticle() {
    location.href = '/user/articleAdd'
}