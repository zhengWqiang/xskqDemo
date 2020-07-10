<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function save() {
	if ($("#coursename").val() == "") {
		$.messager.alert('警告', '课程名称不能为空！', 'warning');
		return;
	}
	if ($("#classroom").val() == "") {
		$.messager.alert('警告', '教室不能为空！', 'warning');
		return;
	}
	if ($("#info").val() == "") {
		$.messager.alert('警告', '课程描述不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/course/doadd";
	document.forms[0].submit();

}
</script>
	</head>
	<body leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">

		<br/>
		<form id="form1" name="form1" method="post" action="">
			<table cellpadding="3" cellspacing="1" border="1" class="tableBorder1" align="center">
				<tr>
					<th class="tableHeaderText" colspan="2" height="25">
						课程信息添加
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">课程名称</td>
					<td class="forumRowHighLight"><input id="coursename" name="course.coursename" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">教室</td>
					<td class="forumRowHighLight"><input id="classroom" name="course.classroom" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">课程描述</td>
					<td class="forumRowHighLight"><input id="info" name="course.info" type="text" size="70%"/></td>
				</tr>
				<tr>
						<td height="50" colspan="2" class='forumRow'>
							<div align="center">
								<input type="button" name="Submit" value="保存" class="button"
									onclick="save();" />

								<input type="button" name="Submit2" value="返回" class="button"
									onclick="window.history.go(-1);" />
							</div>
						</td>
				</tr>
			</table>
		</form>
	</body>
</html>