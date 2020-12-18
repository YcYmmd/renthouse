<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div class="wapper" style="width: 500px;margin-top: 40px">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">修改密码</legend>
    </fieldset>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">原密码</label>
            <div class="layui-input-inline">
                <input type="hidden" name="id" value="${loginUser.userId }">
                <input type="password" name="oldPwd" required lay-verify="required" placeholder="原密码" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newPwd" required lay-verify="required|pass" placeholder="新密码"
                       autocomplete="off"
                       class="layui-input" lay-verify="pass">
            </div>
            <div class="layui-form-mid layui-word-aux">长度为5-12位字母加数字</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newPwdAgain" lay-verify="required|pass" placeholder="确认密码"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">长度为5-12位字母加数字</div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updatepwd">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'layer'], function () {
        let element = layui.element,
            form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;
        form.verify({
            pass: [
                /^[\S]{5,12}$/
                , '密码必须5到12位，且不能出现空格'
            ]
        });

        form.on('submit(updatepwd)', function () {
            let pwd = $("input[name='newPwd']").val();
            let pwd2 = $("input[name='newPwdAgain']").val();
            if (pwd !== pwd2) {
                layer.msg("两次输入密码密码不一样", {icon: 5});
                $("input[name='newpwdagain']").focus();
                return false;
            }
            $.post("${pageContext.request.contextPath}/user/updateUserPwd", $('form').serialize(), function (res) {
                if (res === "OK") {
                    layer.msg("密码修改成功，下次登录时生效！", {icon: 1,time: 2000},function () {
                        $("form")[0].reset();
                        top.document.location.reload();
                    });
                } else {
                    layer.msg("原密码错误", {icon: 5});
                }
            });
            return false;
        })
    });
</script>
</body>
</html>
