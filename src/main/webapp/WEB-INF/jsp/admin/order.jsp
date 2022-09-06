
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../scripts/function.js"></script>
</head>
<body>
<%@include file="../common/top.jsp"%>
<div id="position" class="wrap">
    您现在的位置：<a href="../index.do">易买网</a> &gt; 确认订单
</div>
<div class="wrap">
    <div id="shopping">
        <form action="submitOrder.do" method="post" id="form">
            <table>
                <tr>
                    <th>商品名称</th>
                    <th>购买数量</th>
                    <th>小计</th>
                </tr>
                <c:set var="total" value="0"></c:set>
                <c:forEach items="${list}" var="cart">
                    <tr >
                        <input type="hidden" value="${cart.carId}" name="carId" id="carId_${cart.carId}" class="cartid">
                        <td class="thumb" style="text-align: center">
                            <img src="${pageContext.request.contextPath}/${cart.carPfilename}" width="60px" height="60px" />
                            <a href="getProduct.do?epId=${cart.carPid}">${cart.carPname}</a>
                        </td>
                        <td class="number">
                            <span>数量：${cart.carQuantity}</span>
                        </td>
                        <td class="priceCount" >￥<span class="priceCount" id="priceCount_${cart.carId}">${cart.carQuantity*cart.carPprice}</span></td>
                    </tr>
                    <c:set var="price" value="${cart.carQuantity*cart.carPprice}" ></c:set>
                    <c:set var="total" value="${price+total}"></c:set>
                </c:forEach>

            </table>
            <div class="goPay">

                <div id="checkPrice" style="margin-right: 80px">总价￥：<span id="totalMoney" style="color: red;font-weight: bold">${total}</span> </div>
                <input type="hidden" name="eoCost" value="${total}">
            </div>

        <div id="orderAddress">

<%--                <c:when test="${empty user.euUserName||empty user.euAddress||empty user.euMobile }">--%>
                    <div class="addressInfo">
                        <h3 style="border-bottom: 1px solid black">收件信息</h3>
                        姓名：<input type="text" name="eoUserName" id="euUserName" value="${user.euUserName}"><br>
                        地址：<input type="text" name="eoUserAddress" id="euAddress" value="${user.euAddress}"><br>
                        电话：<input type="text"  id="euMobile" value="${user.euMobile}"><br>
                    </div>
<%--                </c:when>--%>
             <input type="button" id="orderBtn" onclick="" value="提交订单" />
        </div>

        </form>
    </div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
<script>
    $("#orderBtn").click(function () {
        var name=$("#euUserName").val()
        var address=$("#euAddress").val()
        var mobile= $("#euMobile").val()
        if (name==""||address==""||mobile==""){
            alert("请完善信息")
        }else{
            var total=Number($("#totalMoney").html())
            ids=[];
            $(".cartid").each(function () {
                ids.push($(this).val())
            })
            $("#form").submit()
            // location.href="submitOrder.do?ids="+ids+"&eoUserName="+name+"&eoUserAddress="+address+"&eoCost="+total;

        }
    })
</script>