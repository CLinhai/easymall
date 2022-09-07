
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理 - 易买网</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<%@include file="../common/topAdmin.jsp"%>
<div id="main" class="wrap">
    <%@include file="../common/leftAdmin.jsp"%>
    <div class="main">
        <h2>订单管理</h2>
        <div class="manage">
            <div class="search">
                <form method="post" action="getOrderByForm.do">
                    订单号：<input type="text" class="text" name="eoId" />
                    订货人：<input type="text" class="text" name="eoUserName" />
                    <label class="ui-blue"><input type="submit" name="submit" value="查询" /></label>
                </form>
            </div>
            <div class="spacer"></div>
            <table class="list">
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>发货地址</th>
                    <th>下单时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${orderList}" var="order">
                    <tr>
                        <td class="first w2 c">${order.eoId}</td>
                        <td class="w2 c">${order.eoUserName}</td>
                        <td class="w3 c">${order.eoUserAddress}</td>
                        <td class="w4 c"><fmt:formatDate value="${order.eoCreateTime}" type="both"/></td>
                        <td class="w1 c">${order.eoStatus eq '1'?"发货":"未发货"}</td>
                        <td class="w1 c">
                            <a href="getOrder.do?eoId=${order.eoId}">修改</a>
                            <a href="javascript:DeleteOrder(${order.eoId});">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${! empty pageBean}">
            <div class="pager">
                <ul class="clearfix">
                    <c:if test="${pageBean.currPage != 1}">
                        <li>
                            <a href="getOrderList.do?currentPage=${pageBean.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                        </li>
                    </c:if>
                    <c:forEach var="page" begin="1" end="${pageBean.totalPage}">
                        <li><a href="getOrderList.do?currentPage=${page }">${page }</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageBean.currPage != pageBean.totalPage}">
                        <li>
                            <a href="getOrderList.do?currentPage=${pageBean.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                        </li>
                    </c:if>
                </ul>
            </div>
            </c:if>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2022 All Rights Reserved. 京ICP证1000001号
</div>
<c:if test="${param.type eq 'updateOrder'}">
    <script>setTimeout(function () {
        alert("${param.i eq '1'?'修改订单成功':'修改订单失败'}")
    },500)</script>
</c:if>
<c:if test="${param.type eq 'deleteOrder'}">
    <script>setTimeout(function () {
        alert("${param.i eq '1'?'删除订单成功':'删除订单失败'}")
    },500)</script>
</c:if>
</body>
</html>
