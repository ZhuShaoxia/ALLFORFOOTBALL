layui.use(['element', 'upload', 'form', 'table', 'laydate'], function () {
    var element = layui.element;
    var form = layui.form;
    var upload = layui.upload;
    var laydate = layui.laydate;
    //player-insert.jsp 监听提交
    form.on('submit(formDemo)', function (data) {
        layer.msg(JSON.stringify(data.field));
        return false;
    });

    element.init()
    form.render()
    laydate.render({
        elem: '#birthday' //指定元素
    })

    var table = layui.table;

    /**
     * 当前焦点比赛
     */




    /**
     * 焦点比赛选择
     */
    table.render({
        // elem: '#focus-game-list-table',
         height: 400
        , url: '/admin/index/match/focus/select' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {type: 'checkbox'},
            // {field: 'id', title: 'ID', sort: true, fixed: 'left'},
            // {field: 'matchTimes', title: '场次'},
            {field: 'homeClub.name', title: '比赛主场',templet: '#homeClubTpl'},
            {field: 'awayClub.name', title: '比赛客场', templet: '#awayClubTpl'},
            {field: 'matchDate', title: '比赛日期', sort: true},
            {field: 'matchTime', title: '比赛时间'},
            {field: 'matchType.type', title: '比赛性质', templet: '#matchTypeTpl'},
            {field: 'matchState.state', title: '比赛状态', width: 150, templet: '#matchStateTpl'},
            {fixed: 'right', align: 'center', toolbar: '#focus-game-list-table-bar'}
        ]],
        response: {
            statusName: 'code',
            statusCode: '200',
            countName: 'count',
            dataName: 'data'
        }
    });



    //监听工具条
    table.on('tool(focus-game-list-table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
    table.on('checkbox(focus-game-list-table)', function(obj){
        console.log(obj)
    });

    var $ = layui.$, active = {
        getCheckData: function(){ //获取选中数据
            var checkStatus = table.checkStatus('focus-game-list-table')
                ,data = checkStatus.data;
            layer.alert(JSON.stringify(data));
        }
        ,getCheckLength: function(){ //获取选中数目
            var checkStatus = table.checkStatus('focus-game-list-table')
                ,data = checkStatus.data;
            layer.msg('选中了：'+ data.length + ' 个');
        }
        ,isAll: function(){ //验证是否全选
            var checkStatus = table.checkStatus('focus-game-list-table');
            layer.msg(checkStatus.isAll ? '全选': '未全选')
        }
    };

    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

});