<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/2
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%@include file="common/top.jsp"%>
<div id="position" class="wrap">
    您现在的位置：<a href="index.do">易买网</a> &gt; ${pMap.epcParent.epcName}&gt;
    <a href="productListPage.do?epcChildId=${pMap.epcChild.epcId}">${pMap.epcChild.epcName}</a>&gt;${product.epName}
</div>
<div id="main" class="wrap">
    <%@include file="common/left.jsp"%>
    <div id="product" class="main">
        <h1>${product.epName}</h1>
        <div class="infos">
            <div class="thumb"><img src="${product.epFileName}" width="250px" height="250px"/></div>
            <div class="buy">
                <p>商城价：<span class="price">${product.epPrice}</span></p>
                <p>库　存：${product.epStock}</p>

                <input type="button" id="reduceNum" value="-"  onclick="setAmount.reduce()">
                <input type="text" id="buy-num"  onkeyup="setAmount.modify(this)"
                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                       value="1" min="1" max="${product.epStock}">
                <input type="button" id="addNum" value="+"  onclick="setAmount.add()">

                <div class="button">
                    <input type="button" name="goBuyBtn" value="" onclick="shopAdd(${product.epId},'gobuy')" />
                    <a href="javascript:shopAdd(${product.epId},'goshop')">放入购物车</a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div class="introduce">
            <h2><strong>商品详情</strong></h2>
            <div class="text">
                ${product.epDescription}
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
<c:if test="${!empty param.cartAddi }">
    <script>setTimeout(function () {
        alert(${param.cartAddi eq '1'}?"成功放入购物车":"加入购物车失败")
    },300)
    </script>
</c:if>
</body>
</html>
<script>
    function shopAdd(epId,url) {
        var count=$("#buy-num").val()
        location.href="admin/cartAdd.do?epId="+epId+"&count="+count+"&url="+url;
    }
    var setAmount = {
        add:function add(){
            var buyNum= document.getElementById("buy-num");
            buyNum.value++;
            this.modify(buyNum);
        },
        reduce: function reduce(){
            var buyNum= document.getElementById("buy-num");
            buyNum.value--;
            this.modify(buyNum);

        },
        modify: function modify(inputObj) {
            var pattern = /^\+?[1-9][0-9]*$/;
            var buyNum= document.getElementById("buy-num");
            var buyNumMax= Number(document.getElementById("buy-num").getAttribute("max"));
            if (!pattern.test(inputObj.value)){
                inputObj.value=1;
            }else if ((buyNum.value)>=buyNumMax){
                setTimeout(function () {
                    buyNum.value=buyNumMax;
                },500)

            }

        }
    }
   /* $("#buy-num").blur(function () {
        var max=$(this).attr("max")
        var num=$(this).val()
        if (num>=max){
            $(this).val(max)
        }
    })*/
   /* $("#addNum").blur(function () {
        var max=$("#buy-num").attr("max")
        var num=$("#buy-num").val()
        if (num>=max){
            $("#buy-num").val(max)
        }
    })*/
</script>
<%--
<script>
    $(document).ready(function () {
        var max=$("inputNum").attr("max")
        $("#reduceNum").click(function () {
            var num=$("#inputNum").val()
            $("#inputNum").val(num--)
            if (num<1){
                $(this).attr("disabled",true)
            }
        })

        $("#addNum").click(function () {
            var num=$("#inputNum").val()
            $("#inputNum").val(num++)
            if (num>=max){
                $(this).attr("disabled",true)
            }
        })
        /*$("#inputNum").keyup(function () {
            var pattern = /^\+?[1-9][0-9]*$/;
            if (!pattern.test($(this))){
                $(this).val("1")
            }
        })*/
    })

</script>--%>
