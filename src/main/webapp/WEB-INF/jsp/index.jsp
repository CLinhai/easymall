
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%@include file="common/top.jsp"%>
<div id="main" class="wrap">
    <%@include file="common/left.jsp"%>

    <div class="main">
        <div class="price-off">
            <h2>今日特价</h2>
            <ul class="product clearfix">
                <c:forEach items="${map['productList']}" var="product" end="7">
                    <li>
                        <dl>
                            <dt><a href="getProduct.do?epId=${product.epId}" target="_blank"><img src="${product.epFileName}"/></a></dt>
                            <dd class="title"><a href="getProduct.do?epId=${product.epId}" target="_blank">${product.epDescription}</a></dd>
                            <dd class="price">${product.epPrice}</dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="side">
            <div class="news-list">
                <h4>最新公告</h4>
                <ul>
                    <c:forEach items="${map['newsList']}" var="news" end="6">
                        <li><a href="news-view.html" target="_blank">${news.enTitle}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="spacer"></div>
            <div class="news-list">
                <h4>新闻动态</h4>
                <ul>
                    <c:forEach items="${map['newsList']}" var="news" end="6">
                        <li><a href="getNews.do?enId=${news.enId}" target="_blank">${news.enTitle}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="spacer clear"></div>
        <div class="hot">
            <h2>热卖推荐</h2>
            <ul class="product clearfix">
                <c:forEach items="${map['productList']}" var="product" end="11">
                    <li>
                        <dl>
                            <dt><a href="getProduct.do?epId=${product.epId}" target="_blank"><img src="${product.epFileName}"/></a></dt>
                            <dd class="title"><a href="getProduct.do?epId=${product.epId}" target="_blank">${product.epDescription}</a></dd>
                            <dd class="price">${product.epPrice}</dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
