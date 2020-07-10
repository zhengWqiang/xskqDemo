<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
					课程信息列表
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
					<%-- <c:if test="${type.equals('管理员') }">
								<tr>
									<td height="25" class='forumRowHighLight'>
										&nbsp;|
										<a href="<%=path%>/ke/addKe.jsp">添加课程信息</a>
									</td>
								</tr>
					</c:if> --%>
<div>
    	<ul class="toolbar">
					<c:if test="${type.equals('管理员') }">
    	<li><a href="<%=path%>/ke/addKe.jsp"><span><img src="${pageContext.request.contextPath }/ncss/images/t01.png" /></span>添加课程</a></li>
					</c:if>
        <li><a href="${pageContext.request.contextPath }/course/excel?coursename=${requestScope.course.coursename }">
  			<span><img src="${pageContext.request.contextPath }/ncss/images/f05.png" /></span>导出</a></li>
        </ul>
</div>
								<tr>
									<td height="30">
										<form action="list" method="post">
											<div align="center">
												&nbsp;
												<label>
												</label>
												<label>
													课程名称：
													<input type="text" name="course.coursename" value="${requestScope.course.coursename }"
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
							</table>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="2">
								<tr>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											课程名称
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											教室
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											课程描述
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
								<c:forEach items="${requestScope.courselist }" var="co">
        							<tr align="center">
        								<%-- <td><input name="" type="checkbox" value="${student.id }" /></td> --%>
        								<td height="30">${co.coursename }</td>
        								<td>${co.classroom }</td>
        								<td>${co.info }</td>
        							<c:if test="${type.equals('管理员') }">
        								<td><a href="toedit?course.courseid=${co.courseid }">编辑</a>
        									<a href="dodel?course.courseid=${co.courseid }" onclick="return checkdel();">删除</a>
        								</td>
        							</c:if>
        							</tr> 
								</c:forEach>
<%-- 								<c:forEach items="${requestScope.courselist }" var="co">
        							<tr align="center">
        								<td><input name="" type="checkbox" value="${student.id }" /></td>
        								<td height="30">${co[0] }</td>
        								<td>${co[2] }</td>
        								<td>${co[1] }</td>
        							<c:if test="${type.equals('管理员') }">
        								<td><a href="toedit?name=${co[0] }">编辑</a>
        									<a href="dodel?name=${co[0] }" onclick="return checkdel();">删除</a>
        								</td>
        							</c:if>
        							</tr> 
								</c:forEach> --%>
							</table>
						</td>
				</tr>
			</tr>
		</table>
		<div align="center">
  		<c:if test="${requestScope.pageindex>1 }">
  			<a href="list?page=1&course.coursename=${requestScope.course.coursename }">首页</a>
  			<a href="list?page=${requestScope.pageindex-1 }&course.coursename=${requestScope.course.coursename }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="list?page=${requestScope.pageindex+1 }&course.coursename=${requestScope.course.coursename }">下一页</a>
  				<a href="list?page=${requestScope.pagecount }&course.coursename=${requestScope.course.coursename }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
	</BODY>
</html>