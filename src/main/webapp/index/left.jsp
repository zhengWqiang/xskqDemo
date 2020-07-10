<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="<%=path%>/ncss/css/style.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="<%=path%>/ncss/js/jquery.js">
		</script>

		<script type="text/javascript">
$(function() {
	//导航切换
	$(".menuson li").click(function() {
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});

	$('.title').click(function() {
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if ($ul.is(':visible')) {
			$(this).next('ul').slideUp();
		} else {
			$(this).next('ul').slideDown();
		}
	});
})
</script>

	</head>
	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>考勤管理系统
		</div>
		<dl class="leftmenu">
			<c:if test="${type=='学生'}">
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>请假管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/qing/addQing.jsp" target="rightFrame">请假申请</a><i></i>
					</li>
					<li>
						<cite></cite><a href="${pageContext.request.contextPath }/qing/list" target="rightFrame">我的请假</a><i></i>
					</li>
				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>考勤管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="${pageContext.request.contextPath }/kao/mlist" target="rightFrame">我的考勤</a><i></i>
					</li>
				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>基本信息管理
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="${pageContext.request.contextPath }/student/list" target="rightFrame">学生信息管理</a><i></i>
					</li>
				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>系统设置
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/stu/modify.jsp" target="rightFrame">修改密码</a><i></i>
					</li>
				</ul>
			</dd>
			</c:if>
			
			<c:if test="${type=='老师'}">
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>请假管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/qing/list" target="rightFrame">请假审批</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>考勤管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/kao/list" target="rightFrame">考勤管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/student/klist" target="rightFrame">添加考勤</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>考勤统计查询
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/kao/clist" target="rightFrame">考勤统计查询</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>基本信息管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/teacher/list" target="rightFrame">老师信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/student/list" target="rightFrame">学生信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/course/list" target="rightFrame">课程信息管理</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>系统设置
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/tea/modify.jsp" target="rightFrame">修改密码</a><i></i>
						</li>
					</ul>
				</dd>
			</c:if>
			<c:if test="${type=='管理员'}">
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>考勤管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/kao/list" target="rightFrame">考勤管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/student/klist" target="rightFrame">添加考勤</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>考勤统计查询
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/kao/clist" target="rightFrame">考勤统计查询</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>基本信息管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/teacher/list" target="rightFrame">老师信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/student/list" target="rightFrame">学生信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/course/list" target="rightFrame">课程信息管理</a><i></i>
						</li>
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/admin/list" target="rightFrame">管理员信息管理</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>日志管理
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="${pageContext.request.contextPath }/admin/aoplist" target="rightFrame">日志查询</a><i></i>
						</li>
					</ul>
				</dd>
				<dd>
					<div class="title">
						<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>系统设置
					</div>
					<ul class="menuson">
						<li>
							<cite></cite><a href="<%=path%>/admin/modify.jsp" target="rightFrame">修改密码</a><i></i>
						</li>
					</ul>
				</dd>
			</c:if>
		</dl>
		<div style="display: none">
		</div>
	</body>
</html>
