<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/9
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
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
        <h2>修改订单</h2>
        <div class="manage">
            <form action="updateOrder.do" method="post" name="form1" onsubmit="return myCheck()">
                <table class="form">
                    <tr>
                        <td class="field">订单ID：</td>
                        <td>
                            <input type="text" class="text" name="eoId" value="${order.eoId}" readonly="readonly" />
                        </td>
                    </tr>
                    <tr>
                        <td class="field">订购人姓名：</td>
                        <td><input type="text" class="text" name="eoUserName" value="${order.eoUserName}" /></td>
                    </tr>
                    <tr>
                        <td class="field">地址：</td>
                        <td><input type="text" class="text" name="eoUserAddress" value="${order.eoUserAddress}" /></td>
                    </tr>
                    <tr>
                        <td class="field">交易金额：</td>
                        <td><input type="text" class="text" name="eoCost" value="${order.eoCost}" /></td>
                    </tr>
                    <tr>
                        <td class="field">下单时间：</td>
                        <td> <fmt:formatDate value="${order.eoCreateTime}" type="both"/> </td>
                    </tr>
                    <tr>
                        <td class="field">订单状态：</td>
                        <td>
                           <select name="eoStatus">
                               <option value="1" <c:if test="${order.eoStatus eq '1'}">selected="selected"</c:if>  >已发货</option>
                               <option value="2" <c:if test="${order.eoStatus eq '2'}">selected="selected"</c:if>  >未发货</option>
                           </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <label class="ui-blue">
                                <input type="submit" id="updateOrderBtn" value="更新" />
                            </label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2022 All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
<script>
    function myCheck()
    {
        for(var i=0;i<document.form1.elements.length-1;i++)
        {
            if(document.form1.elements[i].value=="")
            {
                alert("当前表单不能有空项");
                document.form1.elements[i].focus();
                return false;
            }
        }
        return true;

    }
    /*function submit(frm) {
        if (document.frm.word.value == ""||document.frm.word.value == null) {
            alert("请完善信息内容！");
            document.frm.word.focus();
            return false;
        }
        return true;
    }*/
</script>