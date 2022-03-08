<%@include file="/common/sub_header.jsp" %>
<%@ page language="java" import="java.util.*"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            debugger;
            $("#beginTime").val(moment(new Date()).format("YYYY-MM-DD 00:00:00"));
            $("#endTime").val(moment(new Date()).format("YYYY-MM-DD HH:mm:ss"));
        });
        function query() {
            var name = $("#name").val();
            var beginTime = $("#beginTime").val();
            var endTime = $("#endTime").val();
            $.ajax({
                type: "post",
                dataType: "json",
                url: "${pageContext.request.contextPath }/admin/getAopList",
                data: {
                    "name": name,
                    "beginTime": beginTime,
                    "endTime": endTime
                },
                success: function (data) {
                    debugger;
                    if (data.warn) {
                        document.getElementById("warn").innerHTML = data.warn;
                        document.getElementById("userpwd").value = "";
                    } else {
                        window.location.href = "${pageContext.request.contextPath}/login/goIndex";
                    }
                },
                error: function (e) {
                    console.log("数据获取失败:" + e);
                    alert("Error!" + e);
                }
            });
        }
    </script>
</HEAD>
<BODY leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
<br/>
<table cellpadding="3" cellspacing="1" border="0" class="tableBorder"
       align="center">
    <tr>
        <th width="100%" height="25" class="tableHeaderText">
            日志列表
        </th>
    <tr>
        <td height="450" valign="top" class="forumRow">
            <b>当前在线人数:${applicationScope.number }</b>
            <hr/>
            <table width="95%" border="0" align="center" cellpadding="0"
                   cellspacing="0">
                <div>
                    <ul class="toolbar">
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/excel?name=${requestScope.aop.name }&begintime=${requestScope.begintime }&endtime=${requestScope.endtime }">
                                <span><img src="${pageContext.request.contextPath }/ncss/images/f05.png"/></span>导出</a>
                        </li>
                    </ul>
                </div>
                <tr>
                    <td height="30">
                        <form method="post">
                            <div align="center">
                                <label>
                                    姓名：
                                    <input type="text" id="name" value="${requestScope.aop.name }"
                                           style="width: 150px"/>
                                </label>
                                <label>
                                    起始时间：
                                    <input type="text" id="beginTime" value="${requestScope.beginTime }"
                                           style="width: 150px" class="Wdate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
                                </label>
                                <label>
                                    结束时间：
                                    <input type="text" id="endTime" value="${requestScope.endTime }"
                                           style="width: 150px" class="Wdate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}',maxDate:'%y-%M-%d %H:%m:%s'})"/>
                                </label>
                                <label>
                                    <input type="submit" value="查 询" onclick="query();return false;"/>
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
                            操作者
                        </div>
                    </td>
                    <td width="10%" height="30" class="TitleHighlight">
                        <div align="center" style="font-weight: bold; color: #ffffff">
                            时间
                        </div>
                    </td>
                    <td width="10%" height="30" class="TitleHighlight">
                        <div align="center" style="font-weight: bold; color: #ffffff">
                            事件
                        </div>
                    </td>
                </tr>
                <c:forEach items="${requestScope.aoplist }" var="aop">
                    <tr align="center">
                        <td height="30">${aop.name }</td>
                        <td>${aop.date }</td>
                        <td>${aop.event }</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    </tr>
</table>
<div align="center">
    <c:if test="${requestScope.pageindex>1 }">
        <a href="aoplist?page=1&name=${requestScope.aop.name }&begintime=${requestScope.begintime }&endtime=${requestScope.endtime }">首页</a>
        <a href="aoplist?page=${requestScope.pageindex-1 }&name=${requestScope.aop.name }&begintime=${requestScope.begintime }&endtime=${requestScope.endtime }">上一页</a>
    </c:if>
    <c:if test="${requestScope.pageindex<=1 }">
        首页 上一页
    </c:if>
    <c:choose>
        <c:when test="${requestScope.pageindex<requestScope.pagecount }">
            <a href="aoplist?page=${requestScope.pageindex+1 }&name=${requestScope.aop.name }&begintime=${requestScope.begintime }&endtime=${requestScope.endtime }">下一页</a>
            <a href="aoplist?page=${requestScope.pagecount }&name=${requestScope.aop.name }&begintime=${requestScope.begintime }&endtime=${requestScope.endtime }">末页</a>
        </c:when>
        <c:otherwise>
            下一页 尾页
        </c:otherwise>
    </c:choose>
</div>
</BODY>
</html> 