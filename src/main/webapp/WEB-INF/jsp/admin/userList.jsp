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
        <h2>用户管理</h2>
        <div class="manage">
            <table class="list">
                <tr>
                    <th>ID</th>
                    <th>头像</th>
                    <th>姓名</th>
                    <th>性别</th>
<%--                    <th>Email</th>--%>
                    <th>手机</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td class="first w4 c">${user.euUserLoginid}</td>
                        <td class="w1 c"><img src="../${user.euFilepath}" height="50px" width="50px" alt="未设置"></td>
                        <td class="w1 c">${user.euUserName}</td>
                        <td class="w2 c">${user.euSex}</td>
<%--                        <td class="w4 c">${user.euEmail}</td>--%>
                        <td class="w4 c">${user.euMobile}</td>
                        <td class="w1 c"><a href="getUser.do?euUserId=${user.euUserId}">修改</a> <a href="javascript:DeleteUser(${user.euUserId});">删除</a></td>
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
<c:if test="${param.adminType eq 'updateUser'}">
    <script> setTimeout(function () {alert("${param.i eq '1'?'修改用户成功':'修改用户失败'}")},800)</script>
</c:if>
<c:if test="${param.adminType eq 'addUser'}">
    <script>setTimeout(function () {alert("${param.i eq '1'?'添加用户成功':'添加用户失败'}")},800)</script>
</c:if>
<c:if test="${param.adminType eq 'deleteUser'}">
    <script>setTimeout(function () {alert("${param.i eq '1'?'删除用户成功':'删除用户失败'}")},800)</script>
</c:if>
</body>
</html>
