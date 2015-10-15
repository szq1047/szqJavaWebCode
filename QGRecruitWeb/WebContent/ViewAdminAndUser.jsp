<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.qg.model.*"%>
<%@ page import="com.qg.BLL.*"%>
<%@ page import="java.util.*"%>
<%
	List<Admin> adminlist = (List<Admin>) request
			.getAttribute("adminlist");
	List<User> userlist = (List<User>) request.getAttribute("userlist");
	//System.out.println("学员姓名：" + userlist.get(0).getRealName());
	/* List<GroupInfo> grouplist=(List<GroupInfo>)request.getAttribute("grouplist");
	UserLoginBll userbll=new UserLoginBll(); */
	//System.out.println("testlist="+testlist.get(0).getTestPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学员导师分配管理</title>
<link href="./css/mine.css" type="text/css" rel="stylesheet" />
<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>
</head>
<body>

	<div class="div_head">
		<span> <span style="float: left;">当前位置是：用户管理->学员导师分配管理</span>
		</span>
	</div>
	<div></div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<form method="post" action="AddAdminAndUserServlet">
			<table class="table_a" border="1" width="100%">
				<tbody>
					<tr style="font-weight: bold;">
						<td>导师</td>
						<td>学员姓名</td>
					</tr>
					<tr>
						<td width="25%"><select name="adminInfo" style="width: 150px">
								<%
									for (int i = 0; i < adminlist.size(); i++) {
								%>
								<option value="<%=adminlist.get(i).getAdminId()%>"><%=adminlist.get(i).getAdminName()%></option>
								<%
									}
								%>
						</select></td>
						<td width="70%">
							<%
								for (int i = 0; i < userlist.size(); i++) {
							%> <input type="checkbox"
							name="userInfo" value=<%=userlist.get(i).getRegId()%>><%=userlist.get(i).getRealName()%></input>
							<%
								}
							%>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="提交" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>