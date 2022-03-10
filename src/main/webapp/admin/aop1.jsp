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
            let beginTime = $("#beginTime").val();
            if (!beginTime) {
                $("#beginTime").val(moment(new Date()).format("YYYY-MM-DD 00:00:00"));
                $("#endTime").val(moment(new Date()).format("YYYY-MM-DD HH:mm:ss"));
            }
        });

        function query() {
            let name = $("#name").val();
            let beginTime = $("#beginTime").val();
            let endTime = $("#endTime").val();
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
</head>
<body leftMargin="0" topMargin="0" marginwidth="0" marginheight="0">
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
                            <a href="${pageContext.request.contextPath }/admin/excel?name=${name }&beginTime=${beginTime }&endTime=${endTime }">
                                <span><img src="${pageContext.request.contextPath }/ncss/images/f05.png"/></span>导出</a>
                        </li>
                    </ul>
                </div>
                <tr>
                    <td height="30">
                        <form action="<%=path %>/admin/getAopList" method="post">
                            <div align="center">
                                <label>
                                    姓名：
                                    <input type="text" id="name" name="name" value="${name }"
                                           style="width: 150px" placeholder="请输入姓名"/>
                                </label>
                                <label>
                                    起始时间：
                                    <input type="text" id="beginTime" name="beginTime" value="${beginTime }"
                                           style="width: 150px" class="Wdate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
                                </label>
                                <label>
                                    结束时间：
                                    <input type="text" id="endTime" name="endTime" value="${endTime }"
                                           style="width: 150px" class="Wdate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,readOnly:true,minDate:'#F{$dp.$D(\'beginTime\')}',maxDate:'%y-%M-%d %H:%m:%s'})"/>
                                </label>
                                <label>
                                    <%--<input type="submit" value="查 询" onclick="query();return false;"/>--%>
                                    <input type="submit" value="查 询"/>
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
                <c:forEach items="${aopPageInfo.list }" var="aop">
                    <tr align="center">
                        <td height="30">${aop.name }</td>
                        <td>${aop.date }</td>
                        <td>${aop.event }</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
</table>
<div align="center">
    <p>
        <c:choose>
            <c:when test="${aopPageInfo != null }">
                当前 ${aopPageInfo.pageNum } 页,总 ${aopPageInfo.pages } 页,总 ${aopPageInfo.total } 条记录
            </c:when>
            <c:otherwise>
                当前 0 页,总 0 页,总 0 条记录
            </c:otherwise>
        </c:choose>
    </p>
    <%--<c:if test="${aopPageInfo.pageNum>1 }">
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=1&name=${name }&beginTime=${beginTime }&endTime=${endTime }">
            首页
        </a>
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.pageNum-1 }&name=${name }&beginTime=${beginTime }&endTime=${endTime }">
            上一页
        </a>
    </c:if>
    <c:if test="${aopPageInfo.pageNum<=1 }">
        首页 上一页
    </c:if>
    <c:choose>
        <c:when test="${aopPageInfo.pageNum<aopPageInfo.pages }">
            <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.pageNum+1 }&name=${name }&beginTime=${beginTime }&endTime=${endTime }">
                下一页
            </a>
            <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.pages }&name=${name }&beginTime=${beginTime }&endTime=${endTime }">
                末页
            </a>
        </c:when>
        <c:otherwise>
            下一页 尾页
        </c:otherwise>
    </c:choose>--%>
    <c:if test="${aopPageInfo.isFirstPage==true}"><a>首页</a> </c:if>
    <c:if test="${aopPageInfo.isFirstPage==false}">
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.navigateFirstPage}&name=${name}&beginTime=${beginTime}&endTime=${endTime}">首页</a>
    </c:if>
    <c:if test="${aopPageInfo.hasPreviousPage==true}">
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.prePage}&name=${name}&beginTime=${beginTime}&endTime=${endTime}">上一页</a>
    </c:if>
    <c:if test="${aopPageInfo.hasPreviousPage==false}"><a>上一页</a> </c:if>
    <c:if test="${aopPageInfo.hasNextPage==true}">
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.nextPage}&name=${name}&beginTime=${beginTime}&endTime=${endTime}">下一页</a>
    </c:if>
    <c:if test="${aopPageInfo.hasNextPage==false}"><a>下一页</a> </c:if>
    <c:if test="${aopPageInfo.isLastPage==true}"><a>末页</a> </c:if>
    <c:if test="${aopPageInfo.isLastPage==false}">
        <a href="${pageContext.request.contextPath}/admin/getAopList?currentPage=${aopPageInfo.navigateLastPage}&name=${name}&beginTime=${beginTime}&endTime=${endTime}">末页</a>
    </c:if>
</div>
</body>
</html> 