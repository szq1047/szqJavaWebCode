<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,com.qg.model.NewBMTable" %>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	List<NewBMTable> list = null;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<link href="AdminStuff/css/admin.css" type="text/css" rel="stylesheet" />
  	<base href="<%=basePath%>"/>  
    <style type="text/css">
  		 #tb_title
  		 {
    		 background-color:#FFE3D7;
  			 font-size:20px;
  			 color:black;
  			 width:100%;
  			 height:20px;
  			 text-align:center;			
  		 }  
  		 #upNewTB{
  		 	width:600px;
  		 	margin:auto;
  		 	margin-top:20px;
  		 	font-size:15px;
  		 }  
  		 #downloadDiv{
  		 	width:100%;
  		 }
  		 #right{
  		 	height:500px;
  		 	border:1px solid gray;
  		 	width:100%;
  		 }
  		 #tb_manage{
  		 	width:80%;
  		 	margin:auto;
  		 	font-size:15px;
  		 }
    </style>
 	<script language=javascript>
        function expand(el)
        {
            childobj = document.getElementById("child" + el);
            if (childobj.style.display == 'none')
            {
                childobj.style.display = 'block';
            }
            else
            {
                childobj.style.display = 'none';
            }
            return;
        }
    </script>    
  </head>
  
 <body style="border-left:1px solid gray;margin-top:0px;margin-left:1px;">
 	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background="AdminStuff/img/title_bg1.jpg">当前位置: &gt;<a onclick=expand(2) href="javascript:void(0);">报名管理</a>&gt;<a href="NewBMTableManage">空报名表管理</a></td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=AdminStuff/img/shadow_bg.jpg></td>
            </tr>
    </table>  
    <div style="width:1000px;margin:auto;">      
      <div id="right">
      	<div>
		  <div id="tb_title">空报名表管理</div>	   
		</div>	     	
      	<div id="downloadDiv">  	
      	  <table id="tb_manage" cellspacing=1 >
      	    <tr>
      	      <td colspan="4">已上传的报名表：</td>
      	    </tr>
      	    <tr>
      	      <td style="width:50%;text-align:center;" bgcolor=#cccccc>文件名</td>
      	      <td style="width:20%;text-align:center;" bgcolor=#cccccc>上传时间</td>
      	      <td style="width:10%;text-align:center;" bgcolor=#cccccc>下载</td>
      	      <td style="width:10%;text-align:center;" bgcolor=#cccccc>删除</td>
      	    </tr>
		  <%
			if(request.getAttribute("NewBMTableList") == null){%>
			<tr>
      	      <td style="width:60%;text-align:center;" bgcolor=#cccccc colspan="5">当前还没有已经上传的报名表</td>
      	    </tr>
		  <%}
			else
			{
				list = (List) request.getAttribute("NewBMTableList");
				for (Object tblist : list) {
					NewBMTable bmtblist = (NewBMTable) tblist;
  			%>
  			<tr>
  		      <td align="center" bgcolor="#eeeeee"><%=bmtblist.getTb_filename() %></td>
  			  <td align="center" bgcolor="#eeeeee"><%=bmtblist.getUptime() %></td>
  			  <td align="center" bgcolor="#eeeeee">
  			    <a href="DownLoadFile?url=<%=bmtblist.getTb_url() %>">下载</a>
  			  </td>
			  <td align="center" bgcolor="#eeeeee">
  			    <a href="deleteBMTable?filename=<%=bmtblist.getTb_filename() %>&&tbid=<%=bmtblist.getTb_ID() %>">删除</a>
  			  </td>  			  
  			</tr>		
			<%}}%> 
			<tr>
			<td colspan=3>
			</td>
			</tr>
      	  </table>
      	</div> 
      	<div style="margin-top:30px;border-top:1px dotted red">	   	    	 
        <form action="UploadNewBMTable" enctype="multipart/form-data" method="post">  
		  <table id="upNewTB">
          <tr>
          	<td>
          	 上传新的空报名表：
          	</td>
          </tr>
          <tr>
         	<td>
         	  <div style="width:70%;">
         	  	<input name="file" type="file" style="width:100%;border:1px solid gray" />
         	  </div>
         	  <div style="width:15%;margin-left:75%;margin-top:-25px;">
         	  	<input type="submit" value="上传 " />
         	  </div>
         	  <div style="width:15%;height:20px;margin-left:88%;margin-top:-25px">
         	  	<input type="reset" value="重置" />
         	  </div>
         	</td>       	        
          </tr> 
		  </table>	
		</form>	
		</div> 
	  </div>  	  
    </div>
  </body>
</html>