
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
        <h2>管理首页</h2>
        <div id="welcome" class="manage">
            <div class="shadow">
                <em class="corner lb"></em>
                <em class="corner rt"></em>
                <div class="box">
                    <div class="msg">
                       <%-- <c:if test="${param.type eq 'updateUser'}">
                           <p>${param.i eq '1'?'修改用户成功':'修改用户失败'}</p>
                        </c:if>
                        <c:if test="${param.type eq 'addUser'}">
                            <p>${param.i eq '1'?'添加用户成功':'添加用户失败'}</p>
                        </c:if>
                        <c:if test="${param.type eq 'deleteUser'}">
                            <p>${param.i eq '1'?'删除用户成功':'删除用户失败'}</p>
                        </c:if>--%>
                        <c:if test="${empty param.type }">
                            <p>欢迎回来</p>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2022 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>