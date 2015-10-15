<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>

<HEAD>
<TITLE>用户登录</TITLE>
<LINK href="css/User_Login.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.6000.16674" name="GENERATOR">
</HEAD>
<BODY id="userlogin_body">
	<form method="post" action="LoginServlet">
		<DIV id="user_login">
			<DL>
				<DD id="user_top">
					<UL>
						<LI class="user_top_l"></LI>
						<LI class="user_top_c"></LI>
						<LI class="user_top_r"></LI>
					</UL>
				<DD id="user_main">
					<UL>
						<LI class="user_main_l"></LI>
						<LI class="user_main_c">
							<DIV class="user_main_box">
								<UL>
									<LI class="user_main_text">用户名：</LI>
									<LI class="user_main_input"><INPUT
										class="TxtUserNameCssClass" id="TxtUserName" maxLength=20
										name="TxtUserName"></LI>
								</UL>
								<UL>
									<LI class="user_main_text">密 码：</LI>
									<LI class="user_main_input"><INPUT
										class="TxtPasswordCssClass" id="TxtPassword" type="password"
										name="TxtPassword"></LI>
								</UL>
								<UL>
									<LI class="user_main_text">登陆身份：</LI>
									<LI class="user_main_input">
									  管理员<input type="radio" name="DropExpiration" value="admin" checked="Checked">
									  普通用户<input type="radio" name="DropExpiration" value="user">
									</LI>									
								</UL>
<!-- 								<a href="Register.jsp" class="user_main_text" style="margin-left:60px"><font color="red">注册</font></a><br/> -->
								<center><font color="red">
									<%
										if(request.getAttribute("message")!=null){
									%>
									${requestScope.message}
									
									<%} %>
								</font></center>
							</DIV>
						</LI>
						<LI class="user_main_r"><INPUT class="IbtnEnterCssClass"
							id="IbtnEnter"
							style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
							onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("IbtnEnter", "", true, "", "", false, false))'
							type="image" src="images/user_botton.gif" name="IbtnEnter"></LI>
					</UL>
				<DD id="user_bottom">
					<UL>
						<LI class="user_bottom_l"></LI>
						<LI class="user_bottom_c"></LI>
						<LI class="user_bottom_r"></LI>
					</UL>
				</DD>
			</DL>
		</DIV>
		<SPAN id="ValrUserName" style="DISPLAY: none; COLOR: red"></SPAN> <SPAN
			id="ValrPassword" style="DISPLAY: none; COLOR: red"></SPAN> <SPAN
			id="ValrValidateCode" style="DISPLAY: none; COLOR: red"></SPAN>
		<DIV id="ValidationSummary1" style="DISPLAY: none; COLOR: red"></DIV>
	</FORM>
</BODY>
</HTML>
