<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/navbar_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-article-add.css"/>

    <%--多选框插件--%>
    <link rel="stylesheet" href="css/chosen.css">

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="js/user-article.js" type="text/javascript" charset="utf-8"></script>
    <%--多选框js--%>
    <script src="js/chosen.jquery.js" type="text/javascript" charset="utf-8"></script>


    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<style>
    .navbar-brand img {
        display: inline-block;
    }

    .modal input {
        width: 200px;
    }

    /*侧边导航栏颜色*/
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
        background-color: #8bfdff;
    }

</style>
<script>
    $(function () {
        $(".chosen-select").chosen()
        var ue = UE.getEditor('ueditor')
    })
</script>
<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li><a href="user-center.jsp">个人信息</a></li>
                <li><a href="user-comment.jsp">评论</a></li>
                <li class="active" style="cursor: pointer"><a href="user-article.jsp">我发表的文章</a></li>
                <li><a href="setting-profile.jsp">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row article-add-head">
                <h3>添加新文章</h3>
                <table class="table table-bordered">
                    <tr>
                        <td><strong>文章标题：</strong></td>
                        <td><input id="head" type="text"></td>
                    </tr>
                    <tr>
                        <td><strong>文章副标题</strong></td>
                        <td><input id="subhead" type="text"></td>
                    </tr>
                    <tr>
                        <td><strong>标签</strong></td>
                        <td>
                            <select multiple class="chosen-select chosen-rtl" tabindex="14" data-placeholder="请输入适当的标签">
                                <option value=""></option>
                                <option>American Black Bear</option>
                                <option>Asiatic Black Bear</option>
                                <option>Brown Bear</option>
                                <option>Giant Panda</option>
                                <option selected>Sloth Bear</option>
                                <option selected>Polar Bear</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>文章类型</strong></td>
                        <td>
                            <select name="" id="" class="chosen-select">
                                <option value="0">全部</option>
                                <option value="1">头条</option>
                                <option value="2">转会</option>
                                <option value="3">中超</option>
                                <option value="4">西甲</option>
                                <option value="5">英超</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="ueditor" class="row article-add-body">

            </div>
            <div class="row article-add-bottom">
                <button class="btn btn-success">提交</button>
                <button class="btn btn-success">提交</button>
            </div>

        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="js/head.js"></script>
<%--编辑框--%>
<script src="ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript" charset="UTF-8" src="ueditor/ueditor.parse.min.js"></script>
