
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
    您现在的位置：<a href="../index.do">易买网</a> &gt; 购物车
</div>
<div class="wrap">
    <div id="shopping">
        <form action="" method="post">
            <table>
                <tr>
                    <th>全选</th>
                    <th>商品名称</th>
                    <th>商品单价</th>
                    <th>购买数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${cartList}" var="cart">
                    <tr >
                        <td class="qxBox"><input type="checkbox" name="box" id="box_${cart.carId }" value="${cart.carId }"></td>
                        <td class="thumb">
                            <img src="${pageContext.request.contextPath}/${cart.carPfilename}" width="60px" height="60px" />
                            <a href="getProduct.do?epId=${cart.carPid}">${cart.carPname}</a>
                        </td>
                        <td class="price" >
                            ￥<span class="carPprice" id="carPprice_${cart.carId}" >${cart.carPprice}</span>
                        </td>
                        <td class="number">
                            <input type="button" id="reduceNum_${cart.carId}" class="reduceNum" value="-"  onclick="setAmount.reduce(${cart.carId})">
                            <input type="text" id="buy-num_${cart.carId}" class="buy-num" onkeyup="setAmount.modify(this,${cart.carId})"
                                   onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                   value="${cart.carQuantity}" min="1" max="${cart.carPstock}">
                            <input type="button" id="addNum_${cart.carId}" class="addNum" value="+"  onclick="setAmount.add(${cart.carId})">
                        </td>
                        <td class="priceCount" >￥<span id="priceCount_${cart.carId}">${cart.carQuantity*cart.carPprice}</span></td>
                        <td class="delete"><a href="javascript:delOne(${cart.carId });">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div class="goPay">
                <div id="checkAll"><input type="checkbox" onclick="checkAll(this.checked)" >全选</div>
                <div id="delCheck"><a href="javascript:delCheck()" >删除选中商品</a></div>

                <div class="button" id="gopayBtn" >
                    <input type="button" onclick="toOrder()" value="" />
                </div>
                <div id="checkPrice">总价￥：<span id="totalMoney" style="color: red;font-weight: bold">0</span> </div>
                <div id="checkCount">已选中 <span id="selProductCount" style="color: red;font-weight: bold">0</span> 件商品</div>
            </div>

        </form>
<%--        <a href="index.do" class="continueShop">继续购物</a>--%>
    </div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
<script>
    function toOrder() {
        check_val = [];//定义一个数组
        $("input[name='box']:checked").each(function () {
            check_val.push($(this).val());
        })
        location.href="toOrder.do?ids="+check_val;
    }

    var setAmount = {
        add:function add(id){
            var buyNum= document.getElementById("buy-num_"+id);
            buyNum.value++;
            this.modify(buyNum,id);

        },
        reduce: function reduce(id){
            var buyNum= document.getElementById("buy-num_"+id);
            buyNum.value--;
            this.modify(buyNum,id);
        },
        modify: function modify(inputObj,id) {
            var pattern = /^\+?[1-9][0-9]*$/;
            var buyNum= document.getElementById("buy-num_"+id);
            var buyNumMax= Number(document.getElementById("buy-num_"+id).getAttribute("max"));
            var carPprice=$("#carPprice_"+id).html()
            if (!pattern.test(inputObj.value)){
                inputObj.value=1;
                $("#priceCount_"+id).html(carPprice*1)
            }else if ((buyNum.value)>=buyNumMax){
                    buyNum.value=buyNumMax;
            }

            var url="cartNumUpdate.do?carId="+id+"&count="+inputObj.value;
            $.get(url,function () {
                $("#priceCount_"+id).html(carPprice*buyNum.value)
                caltotalProduct();
                caltotalMoney();
            })

        }
    }


    function caltotalProduct() {
        $("#selProductCount").val(0)
        var total=0
        $("input[name='box']").each(function () {
            if ($(this).prop("checked")){
                total+=Number($("#buy-num_"+$(this).val()).val())
            }
        })
        $("#selProductCount").html(total)
    }



    function caltotalMoney() {
        $("#totalMoney").html(0)
        var total=0
        $("input[name='box']").each(function () {
            if ($(this).prop("checked")){
                total+=Number($("#priceCount_"+$(this).val()).html())
            }
        })
        $("#totalMoney").html(total)
    }

    function checkAll(flag){
        var boxs=document.getElementsByName("box")
        for(var i=0;i<boxs.length;i++){
            boxs[i].checked=flag
        }
        caltotalProduct()
        caltotalMoney()
    }

    function delCheck(){
        var boxs=document.getElementsByName("box")
        var flag=false;
        check_val = [];//定义一个数组
        for(var i=0;i<boxs.length;i++){
            if(boxs[i].checked){
                flag=true;
                check_val.push(boxs[i].value);
            }
        }
        if(flag){
            if(confirm("确认要删除吗？")){
                $.ajax({//利用ajax发出请求
                    type:"POST",//post类型
                    url:"deleteCarts.do?ids="+check_val, //向Controller里的deleteSelect传输ids
                    success:function(data){

                            alert("删除"+data+"条数据成功！");//返回ok后弹出一个对话框。
                         location.reload();
                    }
                });
            }
        }else{
            alert("请选择要删除的信息")
        }
    }

    function delOne(carId) {
        if (confirm("确认删除？")){
            var url="delCart.do?carId="+carId;
            $.post(url,function (data) {
                alert(data="1"?"删除成功":"删除失败")
                location.reload();
            })
        }
    }

    /*var boxs=document.getElementsByName("box")
    for(var i=0;i<boxs.length;i++){
        boxs[i].num=i
        boxs[i].onclick=function () {
            var total=Number($("#selProductCount").html());

            var id=this.value
            if (this.checked){

                var quantity=Number($("#buy-num_"+id).val())
                total+=quantity
                $("#selProductCount").html(total)
            }else {
                var quantity=Number($("#buy-num_"+id).val())
                $("#selProductCount").html((total-quantity))
            }
        }
    }
*/

    $("input[name='box']").each(function () {
        $(this).click(function () {
            var totalProduct=Number($("#selProductCount").html());
            var quantity=Number($("#buy-num_"+$(this).val()).val())
            var totalMoney=Number($("#totalMoney").html());
            console.log(totalMoney)
            var money=Number($("#priceCount_"+$(this).val()).html())
            console.log(money)
            if ($(this).prop("checked")){
                totalProduct+=quantity
                totalMoney+=money
                $("#selProductCount").html(totalProduct)
                $("#totalMoney").html(totalMoney)
            }else {
                $("#selProductCount").html((totalProduct-quantity))
                $("#totalMoney").html(totalMoney-money)
            }
        })

    })



</script>