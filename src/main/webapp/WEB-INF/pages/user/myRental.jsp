<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我发布的租房信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">我发布的租房信息</legend>
    </fieldset>
    <table id="houseList" lay-filter="house"></table>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['element', 'table', 'util'], function () {
        let element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        let dt = table.render({
            elem: "#houseList",
            url: "${pageContext.request.contextPath }/house/findUserHouse",
            limit:5,
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                ,limits:[5,10,15]
                ,first: false //不显示首页
                ,last: false //不显示尾页
            },
            cols: [[
                {field: 'houseId', title: '序号', align: 'center'},
                {
                    field: 'publishTime', title: '发布时间', align: 'center', templet: function (d) {
                        return util.toDateString(d.publishTime)
                    }
                },
                {field: 'publisher', title: '发布人', align: 'center'},
                {field: 'houseDesc', title: '描述', align: 'center'},
                {field: 'houseModel', title: '类型', align: 'center'},
                {field: 'houseArea', title: '面积', align: 'center'},
                {field: 'houseFloor', title: '楼层', align: 'center'},
                {field: 'houseType', title: '出租方式', align: 'center'},
                {field: 'housePrice', title: '出租价格', align: 'center'},
                {field: 'houseAddress', title: '地址', align: 'center'},
                {field: 'communityName', title: '小区名字', align: 'center'},
                {field: 'houseLinkMan', title: '联系电话', align: 'center'},
                {field: 'houseOriented', title: '房屋朝向', align: 'center'},
                {field: 'houseExamine',title: '审核状态',align: 'center',width: 80},
                {title: '操作', align: 'center', toolbar: "#tools", width: 190}
            ]],
            done: function (res,curr,count) {
                $("[data-field = 'houseExamine']").children().each(function () {
                    if ($(this).text() == "1") {
                        $(this).text("已审核");
                    } else if ($(this).text() == "0"){
                        $(this).text("未审核");
                    }
                });
            }
        });

        table.on('tool(house)', function (obj) {
            let data = obj.data;
            let layEvent = obj.event;
            let tr = obj.tr;
            let currPage = dt.config.page.curr;
            if (layEvent === "view") {
                window.open("${pageContext.request.contextPath}/detail.html?id="+data.houseId);
            }
            if (layEvent === "edit") {
                window.location.href = "${pageContext.request.contextPath}/user/updateHouse.html?houseId=" + data.houseId;
            }
            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                    $.post("${pageContext.request.contextPath}/house/deleteUserHouse", {houseId: data.houseId}, function (success) {
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
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>

</body>
</html>