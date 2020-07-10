<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理区域</title>
<link href="${pageContext.request.contextPath }/css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/ncss/js/jquery.js"></script>
<script language="Javascript" type="text/javascript">
	/* setInterval("timer.innerHTML=new Date().toLocaleString()");
	window.onload = function() {
		setInterval("timer.innerHTML=new Date().toLocaleString()", 1000);
	}; */
	setInterval("timer.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
	window.onload = function (){
		setInterval("timer.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
	}
</script>
  <style type="text/css">
   a{
     text-decoration:none;
   }
   body{
     background-repeat:no-repeat;
   }
</style>
</head>
<body background="${pageContext.request.contextPath }/ncss/images/sl.jpg">

<div class="place">
  <span>位置：</span>
    <ul class="placeul">
      <li style="list-style-type:none;">首页</li>
    </ul>
</div>
<marquee direction="right" width="100%" height="30" scrollamount="5" scrolldelay="66" behavior="alternate" loop="-1" 
	onMouseOver="this.stop()" onMouseOut="this.start()">
<font color="#00ff33" size="5"><b>Welcome to the attendance management system !</b></font>
</marquee> 
<div class="welinfo">
    <span><img src="../ncss/images/time.png" alt="时间" /></span>
    <i id="timer"></i>
  </div>
  <div class="xline"></div>
</body>
</html>
