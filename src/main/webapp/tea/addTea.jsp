<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function getCourse(){
  			$.ajax({
  				url:"${pageContext.request.contextPath }/course/json_course",
  				type:"get",
  				dataType:"json",
  				success:function(json){
  					/* alert(json); */
  					/* alert(json.typename); */
  					for(var i=0;i<json.typename.length;i++){
  						var json_course = json.typename[i];
  						var option = new Option(json_course.coursename,json_course.courseid,null);
  						document.getElementById("courseid").add(option);
  					}
  				}
  			});
  		}
function save() {
	if ($("#number").val() == "") {
		$.messager.alert('警告', '工号不能为空！', 'warning');
		return;
	}
	if ($("#name").val() == "") {
		$.messager.alert('警告', '姓名不能为空！', 'warning');
		return;
	}
	if ($("#password").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	if ($("#age").val() == "") {
		$.messager.alert('警告', '年龄不能为空！', 'warning');
		return;
	}
	if ($("#rdate").val() == "") {
		$.messager.alert('警告', '入职日期不能为空！', 'warning');
		return;
	}
	if ($("#courseid").val() == "0") {
		$.messager.alert('警告', '请选择所教课程！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/teacher/doadd";
	document.forms[0].submit();

}
</script>
	</head>
	<body leftMargin="0" topMargin="0" marginwidth="0" marginheight="0" onload="getCourse()">
		<br/>
		<form id="form1" name="form1" method="post" action="">
			<table cellpadding="3" cellspacing="1" border="1" class="tableBorder1" align="center">
				<tr>
					<th class="tableHeaderText" colspan="2" height="25">
						教师信息添加
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">工号</td>
					<td class="forumRowHighLight"><input id="number" name="tea.number" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">姓名</td>
					<td class="forumRowHighLight"><input id="name" name="tea.name" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">密码</td>
					<td class="forumRowHighLight"><input id="password" name="tea.password" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">性别</td>
					<td class="forumRowHighLight">
						<input id="sex" type="radio" name="tea.sex" value="男" checked="checked" style=" width:15px; height: 15px;" />男&nbsp; &nbsp;
	       				<input id="sex" type="radio" name="tea.sex" value="女" style=" width:15px; height: 15px;"/>女<br/>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">年龄</td>
					<td class="forumRowHighLight"><input id="age" name="tea.age" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">所教课程</td>
					<td class="forumRowHighLight">
						<select name="course.courseid" id="courseid">
    						<option value="0">请选择</option>
    					</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">入职日期</td>
					<td class="forumRowHighLight"><input id="rdate" name="tea.rdate" type="text" size="70%"
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
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