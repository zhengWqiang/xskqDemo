<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
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
  					/* alert(json.typename);
  					alert(json.typename.length); */
  					for(var i=0;i<json.typename.length;i++){
  						var json_course = json.typename[i];
  						var option = new Option(json_course.coursename,json_course.courseid,null);
  						document.getElementById("courseid").add(option);
  					}
  				}
  			});
  		}
 function getTeacher(){
  			$("#id").empty();
  			var courseid =$("#courseid").val();
  			if(courseid=="0"){
  				document.getElementById("id").add(new Option("请选择",null,null));
  			}else{
	  			$.ajax({
	  				url:"${pageContext.request.contextPath }/teacher/json_teacher",
	  				data:{"course.courseid":$("#courseid").val()},
	  				type:"get",
	  				dataType:"json",
	  				success:function(json){
	  					/* alert(json.typename); */
	  					for(var i=0;i<json.typename.length;i++){
	  						var json_teacher = json.typename[i];
	  						var option = new Option(json_teacher.name,json_teacher.id,null);
	  						document.getElementById("id").add(option);
	  					}
	  				}
	  			});
  			}
  		}
function save() {
	if ($("#courseid").val() == "0") {
		$.messager.alert('警告', '请选择课程！', 'warning');
		return;
	}
	if ($("#adate").val() == "0") {
		$.messager.alert('警告', '请选择日期！', 'warning');
		return;
	}
	if ($("#info").val() == "") {
		$.messager.alert('警告', '请假原因不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/qing/doadd";
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
						请假申请
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">姓名</td>
					<td class="forumRowHighLight">${ user}
						<input id="name" name="q.name" type="hidden" size="70%" value="${user }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">班级</td>
					<td class="forumRowHighLight">${classname }
						<input id="banji" name="q.banji" type="hidden" size="70%" value="${classname }" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">课程</td>
					<td class="forumRowHighLight">
						<select name="c.courseid" id="courseid" onchange="getTeacher()">
    						<option value="0">请选择</option>
    					</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">教师</td>
					<td class="forumRowHighLight">
						<select name="t.id" id="id">
    						<option value="0">请选择</option>
    					</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">请假日期</td>
					<td class="forumRowHighLight"><input id="adate" name="q.adate" type="text" size="70%"
													onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">请假原因</td>
					<td class="forumRowHighLight"><input id="info" name="q.info" type="text" size="70%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" width="20%" align="center">附件</td>
					<td class="forumRowHighLight"><input id="fujian" name="q.fujian" type="text" size="60%"/>&nbsp;
												  <input type="button" value="上传" onclick="up()" />
												  <input id="state" name="q.state" type="hidden" value="提交申请" size="70" />
					</td>
				</tr>
					<!-- <tr>
						<td class='forumRowHighLight' height=23>
							病历
						</td>
						<td class='forumRowHighLight'>
							<input id="fujian" name="fujian" type='text' size='70'>
								&nbsp; 
							<input type="button" value="上传" onclick="up()" />	
							<input id="state" name="state" type='hidden' value="提交申请" size='70'>	
						</td>
					</tr> -->
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
