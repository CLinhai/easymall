<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/3
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>leftAdmin</title>
</head>
<body>
<div id="menu-mng" class="lefter">
    <div class="box">
        <dl>
            <dt>用户管理</dt>
            <dd><em><a href="go.do?url=admin/addOrUpdateUser&type=addUser">新增</a></em><a href="getUserList.do">用户管理</a></dd>
            <dt>商品信息</dt>
            <dd><em><a href="getParentList.do?type=addCategory">新增</a></em><a href="getCategoryList.do">分类管理</a></dd>
            <dd><em><a href="getChildList.do">新增</a></em><a href="getProductList.do">商品管理</a></dd>
            <dt>订单管理</dt>
            <dd><a href="getOrderList.do">订单管理</a></dd>
<%--            <dt>留言管理</dt>--%>
<%--            <dd><a href="guestbook.html">留言管理</a></dd>--%>
            <dt>新闻管理</dt>
            <dd><em><a href="go.do?url=admin/addOrUpdateNews&type=addNews">新增</a></em><a href="getNewsList.do">新闻管理</a></dd>
        </dl>
    </div>
</div>
</body>
</html>
