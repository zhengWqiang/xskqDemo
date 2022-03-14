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
            query();
        });

        function query(currentPage) {
            let name = $("#name").val();
            let beginTime = $("#beginTime").val();
            let endTime = $("#endTime").val();
            $.ajax({
                type: "post",
                dataType: "json",
                url: "${pageContext.request.contextPath }/admin/getAopList",
                data: {
                    name: name,
                    beginTime: beginTime,
                    endTime: endTime,
                    currentPage: currentPage
                },
                success: function (data) {
                    debugger;
                    $("#tbody").empty();
                    $.each(data.aopPageInfo.list, function (key, obj) {
                        let tr = "<tr>";
                        tr += "<td height='30'>" + obj.name + "</td>";
                        tr += "<td>" + obj.date + "</td>";
                        tr += "<td>" + obj.event + "</td>";
                        tr += "</tr>";
                        $("#tbody").append(tr);
                    });
                    $("#curPage").html(data.aopPageInfo.pageNum);//当前页
                    $("#totalPages").html(data.aopPageInfo.pages);//总页数
                    $("#totals").html(data.aopPageInfo.total);//总条数
                    let pageInfo = "";
                    //无数据时，isFirstPage=false,isLastPage=true
                    /*if (data.aopPageInfo.isFirstPage === true) {
                        pageInfo += "<a>首页</a>";
                    } else {
                        pageInfo += '<a href="javascript:void(0);" onclick="query(' + data.aopPageInfo.navigateFirstPage + ')">首页</a>';
                    }*/
                    if (data.aopPageInfo.pageNum > 1) {
                        pageInfo += '<a href="javascript:void(0);" onclick="query(' + data.aopPageInfo.navigateFirstPage + ')">首页</a>';
                    } else {
                        pageInfo += "<a>首页</a>";
                    }
                    if (data.aopPageInfo.hasPreviousPage === true) {
                        pageInfo += '<a href="javascript:void(0);" onclick="query(' + data.aopPageInfo.prePage + ')">上一页</a>';
                    } else {
                        pageInfo += "<a>上一页</a>";
                    }
                    if (data.aopPageInfo.hasNextPage === true) {
                        pageInfo += '<a href="javascript:void(0);" onclick="query(' + data.aopPageInfo.nextPage + ')">下一页</a>';
                    } else {
                        pageInfo += "<a>下一页</a>";
                    }
                    if (data.aopPageInfo.isLastPage === true) {
                        pageInfo += "<a>末页</a>";
                    } else {
                        pageInfo += '<a href="javascript:void(0);" onclick="query(' + data.aopPageInfo.navigateLastPage + ')">末页</a>';
                        //pageInfo += '<a onclick="query(' + data.aopPageInfo.navigateLastPage + ')">末页</a>';
                    }
                    $("#page").html(pageInfo);
                },
                error: function (e) {
                    console.log("数据获取失败:" + e);
                    $.messager.alert('错误', e, 'error');
                }
            });
        }

        function excel() {
            debugger;
            let name = $("#name").val();
            let beginTime = $("#beginTime").val();
            let endTime = $("#endTime").val();
            window.location.href = "${pageContext.request.contextPath }/admin/getExcel?name=" + name + "&beginTime=" + beginTime + "&endTime=" + endTime;
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
                            <a href="javascript:void(0);" onclick="excel()">
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
                                    <input type="text" id="name" name="name"
                                           style="width: 150px" placeholder="请输入姓名"/>
                                </label>
                                <label>
                                    起始时间：
                                    <input type="text" id="beginTime" name="beginTime"
                                           style="width: 150px" class="Wdate"
                                           onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,readOnly:true,maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
                                </label>
                                <label>
                                    结束时间：
                                    <input type="text" id="endTime" name="endTime"
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
                <tbody id="tbody">

                </tbody>
            </table>
        </td>
    </tr>
</table>
<div align="center">
    <p>
        当前第 <span id="curPage"></span> 页,共 <span id="totalPages"></span> 页,共 <span id="totals"></span> 条记录
    </p>
    <p id="page">

    </p>
</div>
</body>
</html> 