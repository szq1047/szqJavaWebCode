<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,com.qg.model.*"%>
<%
	List<Notify> list=null;
	try{
		String userName=request.getSession().getAttribute("adminName").toString();
		list = (ArrayList<Notify>)request.getAttribute("notifyList");
	}catch(Exception e){
		response.sendRedirect("login.jsp");
		return;
	}	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>通知管理</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>
<script type="text/javascript">
	function Ntfdelete(ntfId){
		msg="是否删除？";
		if(window.confirm(msg)){
			window.location="DeleteNotifyServlet?NtfId="+ntfId;
		}
	}
</script>
</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：通知管理->通知列表</span> <span
			style="float: right; margin-right: 8px; font-weight: bold;"> <a
				style="text-decoration: none;" href="AddNotify.jsp">【发布通知】</a>
		</span>
		</span>
	</div>
	<div></div>
	<!--  <div class="div_search">
            <span>
                <form action="#" method="get">
                    品牌<select name="s_product_mark" style="width: 100px;">
                        <option selected="selected" value="0">请选择</option>
                        <option value="1">苹果apple</option>
                    </select>
                    <input value="查询" type="submit" />
                </form>
            </span>
        </div> -->
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tbody>
				<tr style="font-weight: bold;">
					<td>序号</td>
					<td>通知标题</td>
					<td>发布人</td>
					<td>发布时间</td>
					<td align="center">操作</td>
				</tr>
				<%if(list.equals(null)||list==null){ %>
					<tr>
						<td colspan="5"><center>暂无数据！</center></td>
					</tr>
				<%} else{%>
				<%for(int i=0;i<list.size();i++){ %>		
						<tr>
							<td><%=list.get(i).getNtfId()%></td>
							<td><%=list.get(i).getNtfTitle()%></td>
							<td><%=list.get(i).getNtfPublisher()%></td>
							<td><%=list.get(i).getNtfPubDate()%></td>
							<td><a href="ViewNotifyByIdServlet?NtfId=<%=list.get(i).getNtfId()%>">修改</a>
								<a href="#" onclick="Ntfdelete(<%=list.get(i).getNtfId()%>);">删除</a></td>
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