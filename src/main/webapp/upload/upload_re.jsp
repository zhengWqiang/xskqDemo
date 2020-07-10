<%@ page contentType="text/html;charset=utf-8" language="java" import="com.jspsmart.upload.*"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.*"%>
<%
String path = request.getContextPath();
%>
<%
    System.out.println("上传进来了");
    String newFile1Name=null;
    String file_name=null;
    
	SmartUpload mySmartUpload = new SmartUpload();

	//初始化上传
	mySmartUpload.initialize(pageContext);

	//只允许上载此类文件
	try 
	{
		System.out.println("111111");
		System.out.println(pageContext);
		//mySmartUpload.setAllowedFilesList("jpg,Jpg,JPG,GIF,gif,Gif,png");
		mySmartUpload.upload();
	} 
	catch (Exception e)
    {
    	System.out.println("22222222222");
		//out.println("<script language=javascript>alert('上传格式错误！');   history.back(-1);</script>");
		//return;
	}
	
	try 
	{	
		   System.out.println("3333333333");
		   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		   if (myFile.isMissing())
		   {
		   		System.out.println("444444444444");
			  out.println("<script language=javascript>alert('必须选择附件！');   history.back(-1);</script>");
			  return;

		   } 
		   else 
		   {	
		   		System.out.println("55555555555");
			   int file_size = myFile.getSize(); //取得文件的大小 (单位是b) 
			   file_name=myFile.getFileName();
			   System.out.println("文件大小："+file_size+"文件名称："+file_name);
			   if (file_size > 1*1024*1024)
			   {
				  out.println("<script language=javascript>alert('上传文件大小应控制在10K~1M之间！');   history.back(-1);</script>");
				 return;
			  }
               else
               {
               		System.out.println("666666666");
                   newFile1Name=new Date().getTime()+file_name.substring(file_name.indexOf("."));
	               System.out.println("新文件名称："+newFile1Name);
				
				   String saveurl = request.getSession().getServletContext().getRealPath("upload");
				
				   saveurl = saveurl+"/"+newFile1Name;
				   myFile.saveAs(saveurl, mySmartUpload.SAVE_PHYSICAL);
	
               }
			} 
	  } 
	  catch (Exception e)
	  {
	    e.toString();
	  }
%>

<script language="javascript">
	alert("进来了");
    document.write("上传成功");
	window.parent.document.getElementById("fujian").value="/upload/<%= newFile1Name%>";
	window.parent.document.getElementById("fujianyuanshiming").value="<%= file_name%>";
</script>
