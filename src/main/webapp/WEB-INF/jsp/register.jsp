<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 2020/7/1
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
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
<%@include file="common/top.jsp" %>
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em>
        <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎注册易买网</h1>
            <ul class="steps clearfix">
                <li class="current"><em></em>填写注册信息</li>
                <li class="last"><em></em>注册成功</li>
            </ul>
            <form id="f"  action="register.do"  method="post">
                <table>
                    <tr>
                        <td class="field">用户名：</td>
                        <td><input class="text" type="text" name="euUserLoginid" id="euUserLoginid" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/><span id="usernameMSg"></span></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td><input class="text" type="password" id="euPassword"  name="euPassword" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/><span id="passwordMSg"></span></td>
                    </tr>
                    <tr>
                        <td class="field">确认密码：</td>
                        <td><input class="text" type="password" id="rePwd" name="rePassWord" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/><span id="repasswordMSg"></span></td>
                    </tr>
                    <tr>
                        <td class="field">验证码：</td>
                        <td><input class="text verycode" type="text" id="code" name="veryCode" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/><img id="veryCode" onclick="changeCode();" src="getVerifyCode2.do"/><span id="codeMsg"></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input type="button" name="registerBtn" id="registerBtn" value="提交注册"/></label></td>
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
</body>
</html>
<script>
    function changeCode() {
        var src = " getVerifyCode2.do?t=" + new Date().getTime(); //加时间戳，防止浏览器利用缓存
        $("#veryCode").attr("src", src);                  //jQuery写法
    }
    $(document).ready(function () {


        $("#registerBtn").click(function () {

            $("#usernameMSg").html("")
            $("#passwordMSg").html("")
            $("#repasswordMSg").html("")
            $("#codeMsg").html("")
            var loginId=$("#euUserLoginid").val();
            var loginPwd=$("#euPassword").val();
            var rePwd=$("#rePwd").val();
            var code=$("#code").val();
            if(loginId==""){
                $("#usernameMSg").html("账号不能为空！")
                $("#usernameMSg").addClass("error")

            }else if(loginPwd==""){
                $("#passwordMSg").html("密码不能为空！");
                $("#passwordMSg").addClass("error")
            }else if(rePwd==""){
                $("#repasswordMSg").html("确认密码不能为空！");
                $("#repasswordMSg").addClass("error")
            }else if(rePwd!=loginPwd){
                $("#repasswordMSg").html("密码输入不一致！");
                $("#repasswordMSg").addClass("error")
            }else if(code==""){
                $("#codeMsg").html("验证码不能为空")
                $("#codeMsg").addClass("error")
            }else{
                $.ajax({
                    type:"POST",
                    url:"checkVerifyCode.do",
                    contentType: "application/json", //必须这样写
                    data:JSON.stringify({"code":code}),//data是要提交是json字符串
                    success:function (data) {
                        if (data=="0"){
                            alert(data)
                            $("#codeMsg").html("验证码错误")
                            $("#codeMsg").addClass("error")
                        }else {
                            $.ajax({
                                type: "post",
                                url: "checkRegister.do",
                                contentType: "application/json", //必须这样写
                                data:JSON.stringify({"euUserLoginid":loginId}),//data是要提交是json字符串
                                success: function (response) {

                                    if (response=="1") {
                                        $("#usernameMSg").html("账号已经存在").addClass("error")
                                    }else{
                                        alert(response)
                                        alert($("#f"))
                                        // location="go.do?url=logOrRegResult"

                                        $("#f").submit();
                                    }
                                }
                            });
                        }
                    }

                })

            }

        });
    }) ;
</script>