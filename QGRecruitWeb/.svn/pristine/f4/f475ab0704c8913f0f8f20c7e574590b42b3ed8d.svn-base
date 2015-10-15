<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*"%>
<%
	Notify notify = null;
	try{
		String userName=request.getSession().getAttribute("adminName").toString();
		notify = (Notify) request.getAttribute("notifyById");
	}catch(Exception e){
		response.sendRedirect("login.jsp");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新通知</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="./css/mine.css" type="text/css" rel="stylesheet">
<link href="./js/ueditor/themes/default/css/ueditor.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="./js/ueditor/third-party/jquery-1.10.2.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="./js/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body>
	<div class="div_head">
		<span> <span style="float: left">当前位置是：通知管理->更新通知</span> <span
			style="float: right; margin-right: 8px; font-weight: bold"> <a
				style="text-decoration: none" href="ViewAllNotifyServlet">【返回】</a>
		</span>
		</span>
	</div>
	<div>
	</div>
	<div style="font-size: 13px; margin: 10px 5px">
		<form action="UpdateNotifyServlet" method="post">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>编号</td>
					<td><input type="text" name="notifyId"
						value=<%=notify.getNtfId()%> readonly="readonly" /></td>
				</tr>
				<tr>
					<td>通知标题</td>
					<td><input type="text" name="notifyTitle"
						value=<%=notify.getNtfTitle()%> /></td>
				</tr>


				<tr>
					<td>通知内容</td>
					<td><script type="text/plain" id="myEditor" name="content"
							style="width:1000px;height:240px">
                       
						<%=notify.getNtfContent()%>
						</script> <script type="text/javascript">
							//实例化编辑器
							var um = UE.getEditor('myEditor');
						</script></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="更新"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>