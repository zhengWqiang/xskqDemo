<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  					for(var i=0;i<json.typename.length;i++){
  						var json_course = json.typename[i];
  						var option = new Option(json_course.coursename,json_course.courseid,null);
  						document.getElementById("courseid").add(option);
  					}
  				}
  			});
  		}
function save() {
	if ($("#courseid").val() == "0") {
		$.messager.alert('警告', '请选择课程！', 'warning');
		return;
	}
	if ($("#adate").val() == "") {
		$.messager.alert('警告', '请选择考勤日期！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/kao/doadd";
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
						添加学生考勤
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">学号</td>
					<td class="forumRowHighLight"><input id="stunumber" name="k.stunumber" type="text" style="width:90%" value="${requestScope.stu.number }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">姓名</td>
					<td class="forumRowHighLight"><input id="stuname" name="k.stuname" type="text" style="width:90%" value="${requestScope.stu.name }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">班级</td>
					<td class="forumRowHighLight"><input id="banji" name="k.banji" type="text" style="width:90%" value="${requestScope.stu.cls.classname }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">课程</td>
					<td class="forumRowHighLight">
						<select name="c.courseid" id="courseid">
    						<option value="0">请选择</option>
    					</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">考勤时间</td>
					<td class="forumRowHighLight"><input id="adate" name="k.adate" type="text" style="width:90%" 
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">是否缺勤</td>
					<td class="forumRowHighLight">
						<select id="qin" name="k.qin" >
							  <option value="否" >否</option>
							  <option value="是" selected="selected">是</option>
						</select>
					</td>
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

