layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    var laydate = layui.laydate;
    //user-insert.jsp 监听提交
    form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));
        return false;
    });

    element.init()
    form.render()
    //比赛列表查询日期
    laydate.render({
        elem: "#match-list-date",
        range: true,
        done: function (value, date, endDate) {
            layer.alert('你选择的日期是：' + value + '<br>获得的对象是1' + JSON.stringify(date) + '  获得的对象是2' + JSON.stringify(endDate))
        }
    })
    //
    //比赛信息录入日期选择
    laydate.render({
        elem: "#match-add-date",
        type: "datetime",
        min: 0,//TODO:录入一些数据之后修改这个范围
        done: function (value, date) {
            layer.alert(JSON.stringify(date))
        }
    })
    //比赛阵容录入日期选择
    laydate.render({
        elem: "#match-lineUp-date",
        type: "date",
        max:3,
        min:0,
        done: function (value, date) {
            layer.alert(JSON.stringify(date))
        }
    })



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
            {field: '', title: '主场', width: 100}
            , {field: '', title: '客场', width: 100}
            , {field: '', title: '日期', width: 100}
            , {field: '', title: '时间', width: 130}
            , {field: '', title: '比赛性质', width: 100}
            , {field: '', title: '比赛状态', width: 100}
            , {fixed: 'right', width: 178, align: 'center', toolbar: '#user-list-table-bar'}
        ]]
    });
    //监听工具条
    table.on('tool(user-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            layer.msg('查看操作');
        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if (layEvent === 'edit') {
            layer.msg('编辑操作');
        }
    });
});
