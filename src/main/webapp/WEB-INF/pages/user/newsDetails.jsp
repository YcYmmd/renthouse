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
                <h2 class="house-title">${news.title}</h2>
            </div>
        </div>
    </div>
</header>

<section class="layui-container wrapper">
    <p class="breadcrumb">
        <span class="layui-breadcrumb" lay-separator=">">
          <a href="${pageContext.request.contextPath}/index.html">首页</a>
          <a href="">新闻详情</a>
        </span>
    </p>
    <div class="carousel-image layui-pull-left layui-col-md7" style="margin-left: 200px;">
        <div class="layui-carousel" id="details-image">
            <div carousel-item style="float: left; margin: 0 auto">
                <c:forEach items="${DetailsImg }" var="d">
                    <div style="background: url('${d}')no-repeat center/cover"></div>
                </c:forEach>
            </div>
        </div>
        <p style="float:left;">${news.content}</p>
    </div>
</section>


<script src="${pageContext.request.contextPath}/layui/layui.js"></script>

<script>
    layui.use(['element', 'carousel', 'layer', 'form'], function () {
        let element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        let layer_index;
        carousel.render({
            elem: "#details-image",
            width: "100%",
            height: "400px",
            anim: "default"
        });

    });
</script>
</body>
</html>
