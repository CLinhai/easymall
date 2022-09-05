<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/5
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <h2>${param.type eq 'addCategory'?'添加':'修改'}分类</h2>
        <div class="manage">
            <form action="addOrUpdateCategory.do" method="post" id="form">
                <table class="form">
                    <c:if test="${category.epcParentId ne '0'}">
                        <tr>
                            <td class="field">父分类：</td>
                            <td>
                                <select name="epcParentId">
                                    <option value="0">设置为父分类</option>
                                    <c:forEach items="${parentList}" var="parent">
                                        <option value="${parent.epcId}" <c:if test="${parent.epcId eq category.epcParentId}">selected="selected" </c:if> >${parent.epcName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </c:if>

                    <tr>
                        <td class="field">*分类名称：</td>
                        <td><input type="text" class="text" id="epcName" name="epcName" value="${category.epcName}" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <input type="hidden" value="${category.epcId}" name="epcId">
                        <td><label class="ui-blue"><input type="button" id="subBtn"  value="更新" /></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2010 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
<script>
    $("#subBtn").click(function(){
        var epcName=$("#epcName").val();
        if (epcName==null||epcName==""){
                alert("请输入名称")
        }else {
            $("#form").submit()
        }
    })
</script>