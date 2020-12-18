<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有新闻信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">所有新闻信息</legend>
    </fieldset>
    <table id="allNews" lay-filter="news"></table>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table'], function () {
        let element = layui.element,
            $ = layui.jquery,
            table = layui.table;

        // 模板选择器
        let dt = table.render({
            id: "newsTable",
            elem: "#allNews",
            url: "${pageContext.request.contextPath}/news/newsList",
            limit:5,
            page:{ //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                ,limits:[5,10,15]
                ,first: false //不显示首页
                ,last: false //不显示尾页
            },
            cols: [[
                {field: 'newsId', title: '序号', align: 'center'},
                {field: 'title', title: '标题', align: 'center'},
                {field: 'content', title: '内容', align: 'center'},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]]
        });

        table.on('tool(news)', function (obj) {
            // 表格的一行
            let data = obj.data;
            // 该行的点击事件
            let layEvent = obj.event;
            let tr = obj.tr;
            let currPage = dt.config.page.curr;

            if (layEvent === "edit") {
                window.location = "/admin/updateNews.html?newsId=" + data.newsId;
            }


            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                    $.post("${pageContext.request.contextPath}/news/deleteNews", {newsId: data.newsId}, function (success) {
                        if (success === "OK") {
                            obj.del();
                            dt.reload({
                                page: {curr: 1}
                            });
                            layer.msg("删除成功");
                        }
                    })
                });
            }
        });
    })
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>
</body>
</html>