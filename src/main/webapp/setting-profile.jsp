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
    <link rel="stylesheet" type="text/css" href="css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/user-info.css"/>
    <link rel="stylesheet" type="text/css" href="css/ImgCropping.css">
    <link rel="stylesheet" type="text/css" href="css/cropper.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cropper.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap-select.min.js" type="text/javascript" charset="utf-8"></script>

    <%--select2插件CDN--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <%--表单验证--%>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>


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

    .editing {
        display: none;
    }

</style>
<script>
    $(function () {
        $(".js-data-example-ajax").select2()
        //    select2配置
        $(".js-data-example-ajax").select2({
            placeholder: '俱乐部/国家',

//          参考地址：https://select2.org/data-sources/ajax
            ajax: {
                url: 'https://api.github.com/search/repositories',
                dataType: 'json'
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            }
        });
    })


    function editingBtn() {
        var spans = $(".userinfo-edit-item-right").children("span")
        spans.hide()
        $(".editing").show()
    }

    function saveBtn() {
        var spans = $(".userinfo-edit-item-right").children("span")
        spans.show()
        $(".editing").hide()
    }
</script>

<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row" style="margin-bottom: 30px">
        <ul class="nav nav-tabs nav-justified" style="background-color:rgb(220,220,220)">
            <li class="active"><a href="#">基本资料</a></li>
            <li><a href="setting-bind.jsp">账号绑定</a></li>
            <li><a href="setting-changePwd.jsp">密码修改</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-2">
            <!--头像-->
            <div style="width: 150px;height: 150px;border: solid 1px beige">
                <img id="finalImg" alt="请上传头像" src="img/head-img-icon.png" style="width: 150px;height: 150px">
            </div>
            <div class="editing">
                <button class="l-btn" style="margin-left: 33px;margin-top: 5px" id="replaceImg">更换头像</button>
            </div>
        </div>
        <div class="col-md-10">
            <div class="userinfo-head">
                <!--昵称-->
                <h1>少侠我姓朱</h1>
            </div>
            <div class="userinfo-edit-fileds">
                <div class="userinfo-edit-item">
                    <span class="col-md-2">姓名</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <!--姓名-->
                        <span>朱晓磊</span>
                        <div class="editing">
                            <input type="text" class="form-control" id="" placeholder="请输入姓名"
                                   value="朱晓磊">
                        </div>
                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">性别</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span>男</span>
                        <div class="editing">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="" value="" checked><span>男</span>
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="" value=""><span>女</span>
                            </label>
                        </div>
                    </div>
                </div>

                <%--<div class="userinfo-edit-item">--%>
                    <%--<!--邮箱-->--%>
                    <%--<span class="col-md-2">邮箱</span>--%>
                    <%--<div class="col-md-8 userinfo-edit-item-right">--%>
                        <%--<span>zhu_xl@hisuntech.com</span>--%>
                        <%--<div class="editing">--%>
                            <%--<input type="text" class="form-control" id="firstname" placeholder="请输入邮箱"--%>
                                   <%--value="zhu_xl@hisuntech.com">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="userinfo-edit-item">
                    <span class="col-md-2">主队</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span><img src="img/club/spanish/fcb_club.png" style="margin-bottom: 3px">&nbsp;巴塞罗那</span>
                        <div class="editing">
                            <%--<select class="form-control" style="width: 100px;display: inline-block">--%>
                            <%--<option>俱乐部</option>--%>
                            <%--<option>国家队</option>--%>
                            <%--</select>--%>
                            <%--<select class="selectpicker" data-live-search="true" title="选择下列一种"--%>
                            <%--style="width: 100px;display: inline-block">--%>
                            <%--<option title="aaa">123123</option>--%>
                            <%--<option title="bbb">俱1乐部</option>--%>
                            <%--</select>--%>
                            <!--<select class="selectpicker" data-live-search="true" style="width: 100px;display: inline-block">-->
                            <!--&lt;!&ndash;<option data-tokens="ketchup mustard">查询设备</option>&ndash;&gt;-->
                            <!--<option>俱乐部</option>-->
                            <!--<option>国家队</option>-->
                            <!--</select>-->
                            <select class="js-data-example-ajax">
                                <option value="">123</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">简介</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <span>It's My Life  </span>
                        <div class="editing">
                            <textarea name="" cols="30" rows="3" class="form-control" style="resize: none;">It's My Life</textarea>
                        </div>

                    </div>
                </div>
                <div class="userinfo-edit-item">
                    <span class="col-md-2">注册时间</span>
                    <div class="col-md-8 userinfo-edit-item-right">
                        <p style="font-size: 18px;color: #ff3b59;">2018年02月01日21:43:40</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="margin-top: 10px;">
            <a class="btn btn-primary" style="margin-left: 450px" onclick="editingBtn()">编辑</a>
            <a class="btn btn-success" style="margin-left: 20px" onclick="saveBtn()">保存</a>
        </div>
    </div>
</div>

<!--图片裁剪框 start-->
<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
        <div class="tailoring-content-one">
            <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden"
                       onchange="selectImg(this)">
                选择图片
            </label>
            <div class="close-tailoring" onclick="closeTailor(this)">×</div>
        </div>
        <div class="tailoring-content-two">
            <div class="tailoring-box-parcel">
                <img id="tailoringImg">
            </div>
            <div class="preview-box-parcel">
                <p>图片预览：</p>
                <div class="square previewImg"></div>
                <div class="circular previewImg"></div>
            </div>
        </div>
        <div class="tailoring-content-three">
            <button class="l-btn cropper-reset-btn">复位</button>
            <button class="l-btn cropper-rotate-btn">旋转</button>
            <button class="l-btn cropper-scaleX-btn">换向</button>
            <button class="l-btn sureCut" id="sureCut">确定</button>
        </div>
    </div>
</div>
<!--图片裁剪框 end-->
<script>

    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768) {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": 0
            });
        } else {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": (win_width - $(".tailoring-content").outerWidth()) / 2
            });
        }
    })();

    //弹出图片裁剪框
    $("#replaceImg").on("click", function () {
        $(".tailoring-container").toggle();
    });

    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc, false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(file.files[0]);
    }

    //cropper图片裁剪
    $('#tailoringImg').cropper({
        aspectRatio: 1 / 1,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function (e) {
            // 输出结果数据裁剪图像。
        }
    });
    //旋转
    $(".cropper-rotate-btn").on("click", function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click", function () {
        $('#tailoringImg').cropper("reset");
    });
    //换向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click", function () {
        if (flagX) {
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        } else {
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });

    //裁剪后的处理
    $("#sureCut").on("click", function () {
        if ($("#tailoringImg").attr("src") == null) {
            return false;
        } else {
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
            $("#finalImg").prop("src", base64url);//显示为图片的形式

            console.log(base64url)

            var index = base64url.indexOf(',')
            console.log("index=" + index)
            base64url = base64url.substr(0, index)

            //关闭裁剪框
            closeTailor();
        }
    });

    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
    }


</script>

<%@include file="bottom.jsp" %>
</body>
</html>
<script type="text/javascript" src="js/head.js"></script>

