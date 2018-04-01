<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/3/27
  Time: 12:42
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../img/logo-2.png" rel="shortcut icon"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>懂球儿-后台管理</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../js/jquery.min.js"></script>
    <script src="../layui/layui.all.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%@include file="../admin/head-nav.jsp" %>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>球员基本信息录入</legend>
            </fieldset>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label for="uploadBtn" class="layui-form-label">球员长相</label>
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="uploadBtn">上传头像</button>
                                <div class="layui-upload-list">
                                    <img style="width: 92px;height: 92px;" class="layui-upload-img"
                                         id="uploadImg">
                                    <p id="imgText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">球员姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">外文名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">俱乐部</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">位置</label>
                        <div class="layui-input-inline">
                            <select>
                                <option>前锋</option>
                                <option>前锋</option>
                                <option>前锋</option>
                                <option>前锋</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">号码</label>
                        <div class="layui-input-inline">
                            <input type="text" name="email" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">国籍</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">生日</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="birthday">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">年龄</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input"
                                   disabled>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">身高</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">体重</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">惯用脚</label>
                        <div class="layui-input-inline">
                            <select>
                                <option>左脚</option>
                                <option>右脚</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">力量</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">速度</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">射门</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">传球</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>

                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">盘带</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">防守</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" lay-verify="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <%--按钮--%>
                <div class="layui-form-item" style="padding: 20px;text-align: center">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@include file="../admin/bottom.jsp" %>
</div>
<script src="../js/admin/player.js"></script>
</body>
</html>
