<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的评论</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">我的评论信息</legend>
    </fieldset>
    <table id="commentList" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        let element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        let dt = table.render({
            elem: "#commentList",
            url: "${pageContext.request.contextPath}/comment/myComment",
            page: true,
            method: 'post',
            limit: 10,
            loading: true,
            cols: [[
                {field: 'commentId', title: '序号', align: 'center'},
                {field: 'commentContent',title: '评论内容', align: 'center'},
                {field: 'commentHouseId',title: '房屋序号',align: 'center'},
                {field: 'commentHouse',title: '房屋名称', align: 'center'},
                , {title: '操作', align: 'center', toolbar: "#tools",width: '112'}
            ]],
            done: function(res, curr, count){
                $("[data-field=commentHouseId]").css('display','none');
            }
        });

        table.on('tool(order)', function (obj) {
            let data = obj.data;
            let layEvent = obj.event;
            let tr = obj.tr;
            let currPage = dt.config.page.curr;

            if (layEvent === "view") {
                window.open("${pageContext.request.contextPath}/detail.html?id="+data.commentHouseId);
            }

            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                    $.post("${pageContext.request.contextPath}/comment/deleteComment", {commentId: data.commentId}, function (success) {
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
    });
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="view">查看</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>
</body>
</html>