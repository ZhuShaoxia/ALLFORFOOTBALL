<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/27
  Time: 12:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

    <script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
    <script>
        $(function () {
            //加载ueditor编辑框
            var ue = UE.getEditor('ueditor')
        })
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>文章录入</legend>
            </fieldset>
            <%--
                文章标题
                文章副标题
                文章类型
                展示图片
                文章内容
            --%>
            <form action="" class="layui-form" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="title" class="layui-form-label">文章标题</label>
                        <div class="layui-input-block">
                            <input value="${article.title}" id="title" type="text" name="title" lay-verify="required"
                                   placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <input name="id" type="hidden" value="${article.id}">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="subtitle" class="layui-form-label">文章副标题</label>
                        <div class="layui-input-block">
                            <input value="${article.subtitle}" id="subtitle" type="text" name="subtitle"
                                   lay-verify="required" placeholder="请输入"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">文章类型</label>
                        <div class="layui-input-inline">
                            <select id="articleId" name="articleType.id">
                                <c:forEach items="${articleTypes}" var="articleType">
                                    <option value="${articleType.id}">${articleType.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">轮播图片</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">轮播图片</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg" src="${article.imgUrl}">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>编辑</legend>
                </fieldset>
                <div class="layui-form-item">
                    <div id="ueditor" style="height: 400px"></div>
                </div>

                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="article-update-submit">更新文章信息</button>
                        <a class="layui-btn layui-btn-primary" href="/admin/article/list">返回上一步</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="bottom.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/admin/article.js"></script>
</body>
</html>
<%--编辑框--%>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript" charset="UTF-8"
        src="${pageContext.request.contextPath}/ueditor/ueditor.parse.min.js"></script>
<script>
    $(function () {

        var ue = UE.getEditor('ueditor')
        ue.ready(function () {
            ue.execCommand('inserthtml', '${article.editorValue}');
        });

        layui.use('form', function () {
            var form = layui.form;

            $('#articleId').children().each(function (index, item) {
                if ($(item).val() == "${article.articleType.id}") {
                    $(item).prop("selected", true);
                    form.render('select')
                    return
                }
            })


            form.on('submit(article-update-submit)', function (data) {
                var imgUrl = $("#uploadImg").attr("src");
                if (typeof imgUrl == 'undefined') {
                    layer.msg('请上传轮播图片...')
                    return false;
                }

                var editorValue = ue.hasContents()
                if (!editorValue) {
                    layer.msg('编辑框内容为空，请输入')
                    ue.focus();
                    return false;
                }

                layer.confirm('请确认数据无误', {
                    btn: ['确定', '取消'],
                }, function (index) {
                    $.ajax({
                        data: data.field,
                        url: "/article/update?imgUrl=" + imgUrl,
                        success: function (res) {
                            if (res.code == '-1') {
                                layer.close(index)
                                layer.msg('后台请求出错,请联系系统管理员')
                                return false;
                            } else {
                                layer.msg('数据修改成功,页面即将跳转')
                                setTimeout(function () {
                                    window.location.href = "/admin/article/list"
                                }, 2000)
                            }
                        },
                        error: function () {
                            layer.msg('文章数据添加失败,请重新添加')
                            return false;
                        }
                    })
                }, function (index) {
                    layer.close(index)
                })
                return false;
            });
        })
    })
</script>