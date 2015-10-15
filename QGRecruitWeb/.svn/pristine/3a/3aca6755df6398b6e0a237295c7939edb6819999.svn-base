<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.ZXBMInfo,java.sql.*,java.util.*,com.qg.BLL.BMBLL" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="AdminStuff/css/admin.css" type="text/css" rel="stylesheet" />
	<title>QG用户在线报名信息管理</title>
	<style type="text/css">
		table.tb_info{
			width:90%;
			font-size:15px;
			cellspacing:0;
			margin-left:5%;
		}
		td.liuyanTD{
			background-color:#E3EFFB;
		}
		#bottom1{
			margin-left:40%;
			font-size:15px;
			height:20px;
			margin-top:15px;
			margin-bottom:30px;
		}
		td.contentTD{
			height:100px;
			background-color:#DDE1E5;
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
                <td background="AdminStuff/img/title_bg1.jpg">当前位置: &gt;<a onclick=expand(3) href="javascript:void(0);">报名管理</a>&gt;<a href="ZXBMManage">在线报名管理</a></td></tr>
            <tr>
                <td bgcolor=#b1ceef height=1></td></tr>
            <tr height=20>
                <td background=AdminStuff/img/shadow_bg.jpg></td>
            </tr>
        </table>  	
		  <table class="tb_info" cellspacing="1" cellpadding="1">
		      <tr>
		      	  <td colSpan="5" style="font-size:20px;font-familt:Arial;text-align:center">用户在线报名信息</td>
		      </tr>
		      <%!int showPage;int maxPage; %>
			  <%
			   BMBLL bll = new BMBLL();
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
		          for (Object zxbmList : list) {
		        	  ZXBMInfo zxbm = (ZXBMInfo) zxbmList;
		      %>
		      <tr class="liuyanTR">
		          <!--取得表中数据-->
		          <td class="liuyanTD">报名表ID：<%= zxbm.getForm_id() %></td>
		          <td class="liuyanTD">姓名：<%= zxbm.getReal_name() %></td>
		          <td class="liuyanTD">学号：<%= zxbm.getStu_id() %></td>
		          <%if(zxbm.getReg_gender().equals("M")) {%>
		          <td class="liuyanTD">性别：男</td>
		          <%}else{ %>
		          <td class="liuyanTD">性别：女</td><%} %>
		      </tr>
		      <tr class="liuyanTR">
		          <td class="liuyanTD">生日：<%= zxbm.getBirth() %></td>
		          <td class="liuyanTD">电话：<%= zxbm.getTel() %></td>
		          <td class="liuyanTD">qq号：<%= zxbm.getQq() %></td>
		          <td class="liuyanTD">e-mail：<%= zxbm.getEmail() %></td>
		      </tr>
		      <tr class="liuyanTR">
		          <td class="liuyanTD">学院：<%= zxbm.getCollege() %></td>
		          <td class="liuyanTD">专业：<%= zxbm.getMajor() %></td>
		          <td class="liuyanTD">班级：<%= zxbm.get_class() %></td>
		          <td class="liuyanTD">系统用户名：<%= zxbm.getReg_name() %></td>
		      </tr>
		      <tr class="liuyanTR">	
		      	  <%if(bll.getFormStatus(zxbm.getForm_id()) == 0) {%>
		     	  <td class="contentTD" style="text-align:center">审核状态：未审核<br>
		     	  	意向组别：<%=zxbm.getGroup() %></td>  
		     	  <%}else{ %>
		     	  <td class="contentTD" style="text-align:center">审核状态：已通过审核<br>
		     	  	意向组别：<%=zxbm.getGroup() %></td> 
		     	  <%} %>
		          <td colSpan="2" class="contentTD">报名原因：<%= zxbm.getReason() %></td>
		          <td class="contentTD" style="text-align:center">
		          	  <form method="post" action="LetBMPass?ID=<%=zxbm.getForm_id() %>&&type=zxbm">
		          		<input type="submit" value="确认通过审核">
		          	  </form>
		          </td>    
		      </tr>
		      <tr class="liuyanTR">
		          <td colSpan="5" height="10px"></td>
		      </tr>
		      <%
		              }
		      }
		      %>
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