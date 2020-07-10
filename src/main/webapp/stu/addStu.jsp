<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		function back(){
			history.go(-1);
		}
  		function getMajor(){
  			$.ajax({
  				url:"${pageContext.request.contextPath }/student/json_major",
  				type:"get",
  				dataType:"json",
  				success:function(json){
  					/* alert(json.typename); */
  					for(var i=0;i<json.typename.length;i++){
  						var json_major = json.typename[i];
  						var option = new Option(json_major.majorname,json_major.majorid,null);
  						document.getElementById("majorid").add(option);
  					}
  				}
  			});
  		}
  		function getCls(){
  			$("#classid").empty();
  			var majorid =$("#majorid").val();
  			if(majorid=="0"){
  				document.getElementById("classid").add(new Option("请选择",null,null));
  			}else{
	  			$.ajax({
	  				url:"${pageContext.request.contextPath }/student/json_cls",
	  				data:{"major.majorid":$("#majorid").val()},
	  				type:"get",
	  				dataType:"json",
	  				success:function(json){
	  					/* alert(json.typename); */
	  					for(var i=0;i<json.typename.length;i++){
	  						var json_cls = json.typename[i];
	  						var option = new Option(json_cls.classname,json_cls.classid,null);
	  						document.getElementById("classid").add(option);
	  					}
	  				}
	  			});
  			}
  		}
 function save() {
	if ($("#number").val() == "") {
		$.messager.alert('警告', '学号不能为空！', 'warning');
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
		$.messager.alert('警告', '入学日期不能为空！', 'warning');
		return;
	}
	if ($("#majorid").val() == "0") {
		$.messager.alert('警告', '请选择专业！', 'warning');
		return;
	}
	document.forms[0].action = "${pageContext.request.contextPath }/student/doadd";
	document.forms[0].submit();

}
 </script>
	</head>
	<body leftMargin="0" topMargin="0" marginwidth="0" marginheight="0" onload="getMajor()">

		<br/>
		<form id="form1" name="form1" method="post" action="">
			<table cellpadding="3" cellspacing="1" border="1" class="tableBorder1" align="center">
				<tr>
					<th class="tableHeaderText" colspan="2" height="25">
						学生信息添加
					</th>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">学号</td>
					<td class="forumRowHighLight"><input id="number" name="stu.number" type="text" style="width:90%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">专业</td>
					<td class="forumRowHighLight">
						<select name="major.majorid" id="majorid" onchange="getCls()">
    						<option value="0">请选择</option>
    					</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">班级</td>
					<td class="forumRowHighLight">
						<select name="cls.classid" id="classid">
     						<option value="0">请选择</option>
   						</select>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">姓名</td>
					<td class="forumRowHighLight"><input id="name" name="stu.name" type="text" style="width:90%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">密码</td>
					<td class="forumRowHighLight"><input id="password" name="stu.password" type="text" style="width:90%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">性别</td>
					<td class="forumRowHighLight">
						<input id="sex" type="radio" name="stu.sex" value="男" checked="checked" style=" width:15px; height: 15px;" />男&nbsp; &nbsp;
	       				<input id="sex" type="radio" name="stu.sex" value="女" style=" width:15px; height: 15px;"/>女<br/>
					</td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">年龄</td>
					<td class="forumRowHighLight"><input id="age" name="stu.age" type="text" style="width:90%"/></td>
				</tr>
				<tr>
					<td class="forumRowHighLight" height="23" align="center">入学日期</td>
					<td class="forumRowHighLight"><input id="rdate" name="stu.rdate" type="text" style="width:90%" 
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
