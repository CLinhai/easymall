
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理 - 易买网</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<%@include file="../common/topAdmin.jsp"%>

<div id="main" class="wrap">
    <%@include file="../common/leftAdmin.jsp"%>
    <div class="main">
        <h2>分类管理</h2>
        <div class="manage">
            <table class="list">
                <tr>
                    <th>ID</th>
                    <th>分类名称</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${categories}" var="category">
                    <tr>
                        <td class="first w4 c">${category.epcId}</td>
                        <td <c:if test="${category.epcParentId ne '0'}">class="childClass"</c:if>>
                                ${category.epcName}
                        </td>
                        <td class="w1 c">
                            <a href="getCategory.do?epcId=${category.epcId}" >修改</a>
                            <c:if test="${category.epcParentId eq '0'}">
                                <c:if test="${map[category.epcId].childCount <= 0}">
                                    <a href="javascript:DeleteCategory(${category.epcId});">删除</a>
                                </c:if>
                            </c:if>
                            <c:if test="${category.epcParentId ne '0'}">
                                <c:if test="${map[category.epcId].productCount<=0}">
                                    <a href="javascript:DeleteCategory(${category.epcId});">删除</a>
                                </c:if>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2022 All Rights Reserved. 京ICP证1000001号
</div>
<c:if test="${param.type eq 'updateCategory'}">
    <script>
        setTimeout(function () {alert("${param.i eq '1'?'修改分类成功':'修改分类失败'}") },800)
    </script>
</c:if>
<c:if test="${param.type eq 'addCategory'}">
    <script>setTimeout(function () {alert("${param.i eq '1'?'添加分类成功':'添加分类失败'}") },800)</script>
</c:if>
<c:if test="${param.type eq 'deleteCategory'}">
    <script>setTimeout(function () {alert("${param.i eq '1'?'删除分类成功':'删除分类失败'}")},800)</script>
</c:if>
</body>
</html>
