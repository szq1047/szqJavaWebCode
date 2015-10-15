<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*" %>
<%@ page import="com.qg.BLL.*" %>
<%@ page import="java.util.*" %>
<%
	List<User> userlist=(List<User>)request.getAttribute("userlist");
	GroupInfo group=(GroupInfo)request.getAttribute("groupInfo");
	//System.out.println("testlist="+testlist.get(0).getTestPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户加入训练营管理</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>
</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：用户管理->用户加入训练营管理->用户加入训练营列表</span>
		</span>
	</div>
	<div></div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>姓名</td>
					<td>联系方式</td>
					<td>专业</td>
					<td>小组名称</td>
					<td align="center">操作</td>
				</tr>
				<%if(userlist.equals("")||userlist==null){ %>
					<tr>
						<td colspan="5"><center>暂无数据！</center></td>
					</tr>
				<%} else{%>
				<%for(int i=0;i<userlist.size();i++){ %>		
						<tr>
							<td><%=userlist.get(i).getRealName()%></td>
							<td><%=userlist.get(i).getTelNumber()%></td>
							<td><%=userlist.get(i).getMajor()%></td>
							<td><%=group.getGroupName()%></td>
							<td>
								<%if(userlist.get(i).getIsJoin().equals("0")){ %>
								<a href="UpdateIsJoinStatusServlet?regId=<%=userlist.get(i).getRegId()%>">允许加入训练营</a>
								<%}else{ %>
									<span>已经加入训练营</span>
								<%} %>
							</td>
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