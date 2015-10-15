<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*" %>
<%@ page import="com.qg.BLL.*" %>
<%@ page import="java.util.*" %>
<%
	List<AdminAndUser> aduserlist=(List<AdminAndUser>)request.getAttribute("list");
	GroupInfo group=(GroupInfo)request.getAttribute("groupInfo");
	//System.out.println("testlist="+testlist.get(0).getTestPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学员导师分配表</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>

</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：学员导师分配管理->学员导师分配列表</span>
		</span>
	</div>
	<div></div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>学员</td>
					<td>导师</td>
					<td>小组名称</td>
				</tr>
				<%if(aduserlist.equals("")||aduserlist==null){ %>
					<tr>
						<td colspan="5"><center>暂无数据！</center></td>
					</tr>
				<%} else{%>
				<%for(int i=0;i<aduserlist.size();i++){ %>		
						<tr>
							<td><%=aduserlist.get(i).getUserName()%></td>
							<td><%=aduserlist.get(i).getAdminName()%></td>
							<td><%=group.getGroupName()%></td>							
						</tr>
					<%} %>
				<%} %>
				<tr>
					<td colspan="20" style="text-align: center;">[1]</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>