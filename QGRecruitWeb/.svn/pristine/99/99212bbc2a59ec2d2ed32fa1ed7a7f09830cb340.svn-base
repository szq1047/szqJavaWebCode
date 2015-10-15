<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.qg.BLL.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.qg.model.*" %>

<%
	try {
		String userName = request.getSession()
				.getAttribute("adminName").toString();
	} catch (Exception e) {
		response.sendRedirect("login.jsp");
		return;
	}
	TestTypeInfoBll bll=new TestTypeInfoBll();
	List<TestTypeInfo> list=bll.getAllTestTypeInfo();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>上传试题</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="./css/mine.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery-2.0.3.js"></script>
        <script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript">
	function checkFile() {
		var file = document.getElementById("filePath").value;
		//alert(file);
		if (file == null || file == "") {
			alert("你没有选择任何文件，不能上传！");
			return;
		}
		if (file.lastIndexOf(".") == -1) {
			alert("路径不正确");
			return;
		}
		var allFileExt = ".doc|.docx|.pdf";
		var extName = file.substring(file.lastIndexOf("."));
		if (allFileExt.indexOf(extName + "|") == -1) {
			errMsg = "该文件类型不允许上传。请上传" + allFileExt + " 类型的文件，当前文件类型为" + extName;
			alert(errMsg);
			return;
		}
		//var url = "UploadServlet";
		$.ajaxFileUpload({
			url:"UploadServlet",
			secureuri:false,
			fileElementId:'filePath',
			dataType:'text/xml',
			success:function(data){
				alert("上传成功");
				//alert(data);
				document.getElementById("filepath1").value=data;
			},
			error:function(data,status,e){
				alert("上传失败");
			}
		});
	}
</script>
</head>

    <body>
        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：试题管理->上传试题</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="ViewAllTestServlet">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="AddTestServlet" method="post">
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>试题类型</td>
                    <td>
                    	<select name="testTypeID">
                    	<%for(int i=0;i<list.size();i++){%>
                    		<option value="<%=list.get(i).getTestTypeId() %>"><%=list.get(i).getTestTypeName() %></option>
                    	<%} %>
                    	</select>
                    </td>
                </tr>
               
                <tr>
                    <td>请选择上传的试题</td>
                    <td> 
                    	<input type="file" id="filePath" name="fileName"/><input type="button" onclick="checkFile()" value="上传"/>
                    	<input type="text"  id="filepath1" name="filepath1" style="display: none"/>
                    </td>
                </tr>
                
                <tr >
                    <td colspan="2">
                        <input type="submit" value="添加">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>