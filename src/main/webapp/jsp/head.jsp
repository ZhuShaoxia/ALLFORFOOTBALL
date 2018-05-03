<%@ page import="com.ccsu.core.user.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--导航栏-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
                <img src="${pageContext.request.contextPath}/img/logo-2.png" class="img-fluid"/>懂球儿
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/articles">文章</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/matches">比赛</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/data">数据</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/compare">球员对比</a>
                </li>
            </ul>
            <%
                User user = (User) session.getAttribute("user");
                if (user == null) {
            %>
            <%--未登录状态--%>
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="#login-modal" data-toggle="modal">登录</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/register" target="_blank">注册</a>
                </li>
            </ul>
            <%
            } else {
            %>
            <%--登录状态--%>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${user.imgUrl}"
                             style="width:25px;height: 25px">
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/user/center"><img class="tou-img"
                                                           src="${pageContext.request.contextPath}/img/head-userinfo.png">我的主页</a>
                        </li>
                        <%--<li><a href="#"><img class="tou-img" src="img/head-notification.png">通知</a></li>--%>
                        <li><a href="${pageContext.request.contextPath}/user/setting/info"><img class="tou-img"
                                                               src="${pageContext.request.contextPath}/img/head-setting.png">设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#" id="user-logout"><img class="tou-img"
                                             src="${pageContext.request.contextPath}/img/nav-head-out.png">退出</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>


        </div>
        <!--/.nav-collapse -->
    </div>
</nav>

<!--登录模态框-->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><img src="${pageContext.request.contextPath}/img/logo-2.png"
                                                               class="img-fluid"/>&nbsp;账号登录</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger alert-well">
                    <strong>您的信息有误,请重新输入!</strong>
                </div>
                <form role="form" id="loginForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="login-account" class="col-sm-3 control-label">账号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="login-account" name="login_account"
                                   placeholder="账号/邮箱/手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="login-password" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="login-password" name="login_pwd"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="loginBtn">登录</button>
                <button type="button" class="btn btn-success" id="forgetBtn">忘记密码</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<script>
    $("#user-logout").on('click',function () {
        $.ajax({
            url: '/user/logout',
            success: function (res) {
                if (res.code == '-1') {
                    alert('后台请求出错,请联系系统管理员')
                    return false;
                } else {
                    alert('登出...页面即将跳转...')
                    setTimeout(function () {
                        window.location.href = "/"
                    }, 1500)
                }
            },
            error: function () {
                alert('后台请求出错,请联系系统管理员')
                return false;
            }
        })
    })
</script>