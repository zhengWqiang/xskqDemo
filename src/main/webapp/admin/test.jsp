<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <!-- 使用模态窗口引入bootstrap -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resouces/js/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resouces/js/bootstrap/css/bootstrap-theme.min.css">
    <script src="${pageContext.request.contextPath}/resouces/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resouces/js/bootstrap/js/bootstrap.min.js"></script>
    <!--最基础jQuery.js都是基于这个  -->
    <script type="text/javascript" src="resouces/jquery-1.11.3.min.js"></script>
    <!-- 异步转换参数js -->
    <script type="text/javascript" src="resouces/jqueryExt.js"></script>
    <!-- 上传文件js -->
    <script type="text/javascript" src="resouces/jquery.form.js"></script>
</head>

<body>
<table class="table table-hover">
    <thead>
    <tr class="success">
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品类型</th>
        <th>商品Desc</th>
        <th>商品价格</th>
        <!-- <th>商品图片</th> -->
        <th>商品数量</th>
        <th>日期</th>
        <!-- <th>操作</th> -->
        <th colspan="3">查询
            <input type="text" onblur="queryTbGoods()" size="6" class="goodsName" id="goodsNames" placeholder="请输入名称"
                   name="goodsName">
            <input type="text" onblur="queryTbGoods()" size="6" class="goodsName" id="typeNames" placeholder="请输入类型"
                   name="typeName">
            <input type="button" data-toggle="modal" data-target="#myModal" class="emptys btn btn-default" value="添加">
        </th>

    </tr>
    </thead>
    <tbody id="tbody">

    </tbody>
</table>

<!-- 模态框弹出录入内容 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="modalTitle1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                    ×
                    <!-- 关闭按钮 -->
                </button>
                <h4 class="modal-title" id="modalTitle1">录入商品</h4>
            </div>
            <div class="modal-body">
                <!--form提交表单  -->
                <form class="form-horizontal" id="form1" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="roleName" class="col-sm-2 control-label">商品名</label>
                        <div class="col-sm-4">

                            <input type="hidden" id="goodsId" name="goodsId" class="form-control" placeholder="请输入">
                            <input type="text" id="goodsName" name="goodsName" class="form-control"
                                   placeholder="请输入商品名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">商品类型</label>
                        <div class="col-sm-4">

                            <select class="sele form-control" name="typeId">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">商品Desc</label>
                        <div class="col-sm-4">
                            <input type="text" id="goodsDesc" class="form-control" name="goodsDesc"
                                   placeholder="请输入">

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">商品价格</label>
                        <div class="col-sm-4">
                            <input type="text" id="goodsUnitPrice" class="form-control" name="goodsUnitPrice"
                                   placeholder="请输入">

                        </div>
                    </div>

                    <!-- <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">商品图片</label>
                        <div class="col-sm-4">

                                <input type="file"   name="goodsImage"/>

                        </div>
                    </div> -->

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-4">
                            <input type="text" id="sellCount" class="form-control" name="sellCount"
                                   placeholder="请输入">

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">日期</label>
                        <div class="col-sm-4">
                            <input type="date" id="goodsDate" class="form-control" name="goodsDate"
                                   placeholder="请输入">

                        </div>
                    </div>

                    <input type="button" id="saveUploadOrUpdate" data-toggle='modal' data-target='#myModal'
                           class="btn btn-primary" value="保存">
                </form>

            </div>
            <div class="modal-footer">

                <button type="button" class="up btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<ul class="pager">
    <li>
        当前页:<span id="curPage"></span>总页数:<span id="totalPages"></span>总共:<span id="totals"></span>条记录
    </li>
    <li><a id="first" onclick="changePage(this)">首页</a></li>
    <li><a id="prev" onclick="changePage(this)">上一页</a></li>
    <li><a id="next" onclick="changePage(this)">下一页</a></li>
    <li><a id="last" onclick="changePage(this)">尾页</a></li>
    <li><input type="number" id="txtCurPage" min="1" max="10"></input><input type="button" class="btn btn-default"
                                                                             value="go" onclick="gotoPage()"/></li>
</ul>
</body>
</html>
<script>
    $(function () {
        queryTbGoods();
        queryTbGoodsType();
    });

    /* 查询商品表 */
    function queryTbGoods(page) {

        var name = $("#goodsNames").val();
        var tyName = $("#typeNames").val();
        /* alert(name+":参数:"+tyName); */
        $.ajax({
            url: "goods/queryTbGoods",
            type: "post",
            data: {"goodsName": name, "typeName": tyName, "pageNum": page, "pageSize": 3},
            dataType: "json",
            success: function (data) {
                alert(data.pages);
                $("#tbody").empty();
                $.each(data.list, function (key, obj) {
                    /* alert(obj.typeId.typeName); */
                    var tr = "<tr>";
                    tr += "<td>" + obj.goodsId + "</td>";
                    tr += "<td>" + obj.goodsName + "</td>";
                    tr += "<td>" + obj.typeName + "</td>";
                    tr += "<td>" + obj.goodsDesc + "</td>";
                    tr += "<td>" + obj.goodsUnitPrice + "</td>";
                    /* tr+="<td><img style=' width:80px; height:80px;' src='"+obj.goodsImageName+"'/></td>"; */
                    tr += "<td>" + obj.sellCount + "</td>";
                    tr += "<td>" + obj.goodsDate + "</td>";
                    tr += "<td><input type='button'  id=" + obj.goodsId + " data-toggle='modal' data-target='#myModal' title=" + obj.goodsId + "  class='findById btn btn-default' value='修改'></td>";
                    tr += "<td><input type='button' id=" + obj.goodsId + "  class='delete btn btn-default' value='删除'></td>";
                    tr += "</tr>";
                    $("#tbody").append(tr);

                    //重新初始化分页链接
                    $("#curPage").html(data.pageNum);//当前页
                    $("#totalPages").html(data.pages);//总页数
                    $("#totals").html(data.total);//总条数
                    $("#first").attr("data", 1);//首页
                    $("#prev").attr("data", data.prePage);//上一页
                    $("#next").attr("data", data.nextPage);//下一页
                    $("#last").attr("data", data.pages);//尾页
                    $("#txtCurPage").val(data.pageNum).attr("max", data.pages);
                });
            }
        });
    }

    //改变页面
    function changePage(obj) {
        var page = $(obj).attr("data");//取出data属性值
        queryTbGoods(page);
    }

    //跳转到指定页面
    function gotoPage(page) {
        var page = $("#txtCurPage").val();
        queryTbGoods(page);
    }

    /*查询商品类型  */
    function queryTbGoodsType() {
        $.ajax({
            url: "goods/queryTbGoodsType",
            type: "post",
            data: "",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    $(".sele").append("<option value='" + obj.typeId + "'>" + obj.typeName + "</option>");
                }
            }
        });
    }

    /* 添加修改之前清空form表单 */
    $(document).on("click", ".emptys", function () {
        $("#goodsId").val("");
        $("#goodsName").val("");
        $("#goodsDesc").val("");
        $("#goodsUnitPrice").val("");
        $("#sellCount").val("");
        $("#goodsDate").val("");
    });
    /*添加修改  */
    $(document).on("click", "#saveUploadOrUpdate", function () {
        /* alert($("#form1").serialize()); */
        $.ajax({
            url: "goods/saveOrUpdateTbgoods",
            type: "post",
            data: $("#form1").serialize(),
            dataType: "text",
            success: function (data) {
                alert(data);
                queryTbGoods();
            }
        });
    });
    /*修改前查询  */
    $(document).on("click", ".findById", function () {
        var id = this.id;

        $.ajax({
            url: "goods/findByIdTbGoods",
            type: "post",
            data: {"goodsId": id},
            dataType: "json",
            success: function (data) {
                $("#goodsId").val(data.goodsId);
                $("#goodsName").val(data.goodsName);
                $("#goodsDesc").val(data.goodsDesc);
                $("#goodsUnitPrice").val(data.goodsUnitPrice);
                $("#sellCount").val(data.sellCount);
                $("#goodsDate").val(data.goodsDate);
            }
        });
    });
    $(document).on("click", ".delete", function () {
        var id = this.id;
        if (confirm("您确定要删除此信息吗？")) {
            $.ajax({
                url: "goods/deleteGoods",
                type: "post",
                data: {"goodsId": id},
                dataType: "text",
                success: function (data) {
                    alert(data);
                    queryTbGoods();
                }
            });
        } else {
            return false;
        }
    });
</script>