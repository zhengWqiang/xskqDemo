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
					管理员列表
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="25" class='forumRowHighLight'>
										&nbsp;|
										<a href="<%=path %>/admin/addAdmin.jsp">添加管理员</a>
									</td>
								</tr>
							<tr>
									<td height="30">
										<form action="list" method="post">
											<div align="center">
												&nbsp;
												<label>
												</label>
												<label>
													姓名：
													<input type="text" name="admin.userName" value="${requestScope.admin.userName }"
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
										姓名
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										密码
									</div>
								</td>
								<td width="9%" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										操作
									</div>
								</td>
							</tr>
						<c:forEach items="${requestScope.adminlist }" var="adminlist">
							<tr>
								<td height="40" class='forumRow'>
									<div align="center">
										${adminlist.userName }
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										${adminlist.userPw }
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<a href="toedit?admin.id=${adminlist.id }">编辑</a>
										<a href="dodel?admin.id=${adminlist.id }" onclick="return checkdel();">删除</a> 
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
						<br/>
					</td>
				</tr>
			</tr>
		</table>
	<div align="center">
  		<c:if test="${requestScope.pageindex>1 }">
  			<a href="list?page=1&admin.userName=${requestScope.admin.userName }">首页</a>
  			<a href="list?page=${requestScope.pageindex-1 }&admin.userName=${requestScope.admin.userName }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="list?page=${requestScope.pageindex+1 }&admin.userName=${requestScope.admin.userName }">下一页</a>
  				<a href="list?page=${requestScope.pagecount }&admin.userName=${requestScope.admin.userName }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
</BODY>
</html>