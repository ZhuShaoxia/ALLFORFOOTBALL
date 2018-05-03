<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/26
  Time: 11:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-header">
    <div class="layui-logo"><img src="${pageContext.request.contextPath}/img/logo-2.png" class="img-fluid"/>懂球儿</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <%--<ul class="layui-nav layui-layout-left">--%>
        <%--<li class="layui-nav-item"><a href="">控制台</a></li>--%>
        <%--<li class="layui-nav-item"><a href="">商品管理</a></li>--%>
        <%--<li class="layui-nav-item"><a href="">用户</a></li>--%>
    <%--</ul>--%>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="${user.imgUrl}" class="layui-nav-img">
                ${user.nickname}
            </a>
            <%--TODO:管理员用户信息查询修改--%>
            <%--<dl class="layui-nav-child">--%>
                <%--<dd><a href="">基本资料</a></dd>--%>
                <%--<dd><a href="">安全设置</a></dd>--%>
            <%--</dl>--%>
        </li>
        <li class="layui-nav-item"><a id="adminUserLogout">登出</a></li>
    </ul>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var layer = layui.layer;
        $("#adminUserLogout").on('click', function () {
            $.ajax({
                url: '/user/logout',
                success: function (res) {
                    if (res.code == '-1') {
                        layer.msg('后台请求出错,请联系系统管理员')
                        return false;
                    } else {
                        layer.msg('登出...页面即将跳转...')
                        setTimeout(function () {
                            window.location.href = "/admin/login"
                        }, 1500)
                    }
                },
                error: function () {
                    layer.msg('后台请求出错,请联系系统管理员')
                    return false;
                }
            })
        })

    })
</script>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree">
            <%--layui-nav-itemed--%>
            <li class="layui-nav-item ">
                <a href="javascript:;">首页管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/index/match/focus">焦点比赛</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/index/article/carousel">轮播图管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">比赛管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/match/list">比赛信息查询</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/info/add">比赛信息录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/lineUp/add">比赛阵容录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/technology/add">比赛技术统计</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/process/add">比赛过程录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/result/add">比赛结果录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/match/highlights/add">比赛集锦录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">文章管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/article/list">文章查询</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/article/add">文章录入</a></dd>
                </dl>
            </li>
            <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;">国家队管理</a>--%>
            <%--<dl class="layui-nav-child">--%>
            <%--<dd><a href="country-list.jsp">国家队信息查询</a></dd>--%>
            <%--<dd><a href="country-add.jsp">国家队信息录入</a></dd>--%>
            <%--</dl>--%>
            <%--</li>--%>
            <li class="layui-nav-item">
                <a href="javascript:;">俱乐部管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/club/list">俱乐部信息查询</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/club/add">俱乐部基本信息录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/club/honer/add">俱乐部荣誉信息录入</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">球员管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/player/list">球员信息查询</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/player/add">球员基本信息录入</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/player/honer/add">球员荣誉信息录入</a></dd>
                </dl>
            </li>
            <%--layui-nav-itemed--%>
            <li class="layui-nav-item ">
                <a class="" href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/admin/user/list">用户信息查询</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/admin/user/add">用户信息录入</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
