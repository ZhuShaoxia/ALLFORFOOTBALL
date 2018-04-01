layui.use(['element', 'upload', 'form', 'table','laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    var laydate = layui.laydate;
    //article-insert.jsp 监听提交
    form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));
        return false;
    });

    element.init()
    form.render()

    //头像上传
    var uploadInst = upload.render({
        elem: '#uploadBtn'
        ,url: '/upload/'
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#uploadImg').attr('src', result); //图片链接（base64）
            });
        }
        ,done: function(res){
            //如果上传失败
            if(res.code > 0){
                return layer.msg('上传失败');
            }
            //上传成功
        }
        ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#imgText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
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
        , url: '' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: '', title: '文章标题', width: 120}
            , {field: '', title: '作者', width: 100}
            , {field: '', title: '发表时间', width: 130}
            , {field: '', title: '类型', width: 130}
            , {field: '', title: '评论数', width: 130}
            // , {field: '', title: '主队', width: 100}
            // , {field: '', title: '角色', width: 100}
            ,{fixed: 'right', width:178, align:'center', toolbar: '#article-list-table-bar'}
        ]]
    });
    //监听工具条
    table.on('tool(article-list-table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'detail'){
            layer.msg('查看操作');
        } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if(layEvent === 'edit'){
            layer.msg('编辑操作');
        }
    });

    //查询日期选择
    laydate.render({
        elem: "#article-list-date",
        range: true,
        done: function (value, date, endDate) {
            layer.alert('你选择的日期是：' + value + '<br>获得的对象是1' + JSON.stringify(date) + '  获得的对象是2' + JSON.stringify(endDate))
        }
    })

});
