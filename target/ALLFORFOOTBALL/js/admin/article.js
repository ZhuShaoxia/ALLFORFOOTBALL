$(function () {


    layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
        var element = layui.element;
        var form = layui.form;
        var upload = layui.upload;
        var laydate = layui.laydate;

        element.init()
        form.render()

        var upload = layui.upload;
        //图片上传
        var uploadInst = upload.render({
            elem: '#uploadBtn'
            , url: '/upload/img'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#uploadImg').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code == -1) {
                    layer.close(index)
                    return false;
                }
                //上传成功
                layer.msg('上传成功')
                $('#uploadImg').attr('src', res.url);
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#imgText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });


        //article-list.jsp
        var table = layui.table;
        //执行一个 table 实例
        table.render({
            elem: '#article-list-table'
            , height: 500
            , url: '/admin/article/table/list' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
                {field: 'title', title: '文章标题', width: 150},
                {field: 'subtitle', title: '文章副标题', width: 150},
                {field: 'user', title: '作者', width: 100, templet: '#userTpl'},
                {field: 'createTime', title: '发表时间', width: 150},
                {field: 'articleType', title: '类型', width: 130, templet: '#articleTypeTpl'},
                {field: 'commentList', title: '评论数', width: 130, templet: '#commentCountTpl'},
                {fixed: 'right', align: 'center', toolbar: '#article-list-table-bar'}
            ]],
            response: {
                statusName: 'code',
                statusCode: '200',
                countName: 'count',
                dataName: 'data'
            }
        });
        //监听工具条
        table.on('tool(article-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                layer.msg('查看操作');
            } else if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        data: {id: data.id},
                        url: '/article/delete',
                        success: function (res) {
                            if (res.code == -1) {
                                layer.msg('后台请求出错,请联系系统管理员')
                                return false;
                            } else {
                                layer.msg("删除成功")
                            }
                        }
                    })
                });
            } else if (layEvent === 'edit') {
                location.href = "/article/edit?id=" + data.id
            }
        });

        /**
         * 文章日期选择
         * @type {string}
         */

        var articleDate = ""
        laydate.render({
            elem: "#article-list-date",
            range: true,
            done: function (value, date, endDate) {
                console.log('你选择的日期是：' + value + '<br>获得的对象是1' + JSON.stringify(date) + '  获得的对象是2' + JSON.stringify(endDate))
                articleDate = value;
            }
        })

        $("#article-list-search-btn").on('click', function () {

            var condition = $("#article-list-bale-reload").val()
            var articleTypeId = $("#articleTypeId").next().find('dd[class=layui-this]').attr('lay-value')
            if( typeof articleTypeId === 'undefined'){
                articleTypeId =null
            }
            //搜索 表格重载
            table.reload('article-list-table', {
                where: {
                    condition: condition,
                    articleTypeId:articleTypeId
                },
                page: {curr: 1}
            })
        })


    });
})
