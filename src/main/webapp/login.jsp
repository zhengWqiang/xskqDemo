<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>考勤管理系统</title>

    <script src="<%=path %>/ncss/js/cloud.js" type="text/javascript"></script>
    <link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript">
        if(top.location!=self.location){
            top.location="${pageContext.request.contextPath}/login.jsp";
        }
        $(function() {
            $('.loginbox').css( {
                'position' : 'absolute',
                'left' : ($(window).width() - 692) / 2
            });
            $(window).resize(function() {
                $('.loginbox').css( {
                    'position' : 'absolute',
                    'left' : ($(window).width() - 692) / 2
                });
            });
        });
        function login() {
            debugger;
            var username = $("#username").val();
            var password = document.getElementById('userpwd').value;
            /* var type = $("input[type='radio']:checked").val(); */
            /* var type = $("input[name='type']:checked").val(); */
            var type = $('input:radio:checked').val();
            /* alert(type); */
            if(username==""){
                /* document.getElementById("warn").innerHTML = "用户名不能为空"; */
                $("#warn").html("用户名不能为空");
                return;
            }
            if(password==""){
                document.getElementById("warn").innerHTML = "密码不能为空";
                return;
            }else{
                $.ajax({
                    type : "get",
                    dataType: "json",
                    url: "${pageContext.request.contextPath }/login/doLogin",
                    data : {
                        "username" : username,
                        "userpwd" : password,
                        "type" : type
                    },
                    success : function(data) {
                        /* alert(data); */
                        /* var obj = $.parseJSON(json);  //使用这个方法解析json
                        alert(obj);
                        var state_value = obj.result;  //result是和action中定义的result变量的get方
                        alert(state_value); */
                        debugger;
                        if (data.warn) {
                            document.getElementById("warn").innerHTML = data.warn;
                            document.getElementById("userpwd").value = "";
                        } else {
                            window.location.href = "&lt;%=path %>/index/index.jsp";
                        }
                    },
                    error : function(a) {
                        alert("Error!"+a);
                    }
                });
            }
        }
        function lableReset(){
            document.getElementById("warn").innerHTML = "";
        }
    </script>
</head>
<body style="background-color: #1c77ac; background-image: url(ncss/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
<div id="mainBody">
    <div id="cloud1" class="cloud"></div>
    <div id="cloud2" class="cloud"></div>
</div>
<div class="logintop">
    <span>欢迎登录考勤管理系统</span>
</div>
<div class="loginbody">
    <span class="systemlogo"></span>
    <form  method="post">
        <div class="loginbox">
            <ul>
                <li>
                    <input name="username" id="username" type="text" class="loginuser"
                           onclick="lableReset()"  /><br/>
                </li>
                <li>
                    <input name="userpwd"  id="userpwd" type="password" class="loginpwd"
                           onclick="lableReset()" /><br/>
                </li>
                <li>
                    <input name="admin" id="admin" type="radio" value=1/>管理员&nbsp; &nbsp;
                    <input name="teacher" id="teacher" type="radio" value=2/>老师&nbsp; &nbsp;
                    <input name="student" id="student" type="radio" value=3 checked="checked"/>学生
                    <label id="warn"></label>
                    <%--<select  name="type"  id="type" >
                       <option value="管理员">管理员</option>
                       <option value="老师">老师</option>
                       <option value="学生">学生</option>
                    </select>--%>
                </li>
                <li>
                    <input name="" type="submit" class="loginbtn" value="登录" onclick="login();return false;"/>
                    <input name="reset" type="reset" class="loginbtn" value="重置" onclick="lableReset()"/>
                    <!-- <input name="reset" type="reset" class="loginbtn" value="忘记密码"/> -->
                </li>
            </ul>
        </div>
    </form>
</div>
</body>
</html>
