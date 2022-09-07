
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%@include file="common/top.jsp"%>
<div id="position" class="wrap">
    您现在的位置：<a href="index.do">易买网</a> &gt; 阅读新闻
</div>
<div id="main" class="wrap">
    <div class="left-side">
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
                    <li><a href="news-view.html" target="_blank">${news.enTitle}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div id="news" class="right-main">
        <h1>${news.enTitle}</h1>
        <div class="content">
           ${news.enContent}
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
