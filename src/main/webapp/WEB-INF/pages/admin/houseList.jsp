<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有房源信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">所有房源信息</legend>
    </fieldset>
    <table id="allHouse" lay-filter="house"></table>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table'], function () {
        let element = layui.element,
            $ = layui.jquery,
            table = layui.table;

        // 模板选择器
        let dt = table.render({
            id: "houseTable",
            elem: "#allHouse",
            url: "${pageContext.request.contextPath}/admin/houseList",
            limit:5,
            page:{ //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                ,limits:[5,10,15]
                ,first: false //不显示首页
                ,last: false //不显示尾页
            },
            cols: [[
                {field: 'houseId', title: '序号', align: 'center', width: 50},
                {field: 'houseDesc', title: '房屋详情', align: 'center', minWidth: 140},
                {field: 'houseModel', title: '几室几厅', align: 'center', width: 70},
                {field: 'houseArea', title: '面积', align: 'center', width: 70},
                {field: 'houseFloor', title: '楼层', align: 'center',width:60},
                {field: 'houseType', title: '出租方式', align: 'center',width: 80},
                {field: 'housePrice', title: '价格', align: 'center',width:60},
                {field: 'houseAddress', title: '地址', align: 'center'},
                {field: 'houseLinkMan', title: '联系人', align: 'center',width: 100},
                {field: 'communityName', title: '小区名', align: 'center',width: 80},
                {field: 'houseOriented', title: '朝向', align: 'center',width:70},
                {field: 'publisher', title: '发布人', align: 'center',width: 80},
                {field: 'houseExamine',title: '审核状态',align: 'center',width: 80},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]],
            done: function (res,curr,count) {
                $("[data-field = 'houseExamine']").children().each(function () {
                    if ($(this).text() == "1") {
                        $(this).text("已审核");
                    } else  if ($(this).text() == "0"){
                        $(this).text("未审核");
                    }
                });
            }
        });

        table.on('tool(house)', function (obj) {
            // 表格的一行
            let data = obj.data;
            // 该行的点击事件
            let layEvent = obj.event;
            let tr = obj.tr;
            let currPage = dt.config.page.curr;

            if (layEvent === "edit") {
                window.location = "updateHouse.html?houseId=" + data.houseId;
            }

            if (layEvent === "examine") {
                layer.confirm('确认当前房源审核通过么？',{icon: 0,shade: 0.1},function (index) {
                    $.post("${pageContext.request.contextPath}/admin/examineHouse",{houseId: data.houseId},function (success) {
                        if (success === "OK") {
                            layer.msg("审核成功");
                            table.reload('houseTable', {
                                page: {
                                    curr: $(".layui-laypage-skip").find("input").val()
                                }
                            }, 'data');
                        } else {
                            layer.msg("审核失败，请检查网络！");
                        }
                    })
                });
            }

            if (layEvent === "cancelExamine") {
                layer.confirm('确认取消当前房源的上线吗？',{icon: 0,shade: 0.1},function (index) {
                    $.post("${pageContext.request.contextPath}/admin/cancelExamineHouse",{houseId: data.houseId},function (success) {
                        if (success === "OK") {
                            layer.msg("取消成功");
                            table.reload('houseTable', {
                                page: {
                                    curr: $(".layui-laypage-skip").find("input").val()
                                }
                            }, 'data');
                        } else {
                            layer.msg("取消失败，请检查网络！");
                        }
                    })
                });
            }

            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                    $.post("${pageContext.request.contextPath}/admin/deleteHouse", {houseId: data.houseId}, function (success) {
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

    {{#  if(d.houseExamine == 0){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="examine">审核</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>

    {{#  } }}
    {{#  if(d.houseExamine == 1){ }}

    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="cancelExamine">封禁</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>


    {{#  } }}


</script>
</body>
</html>