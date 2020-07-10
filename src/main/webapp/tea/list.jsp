<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	a{
		text-decoration:none;
	}
</style>
<script type="text/javascript">
	function checkdel(){
		return confirm("是否删除?");
	}
</script>
	</HEAD>
	<BODY leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
		<br/>
		<table cellpadding="3" cellspacing="1" border="0" class="tableBorder"
			align="center">
			<tr>
				<th width="100%" height="25" class="tableHeaderText">
					教师信息列表
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
<div>
    	<ul class="toolbar">
	<c:if test="${type.equals('管理员') }">
    	<li><a href="<%=path%>/tea/addTea.jsp"><span><img src="${pageContext.request.contextPath }/ncss/images/t01.png" /></span>添加教师</a></li>
	</c:if>
        <li>
        	<a href="${pageContext.request.contextPath }/teacher/excel?tea.name=${requestScope.tea.name }&tea.number=${requestScope.tea.number }&course.coursename=${requestScope.tea.course.coursename }">
  			<span><img src="${pageContext.request.contextPath }/ncss/images/f05.png" /></span>导出</a>
  		</li>
  	<c:if test="${type.equals('管理员') }">	
        <li><a href="${pageContext.request.contextPath }/echarts/tea_echarts.jsp"><span><img src="${pageContext.request.contextPath }/ncss/images/t04.png" /></span>统计</a></li>
    </c:if>
        </ul>
</div>
					<c:if test="${type.equals('管理员') }">
								<%-- <tr>
									<td height="25" class='forumRowHighLight'>
										&nbsp;|
										<a href="<%=path%>/tea/addTea.jsp">添加教师</a>
									</td>
								</tr> --%>
								<tr>
									<td height="30">
										<form action="list" method="post">
											<div align="center">
												&nbsp;
												<label>
												</label>
												<label>
													工号：
													<input type="text" name="tea.number" value="${requestScope.tea.number }"
														style="width: 150px" />
												</label>
												<label>
													姓名：
													<input type="text" name="tea.name" value="${requestScope.tea.name }"
														style="width: 150px" />
												</label>
												<label>
													所教课程：
													<input type="text" name="course.coursename" value="${requestScope.tea.course.coursename }"
														style="width: 150px" />
												</label>
												<label>
													&nbsp;
													<input type="submit" type="button" value="查 询" />
												</label>
											</div>
										</form>
									</td>
								</tr>
						</c:if>
							</table>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="2">
								<tr>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											工号
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											姓名
										</div>
									</td>
								<c:if test="${type.equals('管理员') }">
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											密码
										</div>
									</td>
								</c:if>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											性别
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											年龄
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											所教课程
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											入职日期
										</div>
									</td>
							<c:if test="${type.equals('管理员') }">
									<td width="9%" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											操作
										</div>
									</td>
							</c:if>
								</tr>
								<c:forEach items="${requestScope.tealist }" var="tea">
        							<tr align="center">
        								<%-- <td><input name="" type="checkbox" value="${student.id }" /></td> --%>
        								<td height="30">${tea.number }</td>
        								<td>${tea.name }</td>
        							<c:if test="${type.equals('管理员') }">
        								<td>${tea.password }</td>
        							</c:if>
        								<td>${tea.sex }</td>
        								<td>${tea.age }</td>
        								<td>${tea.course.coursename }</td>
        								<td>${tea.rdate }</td>
        							<c:if test="${type.equals('管理员') }">
        								<td><a href="toedit?tea.id=${tea.id }">编辑</a>
        									<a href="dodel?tea.id=${tea.id }" onclick="return checkdel();">删除</a>
        								</td>
        							</c:if>
        							</tr> 
								</c:forEach>
							</table>
						</td>
				</tr>
			</tr>
		</table>
		<div align="center">
  		<c:if test="${requestScope.pageindex>1 }">
  			<a href="list?page=1&tea.name=${requestScope.tea.name }&tea.number=${requestScope.tea.number }&course.coursename=${requestScope.tea.course.coursename }">首页</a>
  			<a href="list?page=${requestScope.pageindex-1 }&tea.name=${requestScope.tea.name }&tea.number=${requestScope.tea.number }&course.coursename=${requestScope.tea.course.coursename }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="list?page=${requestScope.pageindex+1 }&tea.name=${requestScope.tea.name }&tea.number=${requestScope.tea.number }&course.coursename=${requestScope.tea.course.coursename }">下一页</a>
  				<a href="list?page=${requestScope.pagecount }&tea.name=${requestScope.tea.name }&tea.number=${requestScope.tea.number }&course.coursename=${requestScope.tea.course.coursename }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
	</BODY>
</html>