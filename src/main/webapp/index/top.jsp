<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="<%=path %>/ncss/js/jquery.js" type="text/javascript"></script>
    <title>进销存管理系统</title>
    <script type="text/javascript">
        function logout() {
            debugger;
            if (confirm("您确定要退出管理系统吗？")) {
                console.log("退出系统确认");
                top.location = "${pageContext.request.contextPath}/login.jsp";
            }
            return false;
        }
    </script>
</head>
<body style="background:url(<%=path %>/ncss/images/topbg.gif) repeat-x;">
<div class="topleft">
    <a href="<%=path %>/index/index.jsp" target="_parent"><img src="<%=path %>/ncss/images/logo.png" title="系统首页"/></a>
</div>
<div class="topright">
    <ul>
        <li><a href="#" target="_self" onclick="logout();">退出</a></li>
    </ul>
    <div class="user">
        <span>${user}(${type})</span>
    </div>
</div>
</body>
</html>

