<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*" %>
<%@ page import="java.util.*" %>
<%
	List<Resource> reslist=(List<Resource>)request.getAttribute("list");
	List<GroupInfo> grouplist=(List<GroupInfo>)request.getAttribute("grouplist");
	System.out.println("testlist="+reslist.get(0).getInPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>资料管理</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>
<script type="text/javascript">
	function Testdelete(resId,respath){
		/* alert(testId);
		alert(testpath); */
		msg="是否删除？";
		if(window.confirm(msg)){
			window.location="DeleteResServlet?ResId="+resId+"&ResPath="+respath;
		}
	}
</script>
</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：资料管理->资料列表</span>
			<span style="float: right; margin-right: 8px; font-weight: bold;"> <a
				style="text-decoration: none;" href="AddRes.jsp">【上传资料】</a>
		</span>
		</span>
	</div>
	<div></div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>序号</td>
					<td>资料名称</td>
					<td>资料上传人</td>
					<td>上传日期</td>
					<td>小组名称</td>
					<td>上传路径</td>
					<td align="center">操作</td>
				</tr>
				<%if(reslist.equals("")||reslist==null){ %>
					<tr>
						<td colspan="5"><center>暂无数据！</center></td>
					</tr>
				<%} else{%>
				<%for(int i=0;i<reslist.size();i++){ %>		
						<tr>
							<td><%=reslist.get(i).getInfoId()%></td>
							<td><%=reslist.get(i).getInfoTitle()%></td>
							<td><%=reslist.get(i).getAdminName()%></td>
							<td><%=reslist.get(i).getInfoPubDate()%></td>						
							<td><%=grouplist.get(i).getGroupName()%></td>
							<td><%=reslist.get(i).getInPath()%></td>
							<td><a href="DownloadFileServlet?filename=<%=reslist.get(i).getInPath()%>">下载</a>
							<%if(session.getAttribute("adminName").equals(reslist.get(i).getAdminName())) {%>
								<a href="#" onclick="Testdelete('<%=reslist.get(i).getInfoId()%>','<%=reslist.get(i).getInPath() %>');">删除</a>
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