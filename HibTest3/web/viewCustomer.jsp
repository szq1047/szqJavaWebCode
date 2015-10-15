<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="com.hibtest3.entity.CustomerInfo" %>
<%
	List<CustomerInfo> cusInfoList=(List<CustomerInfo>)request.getAttribute("customerList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>客户信息表</title>
<link rel="stylesheet" type="text/css" href="CSS/myCss.css" />
<style type="text/css">
	.style1{margin-top:0px;;padding:0px;}
	.style2 td{
	width:150px;
	text-align:center;
	border-style: solid;border-width:1px;border-color: gray;
	}
</style>

</head>
<body>
<div class="main">
	<table >
		<tr>
			<table class="style2">
				<tr><td>客户编号</td><td>客户姓名</td><td>客户性别</td><td>身份证号</td><td>操作</td></tr>
				<%if(cusInfoList.equals("")|| cusInfoList==null){%>
				<tr align="center"><td colspan="6">暂无数据</td></tr>
				<%}else{
					for(int i=0;i<cusInfoList.size();i++){
						CustomerInfo cus=cusInfoList.get(i);
				%>
				<tr align="center">
					<td><%=cus.getCno()%></td>
					<td><%=cus.getCname()%></td>
					<td>
						<%
							if(cus.getCsex().equals('M')){
						%>
						男
						<%}else{%>
						女
						<%}%>
					</td>
					<td><%=cus.getCid()%></td>
					<td><a href="HibTest3/customer/getCustomerByCno?Cno=<%=cus.getCno()%>">登记入住</a>  </td>
				</tr>
				<%
					}

				}%>

			</table>
		</tr>		
	</table>
</div>
</body>
</html>