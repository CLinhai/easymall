<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/5
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理 - 易买网</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<%@include file="../common/topAdmin.jsp" %>

<div id="main" class="wrap">
    <%@include file="../common/leftAdmin.jsp" %>

    <div class="main">
        <h2>商品管理</h2>
        <div class="manage">
            <table class="list">
                <tr>
                    <th>ID</th>
                    <th>商品名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageBean.lists}" var="product">
                    <tr>
                        <td class="first w4 c">${product.epId}</td>
                        <td class="thumb"><img src="../${product.epFileName}" width="56px" height="56px" /><a href="../getProduct.do?epId=${product.epId}"
                                                                               target="_blank">${product.epName}</a>
                        </td>
                        <td class="w1 c"><a href="getProductAdmin.do?epId=${product.epId}&type=updateProduct">修改</a> <a href="javascript:DeleteProduct(${product.epId});">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <ul id="productListAdmin">
                <c:if test="${pageBean.currPage != 1}">
                    <li>
                        <a href="getProductList.do?currentPage=${pageBean.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                    </li>
                </c:if>
                <c:forEach var="page" begin="1" end="${pageBean.totalPage}">
                    <li><a href="getProductList.do?currentPage=${page }">${page }</a>
                    </li>
                </c:forEach>
                <c:if test="${pageBean.currPage != pageBean.totalPage}">
                    <li>
                        <a href="getProductList.do?currentPage=${pageBean.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2010 All Rights Reserved. 京ICP证1000001号
</div>
<c:if test="${param.type eq 'updateProduct'}">
    <script>setTimeout(function () {
        alert("${param.i eq '1'?'修改商品成功':'修改商品失败'}")
    },800)</script>
</c:if>
<c:if test="${param.type eq 'addProduct'}">
    <script>setTimeout(function () {alert("${param.i eq '1'?'添加商品成功':'添加商品失败'}") },800)</script>
</c:if>
<c:if test="${param.type eq 'deleteProduct'}">
    <script>setTimeout(function () {
        alert("${param.i eq '1'?'删除商品成功':'删除商品失败'}")
    },600)</script>
</c:if>
</body>
</html>