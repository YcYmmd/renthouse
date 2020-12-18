<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_848666_pri5cwk3xde.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commentList.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-2.1.1.min.js"></script>
</head>
<body>
<header>
    <div class="layui-header title">
        <div class="layui-container">
            <div class="layui-pull-left">
                <a href="${pageContext.request.contextPath}/index.html" target="_blank">
                    <img src="${pageContext.request.contextPath}/img/logo.png" height="50px">
                </a>
            </div>
            <c:if test="${not empty loginUser }">
                <div class="personalCenter layui-pull-right">
                    <a href="${pageContext.request.contextPath}/user/home.html" target="_blank" style="color:#fff">
                        <i class="layui-icon layui-icon-tree"></i> 个人中心</a></div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i> 登录 - 注册</div>
            </c:if>
        </div>
    </div>
    <div class="details-head">
        <!-- title -->
        <div class="title-wrapper">
            <div class="left-con">
                <h2 class="house-title">${Details.houseDesc}</h2>
                <p class="tags">
                    <span>户型方正，采光好，格局好。</span>
                </p>
            </div>
        </div>
    </div>
</header>

<section class="layui-container wrapper">
    <p class="breadcrumb">
        <span class="layui-breadcrumb" lay-separator=">">
          <a href="${pageContext.request.contextPath}/index.html">首页</a>
          <a href="">房屋详情</a>
        </span>
    </p>
    <div class="carousel-image layui-pull-left layui-col-md7">
        <div class="layui-carousel" id="details-image">
            <div carousel-item style="float: left;">
                <c:forEach items="${DetailsImg }" var="d">
                    <div style="background: url('${d}')no-repeat center/cover"></div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="details-info layui-pull-right layui-col-md5 ">
        <div class="show-price">
            <span class="sale-price">${Details.housePrice }</span>
            <span class="sale-unit">元/月</span>
            <span class="area">${Details.houseType } 押一付三</span>
        </div>
        <hr>
        <div class="show-house-name">
            <p><span class="field">小区名称：</span><span class="name">${Details.communityName }</span></p>
            <p><span class="field">小区地址：</span><span class="name">${Details.houseAddress }</span></p>
            <p><span class="field">周边学校：</span><span class="name">请联系经纪人</span></p>
            <p><span class="field">联系电话：</span><span class="name">${Details.houseLinkMan }</span></p>
        </div>
        <hr>
        <div class="house-model">
            <ul>
                <li>
                    <p>${Details.houseModel }</p>
                    <span>规模</span>
                </li>
                <li>
                    <p>${Details.houseArea }平米</p>
                    <span>建筑面积</span>
                </li>
                <li>
                    <p>${Details.houseOriented}</p>
                    <span>朝向</span>
                </li>
            </ul>
        </div>
        <hr>
        <div class="order-btn-container">
            <c:if test="${isCollected=='0'}">
                <img id="collect" src="${pageContext.request.contextPath}/img/collect.png" style="margin-left: 40px;margin-bottom: 15px;" title="收藏"/>
            </c:if>
            <c:if test="${isCollected=='1'}">
                <img id="cancelCollect" src="${pageContext.request.contextPath}/img/collected.png" style="margin-left: 40px;margin-bottom: 15px;" title="收藏"/>
            </c:if>
            <input type="hidden" class="HID" value="${Details.houseId}">
            <input type="hidden" class="userName" value="${loginUser.userName}">
            <c:if test="${isOrdered=='0'}">
                <button class="order-btn">现在预定</button>
            </c:if>
            <c:if test="${isOrdered=='1'}">
                <button class="order-btn" disabled="true">您已成功预定</button>
            </c:if>
        </div>
    </div>
    <div>
        <textarea id="commentArea" class="layui-textarea" placeholder="请输入您的评论" style="width: 900px; float: left;">
        </textarea>
        <div>
            <button id="comment" class="layui-btn" lay-submit lay-filter="formDemo" style="float: right; margin-right: 120px; margin-top: 60px;">提交评论</button>
        </div>
    </div>
</section>
<c:forEach items="${commentList}" var="comment">
    <div class="comments" style="margin-left: 115px; margin-top: 50px;">
        <div class="comment-wrap">
            <div class="photo">
                <div class="avatar" style="background-image: url('${comment.userAvatar}')"></div>
            </div>
            <div class="comment-block">
                <p class="comment-text">${comment.userName}说：</p>
                <p class="comment-text">${comment.commentContent}</p>
                <div class="bottom-comment">
                    <ul class="comment-actions">
                        <c:if test="${comment.userId==loginUser.userId || loginUser.isAdmin=='1'}">
                            <li class="reply" style="margin-right: 20px;">
                                <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="delComment(${comment.commentId})">删除</button>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<footer>
    <p>2018-2020 &copy; 房屋租赁网 懂您的需求 服务于心</p>
</footer>
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
                                       placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="userNickName" required lay-verify="required"
                                       placeholder="注册后不能修改"
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
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    function delComment(commentId) {
        layer.confirm('确认删除当前评论么？',{icon: 0,shade: 0.1},function (index) {
            $.ajax({
                "url": "${pageContext.request.contextPath}/delComment?commentId="+commentId,
                "type": "get",
                "datatype":"json",
                "success": function (response) {
                    if (response.data == "OK") {
                        layer.msg("评论删除成功！",{time: 2000});
                        window.location.reload();
                        return;
                    } else {
                        layer.msg("评论删除失败！",{time: 2000});
                        return;
                    }
                },
                "error": function (response) {
                    layer.msg("删除失败，请检查网络！");
                }
            });
        });
    }
</script>
<script>
    layui.use(['element', 'carousel', 'layer', 'form'], function () {
        let element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        $('#commentArea').val("");
        let layer_index;
        carousel.render({
            elem: "#details-image",
            width: "100%",
            height: "400px",
            anim: "default"
        });

        $('#collect').click(function () {
            if ($(".userName").val() === "" || $(".userName").val() === null) {
                layer.msg("请先登录再点击收藏!");
                return ;
            }

            var userId = ${loginUser.userId == null ? 0 : loginUser.userId};
            var houseId = ${Details.houseId};
            $.ajax({
                "url": "${pageContext.request.contextPath}/collect?userId="+userId+"&houseId="+houseId,
                "type": "get",
                "datatype": "json",
                "success": function (response) {
                    if (response.data == "OK") {
                        layer.msg("收藏成功",{time:2000});
                        window.location.reload();
                        return;
                    } else {
                        layer.msg("收藏失败",{time:2000});
                        return;
                    }
                },
                "error": function (response) {
                    layer.msg("收藏失败，网络错误！");
                }
            });
        });

        $('#cancelCollect').click(function () {
            if ($(".userName").val() === "" || $(".userName").val() === null) {
                layer.msg("请先登录再取消收藏!");
                return ;
            }

            var userId = ${loginUser.userId == null ? 0 : loginUser.userId};
            var houseId = ${Details.houseId};
            $.ajax({
                "url": "${pageContext.request.contextPath}/cancelCollect?userId="+userId+"&houseId="+houseId,
                "type": "get",
                "datatype": "json",
                "success": function (response) {
                    if (response.data == "OK") {
                        layer.msg("取消收藏成功",{time:2000});
                        window.location.reload();
                        return;
                    } else {
                        layer.msg("取消收藏失败",{time:2000});
                        return;
                    }
                },
                "error": function (response) {
                    layer.msg("取消收藏失败，网络错误！");
                }
            });
        });

        $('#comment').click(function () {
            if ($("input[id='commentArea']").val() != "") {
                if ($(".userName").val() === "" || $(".userName").val() === null) {
                    layer.msg("请先登录再发送评论!");
                    return ;
                }
                var data = $('#commentArea').val();
                $.ajax({
                    "url": "${pageContext.request.contextPath}/comment?commentContent="+data+"&houseId="+${Details.houseId},
                    "type": "get",
                    "datatype":"json",
                    "success": function (response) {
                        if (response.data == "OK") {
                            layer.msg("评论发送成功！");
                            window.location.reload();
                            return;
                        } else {
                            layer.msg("评论发送失败，请重新发送！");
                            return;
                        }
                    },
                    "error": function (response) {
                        layer.msg("发送失败，请检查网络！");
                    }
                });
            } else {
                layer.msg("请先输入您的评论！");
            }
        });

        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['360px', '460px'],
                title: "房屋租赁",
                closeBtn: 2
            });
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
                layer.msg("请填写所有表单");
            }
        });
        $(".order-btn").click(function () {
            if ($(".userName").val() === "" || $(".userName").val() === null) {
                layer.alert("您还没登录，请先登录再操作", {icon: 5});
                return;
            }
            $.post("${pageContext.request.contextPath}/order/addOrder", {id: $(".HID").val()}, function (data) {
                const oOrder = $(".order-btn");
                if (data === "OK") {
                    layer.alert("恭喜你，预定成功！", {icon: 1});
                    oOrder.addClass("layui-btn-disabled");
                    oOrder.html("你已成功预定");
                    oOrder.off("click");
                }
            });
        });
        form.on("submit(login)", function () {
            $.post("${pageContext.request.contextPath}/user/login", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.reload();
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
