<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/1
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>top-bar</title>
</head>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="${pageContext.request.contextPath}/images/logo.gif"/></div>
    <div class="help">
        <c:if test="${empty loginuser}">
            <a href="go.do?url=login&msg=error1" class="shopping">购物车</a>
            <a href="go.do?url=login">登录</a>
            <a href="go.do?url=register">注册</a>
<%--            <a href="guestbook.html">留言</a>--%>
        </c:if>
        <c:if test="${loginuser.euStatus=='1'}">
            <a href="${pageContext.request.contextPath}/admin/getCart.do?uid=${loginuser.euUserId}" class="shopping">购物车</a>
            <a href="">${empty loginuser.euUserName?loginuser.euUserLoginid:loginuser.euUserName}</a>
<%--            <a href="guestbook.html">留言</a>--%>
            <a href="/exit.do">退出</a>
        </c:if>
        <c:if test="${loginuser.euStatus=='0'}">
            <a href="">${empty loginuser.euUserName?loginuser.euUserLoginid:loginuser.euUserName}</a>
            <a href="admin/go.do?url=admin/adminIndex">进入后台</a>
            <a href="/exit.do">退出</a>
        </c:if>

    </div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="/index.do">首页</a></li>
            <li><a href="#">图书</a></li>
            <li><a href="#">百货</a></li>
            <li><a href="#">品牌</a></li>
            <li><a href="#">促销</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <c:forEach items="${map['childCategoryList']}" var="childCategory">
                <li><a href="productListPage.do?epcChildId=${childCategory.epcId}">${childCategory.epcName}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
