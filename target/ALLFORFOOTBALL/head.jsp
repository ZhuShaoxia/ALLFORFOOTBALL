<%--
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
            <a class="navbar-brand" href="index.jsp">
                <img src="img/logo-2.png" class="img-fluid"/>懂球儿
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="index.jsp">首页</a>
                </li>
                <li>
                    <a href="articleList.jsp">文章</a>
                </li>
                <li>
                    <a href="game-list.jsp">比赛</a>
                </li>
                <li>
                    <a href="data.jsp">数据</a>
                </li>
                <%--<li>--%>
                <%--<a href="#contact">校园联赛</a>--%>
                <%--</li>--%>
            </ul>
            <%--<form class="navbar-form navbar-left" role="search">--%>
                <%--<div class="form-group">--%>
                    <%--<input type="text" class="form-control" placeholder="Search">--%>
                <%--</div>--%>
                <%--<button type="submit" class="btn btn-default">搜索</button>--%>
            <%--</form>--%>
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="#login-modal" data-toggle="modal">登录</a>
                </li>
                <li>
                    <a href="register.jsp" target="_blank">注册</a>
                </li>
            </ul>
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
                <h4 class="modal-title" id="myModalLabel"><img src="img/logo-2.png" class="img-fluid"/>&nbsp;账号登录</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger alert-well">
                    <strong>您的信息有误,请重新输入!</strong>
                </div>
                <form role="form" id="loginForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="account" class="col-sm-3 control-label">账号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="account" name="login_account" placeholder="昵称/邮箱/手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="password" name="login_pwd"
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
