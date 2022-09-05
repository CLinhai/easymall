<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/2
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>left-nav</title>
    <script>
        $(document).ready(function () {
            $.ajax({
                url:"showLL.do",
                type:"post",
                success:function (data) {
                    if(data!=""){
                        var products=data.split(",");
                        for (var i=0;i<products.length;i++){
                            var field=products[i].split("-");
                            var $dt=$("<dt></dt>")
                            var $img=$("<img/>")
                            $img.attr("src",field[2]);
                            $img.css({"width":"40px","height":"40px"});
                            $dt.append($img)

                            $("#ll").append($dt)

                            var $dd=$("<dd></dd>")
                            var $a=$("<a></a>")
                            $a.attr("href","getProduct.do?epId="+field[0])
                            $a.html(field[1])
                            $dd.append($a)
                            $("#ll").append($dd)

                        }

                    }
                }
            })
        })
    </script>
</head>
<body>
<div class="lefter">
    <div class="box">
        <h2>商品分类</h2>
        <dl>
            <c:forEach items="${map['parentCategoryList']}" var="parentCategory">
                <dt>${parentCategory.epcName}</dt>
                <c:forEach items="${map['childCategoryList']}" var="childCategory">
                    <c:if test="${childCategory.epcParentId eq parentCategory.epcId}">
                        <dd><a href="productListPage.do?epcChildId=${childCategory.epcId}">${childCategory.epcName}</a></dd>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </dl>
    </div>
    <div class="spacer"></div>
    <div class="last-view"><%----%>
        <h2>最近浏览</h2>
        <dl class="clearfix" id="ll">

        </dl>
    </div>
</div>
</body>
</html>
