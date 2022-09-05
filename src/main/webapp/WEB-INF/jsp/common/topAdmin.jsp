<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/3
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>topAdmin</title>
</head>
<script type="text/javascript">
    //得到时间并写入div
    function getDate(){
        //获取当前时间
        var date = new Date();
        //格式化为本地时间格式
        var date1 = date.toLocaleString();
        //获取div
        var div1 = document.getElementById("times");
        //将时间写入div
        div1.innerHTML = date1;
    }
    //使用定时器每秒向div写入当前时间
    setInterval("getDate()",1000);
</script>
<body>
<div id="header" class="wrap">
    <div id="logo"><img src="../images/logo.gif" /></div>
    <div class="help">
        <a href="../index.do">返回前台页面</a>
        <a href="../exit.do">退出</a>
    </div>
    <div class="navbar">
        <ul class="clearfix">
            <li class="current"><a href="index.html">首页</a></li>
            <li><a href="user.html">用户</a></li>
            <li><a href="product.html">商品</a></li>
            <li><a href="order.html">订单</a></li>
            <li><a href="guestbook.html">留言</a></li>
            <li><a href="news.html">新闻</a></li>
        </ul>
    </div>
</div>
<div id="childNav">
    <div class="welcome wrap">
        管理员<span style="color:#3a52a8;"> ${empty loginuser.euUserName?loginuser.euUserLoginid:loginuser.euUserName}  </span> 您好，现在是<span id="times" style="color:#000000;"></span>，欢迎回到管理后台。
    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：<a href="index.html">易买网</a> &gt; 管理后台
</div>
</body>
</html>
