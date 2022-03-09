<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>考勤管理系统</title>

    <LINK href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/default/easyui.css" type="text/css" rel="stylesheet"></LINK>
    <LINK href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/icon.css" type="text/css" rel="stylesheet"></LINK>
    <script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/plugins/jquery.window.js"></script>
    <script type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/moment/2.24.0/moment.js"></script>
    <script type="text/javascript" src="<%=path%>/js/moment/2.24.0/moment-with-locales.js"></script>
    <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
    <script language="javascript">
        function up() {
            var pop = new Popup({
                contentType: 1,
                isReloadOnClose: false,
                width: 400,
                height: 200
            });
            pop.setContent("contentUrl", "<%=path%>/upload/upload.jsp");
            pop.setContent("title", "文件上传");
            pop.build();
            pop.show();
        }
    </script>
</head>
<body>
</body>
</html>