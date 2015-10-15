<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.BM,java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="AdminStuff/css/admin.css" type="text/css" rel="stylesheet" />
	<title>QG用户报名表管理</title>
	<style type="text/css">
		table.tb_info{
			width:95%;
			font-size:15px;			
			margin-left:2%;
		}
		td.liuyanTD{
			background-color:#DDE1E5;
			text-align:center;
		}
		#bottom1{
			margin-left:42%;
			font-size:15px;
			height:20px;
			margin-top:15px;
			margin-bottom:30px;
		}
		tr.CaptionTR{
			text-align:center;	
		}
		td.CaptionTD{
			background-color:#E3EFFB;
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
    <div id="total">
  	<div id="center">
		<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
            <tr height=28>
                <td background="AdminStuff/img/title_bg1.jpg">当前位置: &gt;<a onclick=expand(3) href="javascript:void(0);">报名管理</a>&gt;<a href="BMTableManage">报名表管理</a></td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=AdminStuff/img/shadow_bg.jpg></td>
            </tr>
        </table>  	
		  <table class="tb_info" cellspacing="1" cellpadding="1">
		      <tr>
		      	  <td colSpan="9" style="font-size:20px;font-familt:Arial;text-align:center">用户上传的报名表</td>
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
		      <%if (request.getAttribute("dataList") == null){
		      %>
		      <tr class="liuyanTR">
		          <td colspan="8">没有数据</td>
		      </tr>
		      <%
		      }else {
		          List list = (List) request.getAttribute("dataList");
		          for (Object bmtbList : list) {
		        	  BM bmtb = (BM) bmtbList;
		      %>
		      <tr class="CaptionTR">
				  <td class="CaptionTD">报名表ID</td>
		          <td class="CaptionTD">文件名</td>
		          <td class="CaptionTD">报名者</td>
		          <td class="CaptionTD">报名原因</td>
		          <td class="CaptionTD">意向组别</td>
		          <td class="CaptionTD">报名时间</td>
		          <td class="CaptionTD">审核状态</td>	
		          <td class="CaptionTD">下载</td>	
		          <td class="CaptionTD">通过审核</td>	      
		      </tr>
		      <tr class="liuyanTR">
		          <!--取得表中数据-->
		          <td class="liuyanTD"><%= bmtb.getFormId() %></td>
		          <td class="liuyanTD"><%= bmtb.getFormName() %></td>
		          <td class="liuyanTD"><%= bmtb.getRealname() %></td>
		          <td class="liuyanTD"><%= bmtb.getReason() %></td>
		          <td class="liuyanTD"><%= bmtb.getGroup() %></td>
		          <td class="liuyanTD"><%= bmtb.getForm_Date() %></td>
		          <%if(Integer.parseInt(bmtb.getForm_Status()) == 1){ %>
		          <td class="liuyanTD">已通过审核</td>
		          <%}else{ %>
		          <td class="liuyanTD">未通过审核</td>
		          <%} %>
		          <td class="liuyanTD">
		          	<a href="DownLoadFile?url=<%=bmtb.getForm_path() %>" style="text-decoration: underline">下载</a>
		          </td>
		          <td class="liuyanTD">
		          	<form method="post" action="LetBMPass?ID=<%=bmtb.getFormId() %>&&type=tb">
		          		<input type="submit" value="确认通过审核">
		          	</form>
		          </td>
		      </tr>
		      <tr class="liuyanTR">
		          <td colSpan="9" height="10px"></td>
		      </tr>
		      <%}} %>
		  </table>
		<div id="bottom1">
		  <%if (showPage > 1){
		  %>
		  <a href="GetLiuyan?role=admin&&page=1">首页</a>
		  <a href="GetLiuyan?role=admin&&page=<%=spstr - 1%>">上一页</a>
		  <%
		  }else {
		  %>
		 	 首页 上一页
		  <%
		      }%>
		  <%if (showPage < maxPage){
		  %>  
		  <a href="GetLiuyan?role=admin&&page=<%=spstr + 1%>">下一页</a>
		  <a href="GetLiuyan?role=admin&&page=<%=tpnstr %>">尾页</a>
		  <%
		  }else {
		  %>
		  	下一页 尾页
		  <%
		  }%>   
		</div>   
	</div>
	</div>
  </body>
</html>