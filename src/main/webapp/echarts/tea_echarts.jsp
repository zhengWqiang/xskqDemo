<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'echarts.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/jquery.min.js"></script> --%>
  </head>
  
  <body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
   <!--  <div id="main" style="width: 600px;height:400px;margin:0 auto"></div> -->
    <div id="main1" style="width: 600px;height:400px;margin:0 auto"></div>
    <table id="proTab" class="tablelist" border="1"></table>
    <div align="center"><input type="button" style="width:50;height:30;background:#00ff00" value="返回" onclick="back()"></div>
<script type="text/javascript">
    function back(){
    	history.go(-1);
    }
</script>
<script type="text/javascript">
	//柱状图
    /* $(document).ready(function() {
    $.ajax({
       type:"post",
       url: "${pageContext.request.contextPath }/teacher/json_histogram",//请求路径
       dataType:"json",//返回数据形式为json
       success:function(result){//从control返回来的值
       	   alert(result.number);
       	   alert(result.typename);
    		// 基于准备好的dom，初始化echarts实例
    	   var myChart = echarts.init(document.getElementById('main'));
           // 指定图表的配置项和数据
           var option = {
               title: {
                   text: '所教课程人数统计'
               },
               tooltip: {},
               legend: {
                   data:['人数']
               },
               xAxis: {
                   data: result.typename,
                   axisLabel: {
    					 interval:0,//横轴信息全部显示
     					 rotate: 60,//60度角倾斜显示
  						 formatter:function(val){
     					 	return val.split("").join("\n"); //横轴信息文字竖直显示
						 }
					}
               },
               yAxis: [{
               		name:'人数'
               }],
               series: [{
                   name: '人数',
                   type: 'bar',
                   data: result.number
               }]
           };
           // 使用刚指定的配置项和数据显示图表。
           myChart.setOption(option);
           myChart.on('click', function (params) {
           alert(params.name);
        	   $.ajax({
        	       type:"post",
        	       url: "${pageContext.request.contextPath }/teacher/json_query?course.coursename="+params.name,//请求路径
        	       dataType:"json",//返回数据形式为
        	       success:function(result){//从control返回来的值
        	       alert(params.name);
        	       alert(result);
        	    	   //调用显示表格数据的方法
        	    	   displayTable(result);
        	       }
        	   });
        	});
        },
		error:function(errorMsg){
        	alert("图表请求数据失败啦!");
        	myChart.hideLoading(); 
		}
       });
    }); */
    //饼图
    $(document).ready(function() {
    $.ajax({
       type:"post",
       url: "${pageContext.request.contextPath }/teacher/json_pie_chart",//请求路径
       dataType:"json",//返回数据形式为json
       success:function(result){//从control返回来的值
    		// 基于准备好的dom，初始化echarts实例
    	   var myChart = echarts.init(document.getElementById('main1'));
           // 指定图表的配置项和数据
           var option = {
        		    title : {
        		        text: '课程',
        		        subtext: '人数',
        		        x:'center'
        		    },
        		    tooltip : {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
        		    },
        		    legend: {
        		        orient: 'vertical',
        		        left: 'left',
        		        data: result.typename
        		    },
        		    series : [
        		        {
        		            name: '课程名称',
        		            type: 'pie',
        		            radius : '55%',
        		            center: ['50%', '60%'],
        		            data:result.number,
        		            itemStyle: {
        		                emphasis: {
        		                    shadowBlur: 10,
        		                    shadowOffsetX: 0,
        		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        		                }
        		            }
        		        }
        		    ]
        		};
           // 使用刚指定的配置项和数据显示图表。
           myChart.setOption(option);
           myChart.on('click', function (params) {
        	   //alert(params.name);
        	   $.ajax({
        	       type:"post",
        	       url: "${pageContext.request.contextPath }/teacher/json_query?course.coursename="+params.name,//请求路径
        	       dataType:"json",//返回数据形式为
        	       success:function(result){//从control返回来的值
        	    	   //调用显示表格数据的方法
        	    	   displayTable(result);
        	       }
        	   });
        	});
        },
		error:function(errorMsg){
        	alert("图表请求数据失败啦!");
        	myChart.hideLoading(); 
		}
       });
    });
    //显示表格
    function displayTable(v){
    	var proTab = document.getElementById("proTab"); 
   		//删除所有行
	   var trs = proTab.getElementsByTagName("tr");
	    for(var i = trs.length - 1; i >= 0; i--) {
	    	proTab.deleteRow(i);
	    }
			//为表格插入一行
			var hang1 =proTab.insertRow();       	    		
			hang1.setAttribute("align", "center");
			var cell1 = hang1.insertCell(0);
 		   		cell1.innerHTML ="工号";
 		    var cell2 = hang1.insertCell(1);
 			    cell2.innerHTML = "姓名";
 			var cell3 = hang1.insertCell(2);
 			    cell3.innerHTML = "性别";
 			var cell4 = hang1.insertCell(3);
 			    cell4.innerHTML = "年龄";
 			var cell5 = hang1.insertCell(4);
 			    cell5.innerHTML ="所教课程";
 			var cell6 = hang1.insertCell(5);
 			    cell6.innerHTML ="入学日期";
			//循环插入行
			for(var i =0;i<v.typename.length;i++){
               	var a = v.typename[i];
           		var hang =proTab.insertRow();
				hang.setAttribute("align", "center");
				var cell1 = hang.insertCell(0);
		   			cell1.innerHTML = a.number;
		    	var cell2 = hang.insertCell(1);
			    	cell2.innerHTML = a.name;
				var cell3 = hang.insertCell(2);
			    	cell3.innerHTML = a.sex;
				var cell4 = hang.insertCell(3);
			    	cell4.innerHTML = a.age;
				var cell5 = hang.insertCell(4);
			   		cell5.innerHTML =a.course.coursename;
				var cell6 = hang.insertCell(5);
			    	cell6.innerHTML =a.rdate;
   	        }
    }
</script>
  </body>
</html>
