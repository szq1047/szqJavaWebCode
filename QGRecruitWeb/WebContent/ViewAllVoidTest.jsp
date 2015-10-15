<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*" %>
<%@ page import="java.util.*" %>
<%
	List<TestInfo> testlist=(List<TestInfo>)request.getAttribute("list");
	List<TestTypeInfo> testtypelist=(List<TestTypeInfo>)request.getAttribute("testTypelist");
	List<GroupInfo> grouplist=(List<GroupInfo>)request.getAttribute("grouplist");
	//System.out.println("testlist="+testlist);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>试题管理</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>
<script type="text/javascript">
	function Testdelete(testId,testpath){
		/* alert(testId);
		alert(testpath); */
		msg="是否删除？";
		if(window.confirm(msg)){
			window.location="DeleteTestServlet?TestId="+testId+"&TestPath="+testpath+"&action=voidtest";
		}
	}
</script>
</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：试题管理->试题列表</span> <span
			style="float: right; margin-right: 8px; font-weight: bold;"> <a
				style="text-decoration: none;" href="AddTest.jsp">【上传试题】</a>
		</span>
		</span>
	</div>
	<div></div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>序号</td>
					<td>试题名称</td>
					<td>试题上传者</td>
					<td>上传日期</td>
					<td>上传路径</td>
					<td>小组名称</td>
					<td align="center">操作</td>
				</tr>
				<%if(testlist.equals("")||testlist==null||testlist.size()==0){ %>
					<tr>
						<td colspan="7"><center>暂无数据！</center></td>
					</tr>
				<%} else{%>
				<%for(int i=0;i<testlist.size();i++){ %>		
						<tr>
							<td><%=testlist.get(i).getTestId()%></td>
							<td><%=testtypelist.get(i).getTestTypeName()%></td>
							<td><%=testlist.get(i).getTestPublisher()%></td>
							<td><%=testlist.get(i).getTestPubDate()%></td>
							<td><%=testlist.get(i).getTestPath() %></td>
							<td><%=grouplist.get(i).getGroupName()%></td>
							<td><!-- <a href="DownloadFileServlet?filename=<%=testlist.get(i).getTestPath()%>">下载</a> -->
								<a href="#" onclick="Testdelete('<%=testlist.get(i).getTestId()%>','<%=testlist.get(i).getTestPath() %>');">删除</a></td>
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