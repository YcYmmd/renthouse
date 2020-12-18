<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看所有用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">所有注册用户</legend>
    </fieldset>
    <table id="allUser" lay-filter="user"></table>
</div>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script>
    layui.use(['element', 'table'], function () {
        let element = layui.element,
            $ = layui.jquery,
            table = layui.table;

        /*渲染数据*/
        let dt = table.render({
            id:'userTable',
            elem: "#allUser",
            url: "${pageContext.request.contextPath}/admin/allUser",
            limit:5,
            page:{ //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']//自定义分页布局
                ,limits:[5,10,15]
                ,first: false //不显示首页
                ,last: false //不显示尾页
            },
            cols: [[
                {field: 'userId', title: 'UID', align: 'center'},
                {field: 'userName', title: '用户名', align: 'center'},
                {field: 'userPassword', title: '密码', align: 'center'},
                {field: 'userPhoneNumber', title: '联系电话', align: 'center'},
                {field: 'userNickName', title: '昵称', align: 'center'},
                {field: 'userStatus',title: '状态', align: 'center',width:80},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]],
            done: function (res,curr,count) {
                $("[data-field = 'userStatus']").children().each(function () {
                    if ($(this).text() == "0") {
                        $(this).text("正常");
                    } else  if ($(this).text() == "1"){
                        $(this).text("封号");
                    }
                });
            }
        });

        /*编辑*/
        table.on('tool(user)', function (obj) {
            let data = obj.data;
            let layEvent = obj.event;
            let tr = obj.tr;
            let currPage = dt.config.page.curr;

            if (layEvent === "edit") {
                window.location.href = "/admin/editUser.html?userId=" + data.userId;
            }

            if (layEvent === "ban") {
                layer.confirm('确认封禁当前用户么？',{icon: 0,shade: 0.1},function (index) {
                    $.post("${pageContext.request.contextPath}/admin/banUser",{userId: data.userId},function (success) {
                        if (success === "OK") {
                            layer.msg("封号成功");
                            table.reload('userTable',{
                                page: {
                                    curr: $(".layui-laypage-skip").find("input").val()
                                }
                            },'data');
                        } else {
                            layer.msg("封号失败")
                        }
                    });
                });
            }

            if (layEvent === "unBan") {
                layer.confirm('确认解封当前用户么？',{icon: 0,shade: 0.1},function (index) {
                    $.post("${pageContext.request.contextPath}/admin/unBanUser",{userId: data.userId},function (success) {
                        console.log(success);
                        if (success === "OK") {
                            layer.msg("解封成功");
                            table.reload('userTable',{
                                page: {
                                    curr: $(".layui-laypage-skip").find("input").val()
                                }
                            },'data');
                        } else {
                            layer.msg("解封失败")
                        }
                    });
                });
            }

            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                    $.post("${pageContext.request.contextPath}/admin/deleteUser", {userId: data.userId}, function (success) {
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
    {{#  if(d.userStatus == 0){ }}
    <a class="layui-btn layui-btn-sm" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="ban">封禁</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</a>

    {{#  } }}
    {{#  if(d.userStatus == 1){ }}

    <a class="layui-btn layui-btn-sm" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="unBan">解封</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</a>


    {{#  } }}

</script>
</body>
</html>