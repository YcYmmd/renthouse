<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div class="wapper" style="width: 500px;margin-top: 40px">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">修改个人信息</legend>
    </fieldset>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">修改用户名</label>
            <div class="layui-input-inline">
                <input type="hidden" name="userId" value="${loginUser.userId }">
                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">修改昵称</label>
            <div class="layui-input-inline">
                <input type="text" name="userNickName" required lay-verify="required" placeholder="请输入昵称" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">修改手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="userPhoneNumber" required lay-verify="required" placeholder="请输入手机号码" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">修改头像</label>
            <div class="layui-input-inline">
                <button type="button" class="layui-btn layui-btn-primary" id="avatar">上传图片</button>
                <img id="simpleImg" width="60px" height="60px">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateInfo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'layer','upload'], function () {
        let element = layui.element,
            form = layui.form,
            $ = layui.jquery,
            upload = layui.upload,
            layer = layui.layer;
        form.on('submit(updateInfo)', function () {
            $.post("${pageContext.request.contextPath}/user/updateUserInfo", $('form').serialize(), function (res) {
                if (res === "OK") {
                    layer.msg("个人信息修改成功！", {icon: 1,time: 2000},function () {
                        $("form")[0].reset();
                        top.document.location.reload();
                    });
                } else {
                    layer.msg("个人信息修改失败！", {icon: 5});
                }
            });
            return false;
        });
        //简介图片上传
        upload.render({
            elem: "#avatar",
            url: "${pageContext.request.contextPath}/user/updateAvatar",
            field: 'avatar',
            done: function (res, index, upload) {
                //假设code = 0代表上传成功
                const oSingleUp = $("#simpleImg");
                if (res.code === 0) {
                    layer.msg("头像上传成功！", {icon: 1});
                    oSingleUp.attr("src", res.image);
                    oSingleUp.addClass("layui-btn-disabled");
                    oSingleUp.off("click");
                }
            }
        });
    });
</script>
</body>
</html>
