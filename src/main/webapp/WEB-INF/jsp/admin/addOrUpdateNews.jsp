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
<%@include file="../common/topAdmin.jsp" %>

<div id="main" class="wrap">
    <%@include file="../common/leftAdmin.jsp" %>

    <div class="main">
        <h2>${param.type eq 'addNews'?'添加':'修改'}新闻</h2>
        <div class="manage">
            <form action="addOrUpdateNews.do" method="post" id="form">
                <table class="form">
                    <tr>
                        <td class="field">*新闻标题：</td>
                        <td><input type="text" class="text" name="enTitle" id="enTitle" value="${news.enTitle}" /></td>
                    </tr>
                    <tr>
                        <td class="field">*新闻内容：</td>
                        <td><textarea name="enContent" id="enContent"> ${news.enContent}</textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <input type="hidden" name="enId" value="${news.enId}">
                        <td><label class="ui-blue"><input type="button" id="newsBtn" value="提交" /></label></td>
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
    $("#newsBtn").click(function(){
        var enTitle=$("#enTitle").val();
        var enContent=$("#enContent").val();
        if (enContent==""||enTitle==""){
            alert("请输入标题和内容")
        }else {
            $("#form").submit()
        }
    })
</script>