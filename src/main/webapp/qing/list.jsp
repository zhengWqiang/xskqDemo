<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
<script language="javascript">

function down1(fujianPath, fujianYuashiMing) {

	var url = "&lt;%=path%>/upload/updown.jsp?fujianPath=" + fujianPath
			+ "&amp;fujianYuashiMing=" + fujianYuashiMing;
	url = encodeURI(url);
	url = encodeURI(url);

	window.open(url, "_self");

	return false;
}
</script>
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
	</head>
<BODY leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
		<br/>
		<table cellpadding="3" cellspacing="1" border="0" class="tableBorder"
			align="center">
			<tr>
				<th width="100%" height="25" class="tableHeaderText">
					请假管理
				</th>
				<tr>
					<td height="450" valign="top" class="forumRow">
						<br/>
							<table width="95%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="30">
										<form action="list" method="post">
											<div align="center">
												&nbsp;
												<label>
												</label>
												<label>
													课程：
													<input type="text" name="c.coursename" value="${requestScope.q.course.coursename }"
														style="width: 150px" />
												</label>
												<label>
													时间：
													<input type="text" name="q.adate" value="${requestScope.q.adate }"
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
											请假时间
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											原因
										</div>
									</td>

									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											病例
										</div>
									</td>
									
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											审批状态
										</div>
									</td>
									<td width="10%" height="30" class="TitleHighlight">
										<div align="center" style="font-weight: bold; color: #ffffff">
											操作
										</div>
									</td>
								</tr>
								<c:forEach items="${requestScope.qinglist }" var="q">
        							<tr align="center">
        								<%-- <td><input name="" type="checkbox" value="${student.id }" /></td> --%>
        								<td height="30">${q.name }</td>
        								<td>${q.banji }</td>
        								<td>${q.course.coursename }</td>
        								<td>${q.adate }</td>
        								<td>${q.info }</td>
        								<td>
        									<c:if test="${q.fujian!='' }">
        										<a style="color: red; font-size: 10px;" href="#"
									onclick='return down1("${q.fujian }","${q.fujian }")'>下载</a>
        									</c:if>
        								</td>
        								<td>${q.state }</td>
        								<td><c:if test="${q.state=='提交申请' }">
        										<a href="dodel?q.qingid=${q.qingid }" onclick="return checkdel();">删除</a>
        									</c:if>
        									<c:if test="${q.state!='提交申请' }">
        									</c:if>
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
  			<a href="list?page=1&q.name=${requestScope.q.name }&q.banji=${requestScope.q.banji }&c.coursename=${requestScope.q.course.coursename }&q.adate=${requestScope.q.adate }">首页</a>
  			<a href="list?page=${requestScope.pageindex-1 }&q.name=${requestScope.q.name }&q.banji=${requestScope.q.banji }&c.coursename=${requestScope.q.course.coursename }&q.adate=${requestScope.q.adate }">上一页</a>
  		</c:if>
  		<c:if test="${requestScope.pageindex<=1 }">
  			首页  上一页
  		</c:if>
  		
  		<c:choose>
  			<c:when test="${requestScope.pageindex<requestScope.pagecount }">
  				<a href="list?page=${requestScope.pageindex+1 }&q.name=${requestScope.q.name }&q.banji=${requestScope.q.banji }&c.coursename=${requestScope.q.course.coursename }&q.adate=${requestScope.q.adate }">下一页</a>
  				<a href="list?page=${requestScope.pagecount }&q.name=${requestScope.q.name }&q.banji=${requestScope.q.banji }&c.coursename=${requestScope.q.course.coursename }&q.adate=${requestScope.q.adate }">末页</a>
  			</c:when>
  			<c:otherwise>
  				下一页  尾页
  			</c:otherwise>
  		</c:choose>
  	</div>
</BODY>
</html>