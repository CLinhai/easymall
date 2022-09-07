
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <h2>${param.type eq 'addUser'?'添加':'修改'}用户</h2>
        <div class="manage">
            <form action="addOrUpdateUser.do?type=${param.type eq 'addUser'?'addUser':'updateUser' }" id="updateForm" method="post" enctype="multipart/form-data">
                <table class="form">
                    <input type="hidden" value="${user.euUserId}" name="euUserId">
                    <tr>
                        <td class="field">*用户名：</td>
                        <td><input type="text" class="text" name="euUserLoginid" value="${user.euUserLoginid}" <c:if test="${param.type ne 'addUser'}">readonly="readonly"</c:if> /></td>
                    </tr>
                    <tr>
                        <td class="field">姓名：</td>
                        <td><input type="text" class="text" name="euUserName" value="${user.euUserName}" /></td>
                    </tr>
                    <tr>
                        <td class="field">*密码：</td>
                        <td><input type="text" class="text" name="euPassword" value="${user.euPassword}" /></td>
                    </tr>
                    <tr>
                        <td class="field">性别：</td>
                        <td><input type="radio" name="euSex" value="男" <c:if test="${user.euSex=='男'}">checked="checked" </c:if> />男
                            <input type="radio" name="euSex" value="女" <c:if test="${user.euSex=='女'}">checked="checked" </c:if> />女
                        </td>
                    </tr>
                    <tr>
                        <td class="field">出生日期：</td>
                        <c:set var="ubirthday">${user.euBirthday}</c:set>
                        <c:set var="str" value="${fn:split(ubirthday, '-')}"></c:set>
                        <td>
                            <select id="birthyear" >
                                <c:if test="${empty ubirthday}"><option>请选择</option></c:if>
                                <c:forEach var="year" begin="1900" end="2020">
                                         <option value="${year}" <c:if test="${year==str[0]}">selected="selected"</c:if> >${year}</option>
                                </c:forEach>
                            </select>年
                            <select id="birthmonth">
                                <c:if test="${empty ubirthday}"><option>请选择</option></c:if>
                                <c:forEach var="month" begin="01" end="12">
                                         <option value="${month}" <c:if test="${month==str[1]}">selected="selected"</c:if> >${month}</option>
                                </c:forEach>
                            </select>月
                            <select id="day">
                                <c:if test="${empty ubirthday}"><option>请选择</option></c:if>
                                <c:forEach var="day" begin="01" end="31">
                                        <option value="${day}" <c:if test="${day==str[2]}">selected="selected"</c:if> >${day}</option>
                                </c:forEach>
                            </select>日
                            <input type="hidden" value="" name="euBirthday" id="euBirthday">
                        </td>
                    </tr>
                    <tr>
                        <td class="field">手机号码：</td>
                        <td><input type="text" class="text" name="euMobile" value="${user.euMobile}" /></td>
                    </tr>
                    <tr>
                        <td class="field">送货地址：</td>
                        <td><input type="text" class="text" name="euAddress" value="${user.euAddress}" /></td>
                    </tr>
                    <tr>
                        <td class="field">头像：</td>
                        <td><input type="file" class="text" name="euFilepath1" value="${user.euFilepath}" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-blue"><input type="button" id="updateBtn" value="提交" /></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; 2022  All Rights Reserved. 京ICP证1000001号
</div>

</body>
</html>
<script>
    $("#updateBtn").click(function () {
        var y = $("#birthyear").val()
        var m = $("#birthmonth").val()
        var d = $("#day").val()
        if (y!="请选择"&&m!="请选择"&&d!="请选择"){
            var birth = y + "-" + m + "-" + d;
        }
        $("#euBirthday").attr("value", birth)

        var euUserLoginid=$("input[name='euUserLoginid']").val()
        var euPassword=$("input[name='euPassword']").val()
        if (euUserLoginid==""||euPassword==""){
            alert("请输入账户和密码")
        }else{
          /*  $.ajax({
                type: "post",
                url: "../checkRegister.do",
                contentType: "application/json", //必须这样写
                data:JSON.stringify({"euUserLoginid":euUserLoginid}),//data是要提交是json字符串
                success: function (response) {*/
                    // if (response=="1") {
                        $("#updateForm").submit()
                   /* }else{
                         alert("账号不存在");
                    }*/
        /*        }
            });*/
        }



    })
</script>