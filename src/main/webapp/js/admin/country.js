layui.use(['element', 'upload', 'form', 'table'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    //user-insert.jsp 监听提交
    form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));
        return false;
    });

    element.init()
    form.render()

    // //实例化一个上传控件
    // upload({
    //     url: '上传接口url'
    //     , success: function (data) {
    //         console.log(data);
    //     }
    // })


    //user-list.jsp
    var table = layui.table;
    //执行一个 table 实例
    table.render({
        elem: '#user-list-table'
        , height: 500
        , url: '' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: 'ID', width: 80, sort: true, fixed: 'left'},
            {field: 'nickname', title: '昵称', width: 100}
            , {field: 'username', title: '用户名', width: 100}
            , {field: 'sex', title: '性别', width: 80}
            , {field: 'phone', title: '邮箱', width: 130}
            , {field: 'email', title: '手机', width: 130}
            , {field: 'homeTeam', title: '主队', width: 100}
            , {field: 'role', title: '角色', width: 100}
            ,{fixed: 'right', width:178, align:'center', toolbar: '#user-list-table-bar'}
        ]]
    });
    //监听工具条
    table.on('tool(user-list-table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
