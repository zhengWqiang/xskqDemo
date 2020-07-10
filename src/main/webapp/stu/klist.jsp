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
					学生考勤添加
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="30">
										<form action="klist" method="post">
											<div align="center">
												&nbsp;
												<label>
												</label>
												<label>
													学号：
													<input type="text" name="stu.number" value="${requestScope.stu.number }"
														style="width: 150px" />
												</label>
												<label>
													姓名：
													<input type="text" name="stu.name" value="${requestScope.stu.name }"
														style="width: 150px" />
												</label>
												<label>
													专业：
													<input type="text" name="major.majorname" value="${requestScope.stu.major.majorname }"
														style="width: 150px" />
												</label>
												<label>
													班级：
													<input type="text" name="cls.classname" value="${requestScope.stu.cls.classname }"
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
											学号
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
											班级
										</div>
									</td>
									
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											专业
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											入学日期
										</div>
									</td>
									<td width="9%" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											操作
										</div>
									</td>
								</tr>
								<c:forEach items="${requestScope.stulist }" var="student">
        							<tr align="center">
        								<%-- <td><input name="" type="checkbox" value="${student.id }" /></td> --%>
        								<td height="30">${student.number }</td>
        								<td>${student.name }</td>
        							<c:if test="${type.equals('管理员') }">
        								<td>${student.password }</td>
        							</c:if>
        								<td>${student.sex }</td>
        								<td>${student.age }</td>
        								<td>${student.cls.classname }</td>
        								<td>${student.major.majorname }</td>
        								<td>${student.rdate }</td>
        								<td><a href="toadd?stu.id=${student.id }">添加</a>
        								</td>
        							</tr> 
								</c:forEach>
							</table>
						</td>
				</tr>
			</tr>
		</table>
		<div align="center">
  		<c:if test="${requestScope.pageindex>1 }">
  			<a href="klist?page=1&stu.name=${requestScope.stu.name }&stu.number=${requestScope.stu.number }&major.majorname=${requestScope.stu.major.majorname }&cls.classname=${requestScope.stu.cls.classname }">首页</a>
  			<a href="klist?page=${requestScope.pageindex-1 }&stu.name=${requestScope.stu.name }&stu.number=${requestScope.stu.number }&major.majorname=${requestScope.stu.major.majorname }&cls.classname=${requestScope.stu.cls.classname }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="klist?page=${requestScope.pageindex+1 }&stu.name=${requestScope.stu.name }&stu.number=${requestScope.stu.number }&major.majorname=${requestScope.stu.major.majorname }&cls.classname=${requestScope.stu.cls.classname }">下一页</a>
  				<a href="klist?page=${requestScope.pagecount }&stu.name=${requestScope.stu.name }&stu.number=${requestScope.stu.number }&major.majorname=${requestScope.stu.major.majorname }&cls.classname=${requestScope.stu.cls.classname }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
</BODY>
</html>