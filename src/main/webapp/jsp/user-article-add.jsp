<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-info.css"/>
    <%--多选框插件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-article-add.css"/>


    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/user-article.js" type="text/javascript" charset="utf-8"></script>
    <%--多选框js--%>
    <script src="${pageContext.request.contextPath}/js/chosen.jquery.js" type="text/javascript"
            charset="utf-8"></script>


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
<body>
<%@include file="head.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li><a href="${pageContext.request.contextPath}/user/center">个人信息</a></li>
                <c:if test="${user.role==2}">
                    <li class="active"><a href="${pageContext.request.contextPath}/user/article">我发表的文章</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/user/comment">评论</a></li>
                <li><a href="${pageContext.request.contextPath}/user/setting/info">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <form id="user-article-add-form" action="/article/userAdd" method="post" enctype="multipart/form-data">
                <div class="row article-add-head">
                    <h3>添加新文章</h3>
                    <table class="table table-bordered">
                        <tr>
                            <td><strong>文章标题：</strong></td>
                            <td><input name="title" id="title" type="text"></td>
                        </tr>
                        <tr>
                            <td><strong>文章副标题</strong></td>
                            <td><input name="subtitle" id="subtitle" type="text"></td>
                        </tr>
                        <tr>
                            <td><strong>文章展示图片</strong></td>
                            <td><input id="imgUrl" name="file" multiple="multiple" type="file"></td>
                        </tr>

                        <tr>
                            <td><strong>文章类型</strong></td>
                            <td>
                                <select name="articleType.id" id="articleTypeId" class="chosen-select">
                                    <c:forEach items="${articleTypes}" var="articleType">
                                        <option value="${articleType.id}">${articleType.type}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="ueditor" class="row article-add-body">

                </div>
                <div class="row article-add-bottom">
                    <button id="user-article-add-btn" type="submit" class="btn btn-success">
                        提交
                    </button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
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
//        var lis = $("ul[class='chzn-choices'] span")
        var lis = $("ul[class='chzn-choices']")

        $(".chosen-select").chosen()
        $(".chosen-select").chosen({
            max_selected_options: 3
        })


        /**
         * 表单验证
         */
        $("#user-article-add-form").validate({
            rules: {
                title: {
                    required: true
                },
                subtitle: {
                    required: true
                },
                imgUrl: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: "文章标题不能为空"
                },
                subtitle: {
                    required: "该项为必输项"
                },
                imgUrl: {
                    required: "请上传轮播图片"
                }
            }
        })

        /**
         * 编辑框初始化
         */
        var ue = UE.getEditor('ueditor')

        /**
         * 图片上传
         */
        $("#file").on('change', function () {
            var imgUrl = $("#imgUrl").val()
            checkImg(imgUrl)
        })

        /**
         *表单数据提交
         */
        $("#user-article-add-btn").on('click', function () {
            var imgUrl = $("#imgUrl").val()
            if (!checkImg(imgUrl)) {
                return false;
            }

            if (!ue.hasContents()) {
                alert('请输入文章内容后提交');
                ue.focus()
                return false;
            }
            if ($("#user-article-add-form").valid()) {
                $("#user-article-add-form").submit()

//                var formObject = {};
//                var formArray = $("#user-article-add-form").serializeArray();
//                $.each(formArray, function (i, item) {
//                    formObject[item.name] = item.value;
//                });
//                var formJson = JSON.stringify(formObject);
//                console.log(formJson)
//                $.ajax({
//                    type: 'POST',
//                    data: formJson,
//                    url: '/article/userAdd',
//                    success: function (res) {
//                        if (res.code == '-1') {
//                            alert('后台请求出错,请求出错')
//                        } else {
//                            alert('文章添加成功 请返回查看')
//                            window.location.href = '/user/article'
//                        }
//                    }
//                })
            }

        })
    })

    /**
     * 检查是否为图片
     * @param file
     * @returns {boolean}
     */
    function checkImg(imgUrl) {
        if (imgUrl == null) {
            return false;
        }
        if (!/.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(imgUrl)) {
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
            return false
        }
        return true;
    }

</script>