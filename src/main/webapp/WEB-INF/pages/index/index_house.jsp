<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"/>
    <title>房屋搜索</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css"/>
</head>
<body>
<!--内容开始-->
<div class="list_control_bar layui-container">
    <form action="/page2" method="post" class="form-inline" role="form" style="float:left;">
        <div class="form-group has-feedback">
            <div class="input-group">
                <div class="input-group-addon">查询条件</div>
                <input name="keyword" class="form-control has-success" type="text" placeholder="请输入查询条件">
            </div>
        </div>
        <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
    </form>
    <div>
        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a href="${pageContext.request.contextPath }/index.html">默认排序</a></li>
                <li><a href="${pageContext.request.contextPath }/priceAsc">价格升序</a></li>
                <li><a href="${pageContext.request.contextPath }/priceDesc">价格降序</a></li>
            </ul>
        </div>
    </div>
</div>

<section class="layui-container">
    <hr>
    <h2>共找到<span style="color: #ffc601;margin: 0 5px;">${requestScope.pageInfo.total}</span>套出租房源，
        共<span style="color: #ffc601;margin: 0 5px;">${requestScope.pageInfo.pages}</span>页
    </h2>
    <div class="house-detail">
        <ul>
            <c:forEach items="${requestScope.pageInfo.list }" var="h">
                <li>
                    <a href="${pageContext.request.contextPath}/detail.html?id=${h.houseId }" class="show-image">
                        <img src="${h.houseImage }" width="240px" height="180px">
                    </a>
                    <div class="show-details">
                        <p class="house-title">
                            <a href="${pageContext.request.contextPath}/detail.html?id=${h.houseId }">${h.houseDesc }</a>
                        </p>
                        <p class="house-about">
                            <span class="layui-icon layui-icon-home"></span>
                            <span>${h.houseModel}</span>
                            <span class="flag-line">|</span>
                            <span>${h.houseArea } m<sup>2</sup></span>
                            <span class="flag-line">|</span>
                            <span>普通装修</span>
                            <span class="flag-line">|</span>
                            <span>${h.houseFloor }</span>
                            <span class="flag-line">|</span>
                            <span>${h.houseType }</span>
                        </p>
                        <p class="house-address clearfix">
                            <span class="layui-icon layui-icon-location"></span>
                            <span class="whole-line">
			    		        <span>${h.houseAddress}</span>
					        </span>
                        </p>
                        <div class="show-price">
                            <span class="sale-price">${h.housePrice}</span>
                            <span class="sale-unit">元/月</span>
                        </div>
                    </div>
                </li>
            </c:forEach>
            <h2>
                <div id="Pagination" class="pagination pagination-lg"></div>
            </h2>
        </ul>
    </div>
</section>
<script src="${pageContext.request.contextPath }/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function () {
        // 调用后面声明的函数对页码导航条进行初始化
        initPagination();
    });

    // 生成页码导航条的函数
    function initPagination() {
        // 获取总记录数
        var totalRecord = ${requestScope.pageInfo.total};
        // 生成一个JSON对象存储Pagination的属性
        var properties = {
            num_edge_entries:3,                                     // 边缘页数（两边显示的页码）
            num_display_entries:5,                                  // 主体页数
            callback:pageSelectCallback,                            // 指定用户点击“翻页”的按钮跳转页面的回调函数
            items_per_page: ${requestScope.pageInfo.pageSize},      // 每页要显示的数据的数量
            current_page:${requestScope.pageInfo.pageNum-1},        // Pagination内部使用pageIndex来管理代码，pageIndex 从0开始，pageNum 从1开始，所以要减一
            prev_text:"上一页",                                     // 上一页按钮上显示的文本
            next_text:"下一页"                                    // 下一页按钮上显示的文本
        };
        // 生成页码导航条
        $("#Pagination").pagination(totalRecord,properties);
    }
    // 回调函数的含义，声明出来以后不是自己调用而是交给系统或框架调用
    // 用户点击页码的时候，调用这个函数实现页面跳转（包括上一页、下一页）
    // pageIndex是Pagination传给我们的那个从零开始的页码
    function pageSelectCallback(pageIndex,jQuery) {
        // 根据pageIndex计算得到pageNum
        var pageNum = pageIndex + 1;

        // 跳转到对应的页面
        window.location.href = "${pageContext.request.contextPath}/page2?pageNum=" + pageNum+"&keyword=${param.keyword}";

        // 由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
        return false;
    }
</script>
</body>
</html>

