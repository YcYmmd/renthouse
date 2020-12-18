<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"/>
    <title>欢迎来到房屋租赁网</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
</head>
<style type="text/css">
    * {
        padding: 0;
        margin: 0;
    }

    .dd {
        position: absolute;
        left: 0;
        top: 0;
        z-index: 1;
    }

    .news {
        position: absolute;
        width: 400px;
        height: 400px;
        left: 200px;
        top: 200px;
        z-index: 2;
    }

    .renthouse {
        position: absolute;
        left: 900px;
        top: 200px;
        z-index: 2;
    }
</style>
<body>
<!--轮播图-->
<div class="layui-carousel" id="bg-item">
    <div class="layui-header title">
        <div class="layui-container">
            <div class="layui-logo layui-pull-left">
                <img src="${pageContext.request.contextPath }/img/logo.png" height="50px" alt="房屋租赁系统">
            </div>
            <c:if test="${not empty loginUser }">
                <div class="personalCenter layui-pull-right">
                    <a href="${pageContext.request.contextPath}/user/home.html" target="_blank" style="color:#fff">
                        <i class="layui-icon layui-icon-tree"></i> 个人中心</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i> 登录 - 注册</div>
            </c:if>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/page1" class="news"><img src="/img/news.png" title="新闻"/></a>
    <a href="${pageContext.request.contextPath}/page2"  class="renthouse"><img src="/img/renthouse.png" title="租房"></a>
    <div carousel-item class="dd">
        <div style="background: url('/img/banner-3.jpg')no-repeat center/cover"></div>
        <div style="background: url('/img/banner-4.jpg')no-repeat center/cover"></div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter="" style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this">登录</li>
            <li>注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="userPassword" required lay-verify="required"
                                       placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit
                                    lay-filter="login">立即登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="" style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="userPassword" required lay-verify="required"
                                       placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="userPhoneNumber" required lay-verify="required|phone"
                                       placeholder="注册后可以在个人中心修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="userNickName" required lay-verify="required"
                                       placeholder="注册后可以在个人中心修改"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </form>
                    <div class="layui-form-item">
                        <input type="submit"
                               class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn"
                               value="立即注册"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['element', 'carousel', 'layer', 'form'], function () {
        let element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        let layer_index;
        carousel.render({
            elem: "#bg-item",
            width: "100%",
            height: "800px",
            anim: "fade"
        });
        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['360px', '460px'],
                title: "房屋租赁网",
                closeBtn: 2
            });
        });
        $('.list-item li').click(function () {
            $('.list-item li').removeClass('click-this');
            $(this).addClass('click-this');
        });

        $('.regist-btn').click(function () {
            if ($("input[name='userName']").val() != "" && $("input[name='userPassword']").val() != "" && $("input[name='userPhoneNumber']").val() != "" && $("input[name='userNickName']").val() != "") {
                $.post("${pageContext.request.contextPath}/user/register", $('.form').serialize(), function (res) {
                    if (res === 'OK') {
                        layer.close(layer_index);
                        layer.alert("注册成功", {icon: 1, time: 2000});
                        $('.form')[0].reset();
                    } else {
                        layer.msg("注册失败,用户名已存在");
                    }
                })
            } else {
                console.log($("input[name='userName']").val());
                console.log($("input[name='userPassword']").val());
                console.log($("input[name='userPhoneNumber']").val());
                console.log($("input[name='userNickName']").val());
                layer.msg("请正确填写所有表单");
            }
        });

        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/user/login", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.href = "/index.html";
                } else if (res == "baned"){
                    layer.msg("您的账号已经被封禁，请联系管理员进行解封！");
                } else {
                    layer.msg("用户名或者密码错误！");
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
