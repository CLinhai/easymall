<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>易买网 - 首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<%@include file="common/top.jsp"%>
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em>
        <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎回到易买网</h1>
            <form id="loginForm" method="post" action="reg-result.html" onsubmit="return checkForm(this)">
                <table>
                    <p id="loginMsg"></p>
                    <tr>
                        <td class="field">用户名：</td>
                        <td><input class="text" type="text" name="euUserLoginid" id="euUserLoginid"
                                   onfocus="FocusItem(this)" onblur="CheckItem(this);"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td><input class="text" type="password" id="euPassword" name="euPassword"
                                   onfocus="FocusItem(this)" onblur="CheckItem(this);"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">验证码：</td>
                        <td><input class="text verycode" type="text" name="veryCode" id="code" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/>
                            <img id="veryCode" src="getVerifyCode2.do" onclick="changeCode();"/><span></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input type="button" id="login_btn" value="立即登录"/></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    Copyright &copy; All Rights Reserved. 京ICP证1000001号
</div>
<c:if test="${param.msg eq 'error1'}">
    <script>setTimeout(function () {
        alert("请先登录！")
    },100)</script>
</c:if>
</body>
</html>
<script type="text/javascript" data-th-inline="javascript">
    function changeCode() {
        var src = " getVerifyCode2.do?t=" + new Date().getTime(); //加时间戳，防止浏览器利用缓存
        $("#veryCode").attr("src", src);                  //jQuery写法
    }

    // 点击登录
    $("#login_btn").click(function () {
        $("#loginMsg").html("")
        var code = $("#code").val();
        var username = $("#euUserLoginid").val();
        var password = $("#euPassword").val();
       /*var data = JSON.stringify({"euUserLoginid": username, "euPassword": password,"code":code});
        console.log(data);*/
        if (username == ""||code==""||password=="") {
            $("#loginMsg").html("请输入账号和密码以及验证信息！")

        } else  {
            $.ajax({
                type:"POST",
                url:"checkVerifyCode.do",
                contentType: "application/json", //必须这样写
                data:JSON.stringify({"code":code}),//data是要提交是json字符串
                success:function (data) {
                    if (data=="0"){
                        $("#loginMsg").html("验证码错误")
                    }else {
                        $.ajax({
                            type:"POST",
                            url:"checkLogin.do",
                            contentType: "application/json", //必须这样写
                            data:JSON.stringify({"euUserLoginid": username, "euPassword": password}),//data是要提交是json字符串
                            success:function (data) {
                                if (data=="0"){
                                    $("#loginMsg").html("用户名或密码错误")
                                }else {
                                    location="go.do?url=logOrRegResult"
                                }
                            }

                        })
                    }
                }

            })

        }

    })
</script>
