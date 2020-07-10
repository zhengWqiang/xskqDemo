<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
	</HEAD>
<BODY leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
		<br/>
		<table cellpadding="3" cellspacing="1" border="0" class="tableBorder"
			align="center">
			<tr>
				<th width="100%" height="25" class="tableHeaderText">
					考勤列表
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
<div>
    	<ul class="toolbar">
        <li><a href="${pageContext.request.contextPath }/kao/excel?stunumber=${requestScope.kao.stunumber }&stuname=${requestScope.kao.stuname }&banji=${requestScope.kao.banji }&coursename=${requestScope.kao.course.coursename }&adate=${requestScope.kao.adate }">
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
													课程：
													<input type="text" name="c.coursename" value="${requestScope.kao.course.coursename }"
														style="width: 150px" />
												</label>
												<label>
													时间：
													<input type="text" name="k.adate" value="${requestScope.kao.adate }"
														style="width: 150px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
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
											学号
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											姓名
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											班级
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											课程
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											考勤时间
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											是否缺勤
										</div>
									</td>
								</tr>
								<c:forEach items="${requestScope.kaolist }" var="k">
        							<tr align="center">
        								<%-- <td><input name="" type="checkbox" value="${student.id }" /></td> --%>
        								<td height="30">${k.stunumber }</td>
        								<td>${k.stuname }</td>
        								<td>${k.banji }</td>
        								<td>${k.course.coursename }</td>
        								<td>${k.adate }</td>
        								<td>${k.qin }</td>
        							</tr> 
								</c:forEach>
							</table>
						</td>
				</tr>
			</tr>
		</table>
		<div align="center">
  		<c:if test="${requestScope.pageindex>1 }">
  			<a href="list?page=1&k.stunumber=${requestScope.kao.stunumber }&k.stuname=${requestScope.kao.stuname }&k.banji=${requestScope.kao.banji }&c.coursename=${requestScope.kao.course.coursename }&k.adate=${requestScope.kao.adate }">首页</a>
  			<a href="list?page=${requestScope.pageindex-1 }&k.stunumber=${requestScope.kao.stunumber }&k.stuname=${requestScope.kao.stuname }&k.banji=${requestScope.kao.banji }&c.coursename=${requestScope.kao.course.coursename }&k.adate=${requestScope.kao.adate }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="list?page=${requestScope.pageindex+1 }&k.stunumber=${requestScope.kao.stunumber }&k.stuname=${requestScope.kao.stuname }&k.banji=${requestScope.kao.banji }&c.coursename=${requestScope.kao.course.coursename }&k.adate=${requestScope.kao.adate }">下一页</a>
  				<a href="list?page=${requestScope.pagecount }&k.stunumber=${requestScope.kao.stunumber }&k.stuname=${requestScope.kao.stuname }&k.banji=${requestScope.kao.banji }&c.coursename=${requestScope.kao.course.coursename }&k.adate=${requestScope.kao.adate }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
</BODY>
</html>