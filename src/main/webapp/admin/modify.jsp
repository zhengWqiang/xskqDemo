<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />

	</head>
	<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
		<br/>
	<form id="form1" name="form1" method="post" action="">
		<input name="admin.id" type="hidden" id="id" value="${id }"/>
			<table cellpadding="3" cellspacing="1" border="1" class="tableBorder1" align="center">
				<tr>
					<th class="tableHeaderText" colspan="2" height="25">
						密码修改
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">用户名</td>
					<td class="forumRowHighLight"><input id="userName" name="userName" type="text" size="70%" value="${username }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">输入原密码</td>
					<td class="forumRowHighLight"><input id="userPw1" name="userPw1" type="password" size="70%" /></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">输入新密码</td>
					<td class="forumRowHighLight"><input id="userPw2" type="password" size="70%" /></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">确认新密码</td>
					<td class="forumRowHighLight"><input id="userPw3" name="userPw3" type="password" size="70%" /></td>
				</tr>
				<tr>
						<td height="50" colspan="2" class='forumRow'>
							<div align="center">
								<input type="button" name="Submit" value="修改" class="button"
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
<script>

function save() {
	if ($("#userPw1").val() == ""||$("#userPw2").val() == ""||$("#userPw3").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	if ($("#userPw2").val() == $("#userPw1").val()){
		$.messager.alert('警告', '新密码不能和原密码一样！', 'warning');
		return;
	}
	if ($("#userPw3").val() != $("#userPw2").val()){
		$.messager.alert('警告', '两次密码输入不一致！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/admin/modify";
	document.forms[0].submit();

}
</script>
