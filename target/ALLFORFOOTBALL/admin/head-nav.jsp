<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 11:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo"><img src="../img/logo-2.png" class="img-fluid"/>懂球儿</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="">控制台</a></li>
        <li class="layui-nav-item"><a href="">商品管理</a></li>
        <li class="layui-nav-item"><a href="">用户</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">登出</a></li>
    </ul>
</div>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">
            <%--layui-nav-itemed--%>
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="user-list.jsp">用户信息查询</a></dd>
                    <dd><a href="user-insert.jsp">用户信息录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">比赛管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="match-list.jsp">比赛信息查询</a></dd>
                    <dd><a href="match-add.jsp">比赛信息录入</a></dd>
                    <dd><a href="match-lineUp.jsp">比赛阵容录入</a></dd>
                    <dd><a href="match-technology.jsp">比赛技术统计</a></dd>
                    <dd><a href="match-process.jsp">比赛过程录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">文章管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="article-list.jsp">文章查询</a></dd>
                    <dd><a href="article-add.jsp">文章录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">国家队管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="country-list.jsp">国家队信息查询</a></dd>
                    <dd><a href="club-add.jsp">国家队信息录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">俱乐部管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="club-list.jsp">俱乐部信息查询</a></dd>
                    <dd><a href="club-add.jsp">俱乐部信息录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">球员管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="player-list.jsp">球员信息查询</a></dd>
                    <dd><a href="player-add.jsp">球员基本信息录入</a></dd>
                    <dd><a href="player-add-other.jsp">球员其它信息录入</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
