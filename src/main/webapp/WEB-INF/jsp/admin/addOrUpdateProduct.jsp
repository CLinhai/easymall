<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/5
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理 - 易买网</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <script type="text/javascript" src="../scripts/jquery-3.1.1.js"></script>

    <script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<%@include file="../common/topAdmin.jsp" %>

<div id="main" class="wrap">
    <%@include file="../common/leftAdmin.jsp" %>

    <div class="main">
        <h2>${param.type eq 'updateProduct'?'修改':'添加'}商品</h2>
        <div class="manage">
            <form action="addOrUpdateProduct.do?type=${param.type eq 'updateProduct'?'updateProduct':'addProduct'}"
                  method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td class="field">*商品名称：</td>
                        <td><input type="text" class="text" name="epName" value="${product.epName}"/><span></span></td>

                    </tr>
                    <tr>
                        <td class="field">*所属分类：</td>
                        <td>
                            <select name="epcChildId">
                                <option>请选择...</option>
                                <c:forEach items="${map['parentCategoryList']}" var="parentCategory">
                                <optgroup label="${parentCategory.epcName}">
                                    <c:forEach items="${map['childCategoryList']}" var="childCategory">
                                    <c:if test="${childCategory.epcParentId eq parentCategory.epcId}">
                                    <option value="${childCategory.epcId}"
                                            <c:if
                                                    test="${childCategory.epcId eq product.epcChildId}">selected="selected"</c:if> > ${childCategory.epcName}</option>
                                    </c:if>
                                    </c:forEach>
                                    </c:forEach>
                            </select>
                            <span></span>
                        </td>

                    </tr>
                    <tr>
                        <td class="field">*商品图片：</td>
                        <td><input type="file" class="text" name="epFileName"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">*商品价格：</td>
                        <td><input type="text" class="text tiny" name="epPrice" value="${product.epPrice}"/>
                            元<span></span></td>
                    </tr>
                    <tr>
                        <td class="field">*库存：</td>
                        <td><input type="text" class="text tiny" name="epStock"
                                   value="${product.epStock}"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">商品描述：</td>
                        <td><textarea class="text" name="epDescription">${product.epDescription}</textarea><span></span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <input type="hidden" name="epId" value="${product.epId}">
                        <td><label class="ui-blue"><input type="button" id="proBtn" value="提交"/></label></td>
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
    $("#proBtn").click(function () {

        $(":input:lt(5)").each(function () {
            $(this).next("span").html("")
            var value = $(this).val();
            var span = $(this).next("span");
            var parent = $(this).parent().prev().html()
            $("span:not(#times)").css({"float": "right", "color": "red"})
            if (value == "" || value == null || value == "请选择...") {
                $(this).next("span").html("内容不能为空")
            }
            $(this).focus(function () {
                $(this).next("span").html("")
            })
        })
        var epName = $("input[name='epName']").val();
        var epcChildId = $("input[name='epcChildId']").val();
        var epFileName = $("input[name='epFileName']").val();
        var epPrice = $("input[name='epPrice']").val();
        var epStock = $("input[name='epStock']").val();
        if (epName!=""&&epcChildId!==""&&epFileName!==""&&epPrice!==""&&epStock!=="") {
            $("#form").submit();
        }


    })

</script>