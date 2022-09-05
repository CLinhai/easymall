
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
        <div class="shadow">
            <em class="corner lb"></em>
            <em class="corner rt"></em>
            <div class="box">
                <div class="msg">
                    <p>恭喜：购买成功！</p>
                    <p>正在进入首页...</p>
                    <script type="text/javascript">
                        setTimeout("location.href='../index.do'", 2000);
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
</body>
</html>
