<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 13:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户信息查询</legend>
            </fieldset>
            <div class="">
                <div class="layui-inline">
                    <input class="layui-input" placeholder="请输入搜索内容" name="user-list-bale-reload"
                           id="user-list-bale-reload" autocomplete="off">
                </div>
                <button id="user-list-search-btn" class="layui-btn" data-type="reload">搜索</button>
            </div>
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>信息查询结果</legend>
            </fieldset>
            <table class="layui-hide" id="user-list-table" lay-filter="user-list-table"></table>
        </div>
    </div>
    <script type="text/html" id="user-list-table-bar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="roleTpl">
        {{#  if(d.role =='0'){ }}
        管理员
        {{#  }else if(d.role=='1'){ }}
        会员
        {{#  }else if(d.role=='2'){ }}
        编辑
        {{# }}}
    </script>
    <script type="text/html" id="sexTpl">
        {{#  if(d.sex =='1'){ }}
        男
        {{#  }else if(d.sex=='2'){ }}
        女
        {{# }}}
    </script>
    <script type="text/html" id="clubTpl">
        {{#  if(d.otherClubName ==null){ }}
        {{d.club.name}}
        {{#  }else{ }}
        {{d.otherClubName}}
        {{# }}}
    </script>


    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/user.js"></script>
</body>
</html>
