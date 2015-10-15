<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,com.qg.model.HW" %>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	List<HW> list = null;
	String user = "";
	if(session.getAttribute("adminName") != null)
		user = session.getAttribute("adminName").toString();
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
  		 #bottom1{
			margin-left:40%;
			font-size:15px;
			height:20px;
			margin-top:15px;
			margin-bottom:30px;
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
                <td background="AdminStuff/img/title_bg1.jpg">当前位置: &gt;<a onclick=expand(2) href="javascript:void(0);">作业管理</a>&gt;<a href="NewWorkManage">新作业管理</a></td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=AdminStuff/img/shadow_bg.jpg></td>
            </tr>
    </table>  
    <div style="width:1000px;margin:auto;">      
      <div id="right">
      	<div>
		  <div id="tb_title">新作业管理</div>	   
		</div>	     	
      	<div id="downloadDiv">  	
      	  <table id="tb_manage" cellspacing=1 >
      	    <tr>
      	      <td colspan="4">已上传的作业：</td>
      	    </tr>
      	    <tr>
      	      <td style="width:5%;text-align:center;" bgcolor=#cccccc>序号</td>
      	      <td style="width:30%;text-align:center;" bgcolor=#cccccc>作业题目</td>
      	      <td style="width:15%;text-align:center;" bgcolor=#cccccc>上传人</td>
      	      <td style="width:20%;text-align:center;" bgcolor=#cccccc>发布时间</td>
      	      <td style="width:10%;text-align:center;" bgcolor=#cccccc>所属组</td>
      	      <td style="width:10%;text-align:center;" bgcolor=#cccccc>下载</td>
      	      <td style="width:10%;text-align:center;" bgcolor=#cccccc>删除</td>
      	    </tr>
      	  	  <%!int showPage;int maxPage; %>
			  <%
			   Integer spstr=(Integer)request.getAttribute("showPage");//获取当前所显示的页码 
			   Integer tpnstr=(Integer)request.getAttribute("totalPageNum");//获取总页数
			   //处理当前页码值  
			   if(spstr==null||"".equals(spstr)){
				   showPage=1;
			   }else
			   {
				  showPage=spstr.intValue();
			   }	
			   //处理总页码值
			   maxPage=tpnstr.intValue();
			  %>  
		  <%
			if(request.getAttribute("HWList") == null){%>
			<tr>
      	      <td style="width:60%;text-align:center;" bgcolor=#cccccc colspan="7">当前还没有布置作业</td>
      	    </tr>
		  <%}
			else
			{
				list = (List) request.getAttribute("HWList");
				for (Object hwlist : list) {
					HW hw = (HW) hwlist;
  			%>
  			<tr>
  		      <td align="center" bgcolor="#eeeeee"><%=hw.getHwID() %></td>
  			  <td align="center" bgcolor="#eeeeee"><%=hw.getHwTitle() %></td>
  			  <td align="center" bgcolor="#eeeeee"><%=hw.getHwAuthor() %></td>
  		      <td align="center" bgcolor="#eeeeee"><%=hw.getHwUptime() %></td>
  			  <td align="center" bgcolor="#eeeeee"><%=hw.getGroup() %></td>
  			  <td align="center" bgcolor="#eeeeee">
  			    <a href="DownLoadFile?url=<%=hw.getHwPath() %>">下载</a>
  			  </td>
			  <td align="center" bgcolor="#eeeeee">
  			    <a href="deleteNewWork?filename=<%=hw.getHwTitle() %>&&fileid=<%=hw.getHwID() %>&&groupid=<%=hw.getGroup() %>">删除</a>
  			  </td>  			  
  			</tr>		
			<%}}%> 
			<tr>
			<td colspan=3>
			</td>
			</tr>
      	  </table>
      	  <div id="bottom1">
		  <%if (showPage > 1){
		  %>
		  <a href="NewWorkManage?page=1">首页</a>
		  <a href="NewWorkManage?page=<%=spstr - 1%>">上一页</a>
		  <%
		  }else {
		  %>
		 	 首页 上一页
		  <%
		      }%>
		  <%if (showPage < maxPage){
		  %>  
		  <a href="NewWorkManage?page=<%=spstr + 1%>">下一页</a>
		  <a href="NewWorkManage?page=<%=tpnstr %>">尾页</a>
		  <%
		  }else {
		  %>
		  	下一页 尾页
		  <%
		  }%>   
		</div>     
      	</div> 
      	<div style="margin-top:30px;border-top:1px dotted red">	   	    	 
        <form action="UploadNewWork?user=<%=user %>" enctype="multipart/form-data" method="post">  
		  <table id="upNewTB">
          <tr>
          	<td>
          	 上传新的作业：
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