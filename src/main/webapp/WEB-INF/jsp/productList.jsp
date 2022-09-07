
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%@include file="common/top.jsp" %>
<div id="position" class="wrap">
    您现在的位置：<a href="index.do">易买网</a> &gt; ${epcParent.epcName}
    &gt; ${epcChild.epcName}
</div>
<div id="main" class="wrap">
    <%@include file="common/left.jsp" %>
    <div class="main">
        <div class="product-list">
            <h2>全部商品</h2>
            <div class="pager">
                <ul class="clearfix">
                    <c:if test="${!empty productMap.pageBean.lists}">
                        <c:if test="${productMap.pageBean.currPage != 1}">
                            <li>
                                <a href="productListPage.do?currentPage=${productMap.pageBean.currPage-1}&epcChildId=${epcChildId}">[上一页]</a>&nbsp;&nbsp;
                            </li>
                        </c:if>
                        <c:forEach var="page" begin="1" end="${productMap.pageBean.totalPage}">
                            <li><a href="productListPage.do?currentPage=${page }&epcChildId=${epcChildId}">${page }</a>
                            </li>
                        </c:forEach>
                        <c:if test="${productMap.pageBean.currPage != productMap.pageBean.totalPage}">
                            <li>
                                <a href="productListPage.do?currentPage=${productMap.pageBean.currPage+1}&epcChildId=${epcChildId}">[下一页]</a>&nbsp;&nbsp;
                            </li>
                        </c:if>
                    </c:if>
                </ul>
            </div>

            <div class="clear"></div>
            <ul class="product clearfix">
                <c:forEach items="${productMap.pageBean.lists}" var="product">
                    <li>
                        <dl>
                            <dt><a href="getProduct.do?epId=${product.epId}" target="_blank"><img src="${product.epFileName}"/></a></dt>
                            <dd class="title"><a href="getProduct.do?epId=${product.epId}" target="_blank">${product.epDescription}</a>
                            </dd>
                            <dd class="price">${product.epPrice}</dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
            <div class="clear"></div>
            <div class="pager">
                <ul class="clearfix">
                    <c:if test="${!empty productMap.pageBean.lists}">
                        <c:if test="${productMap.pageBean.currPage != 1}">
                            <li>
                                <a href="productListPage.do?currentPage=${productMap.pageBean.currPage-1}&epcChildId=${epcChildId}">[上一页]</a>&nbsp;&nbsp;
                            </li>
                        </c:if>
                        <c:forEach var="page" begin="1" end="${productMap.pageBean.totalPage}">
                            <li><a href="productListPage.do?currentPage=${page }&epcChildId=${epcChildId}">${page }</a>
                            </li>
                        </c:forEach>
                        <c:if test="${productMap.pageBean.currPage != productMap.pageBean.totalPage}">
                            <li>
                                <a href="productListPage.do?currentPage=${productMap.pageBean.currPage+1}&epcChildId=${epcChildId}">[下一页]</a>&nbsp;&nbsp;
                            </li>
                        </c:if>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
