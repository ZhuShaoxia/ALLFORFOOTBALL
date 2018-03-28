layui.use(['element', 'upload', 'form', 'table','laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    var laydate = layui.laydate;
    //club-insert.jsp 监听提交
    form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));
        return false;
    });

    element.init()
    form.render()
    laydate.render({
        elem: '#establish' //指定元素
        ,type:'month'
    })
    // //实例化一个上传控件
    // upload({
    //     url: '上传接口url'
    //     , success: function (data) {
    //         console.log(data);
    //     }
    // })


    //club-list.jsp
    var table = layui.table;
    //执行一个 table 实例
    table.render({
        elem: '#club-list-table'
        , height: 450
        , url: '' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: '', title: '中文名', width: 100}
            , {field: '', title: '英文名', width: 100}
            , {field: '', title: '成立时间', width: 100}
            , {field: '', title: '国家和地区', width: 130}
            , {field: '', title: '主场', width: 100}
            , {field: '', title: '电话', width: 100}
            , {field: '', title: '邮箱', width: 100}
            , {field: '', title: '地址', width: 150}
            ,{fixed: 'right', width:178, align:'center', toolbar: '#club-list-table-bar'}
        ]]
    });
    //监听工具条
    table.on('tool(club-list-table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
});
