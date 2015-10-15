<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.*,java.util.*,java.text.*,com.qg.BLL.*"%>
<%@ page import="java.sql.*" %>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<%!String formatString(Object text) {
		if (text == null) {
			return "";
		}
		return text.toString();
	}
%>
<%
	boolean isPassBM=false;
	boolean isJoin=false;	
	String bmPass=formatString(session.getAttribute("bmPass"));
	String isEntryCamp=formatString(session.getAttribute("isJoin"));
	 if(bmPass.equals("1")){
		isPassBM=true;
	}
	if(isEntryCamp.equals("1")){
		isJoin=true;
	} 
%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
	<title>在线报名</title>
	<base href="<%=basePath%>"/>
	<meta name="Keywords" content="QG工作室招系统" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="e/templates/150716/style.css" type="text/css" rel="stylesheet" />
	<script src="e/js/jquery.min.js" type="text/javascript"></script>
	<script src="e/js/function.js" type="text/javascript"></script>
	<script src="e/js/comm.js" type="text/javascript"></script>
	<script src="e/js/zh-cn/lang.js" type="text/javascript">
	</script><script src="e/js/script.js" type="text/javascript"></script>
	<style type="text/css">
		div.tit1 {
			border-bottom:1px solid gray;
		}
		div.xmzs{
			width:700px;
			margin-top:-272px;
			height:430px;
			margin-left:290px;
		}
		table.tb_BM{
			width:100%;
			border:1px solid gray;
			font-size:12px;
			height:400px;
		}
		td.BM_TD{
			text-align:left;
			background-color: #f7f7f7;
			width:auto;
		}
		td.BM_TD1{
			text-align:right;
			background-color: #f7f7f7;
		}
		div.current{
			clear:both;
			text-align:left;
			height:35px;
			background:url(e/images/ny_top_bg.jpg) no-repeat bottom left;
			z-index:100;
			top:0px;
			left:0px;
			width:980px;
		}
	</style>
	<script type="text/javascript">
		function IsOk(){
 			var group = document.getElementById("groupID").value;
 			var reason = document.getElementById("reason").value;			
 			if(group == 0){
 				alert("请选择组别！");
 			}else if(reason == ""){
 				alert("请输入报名原因！");
 			}else
 				document.getElementById("bm").submit();
		}
		function ExitSystem(){
			var msg="确定要退出吗？";
			if (window.confirm(msg)){
				window.location = "ExitFrontSystemServlet";//跳出框架,清除session
				//window.href="index.jsp";
			}
		}
	</script>
  </head>
  <body>
	<div class="page_style lanmupage page_l61">
	<div class="top_box">
	  <div class="top_box_inner">
	   <div class="topcontent">
	     <div class="weibo">
			<%if (session.getAttribute("userName") == null){%>
			<a href="login.jsp" >登录</a>
			<a href="register.jsp">注册</a>
			<%} else {%>
			用户名：<a href=""><%=session.getAttribute("userName").toString()%></a>
			<a href="javascript:void(0)" onclick="ExitSystem()" style="margin-left:10px;">退出</a>
			<%}%>
	     </div>
	   </div>
	   <div class="clear"></div>
	   <div class="logo">
	   	 <a href=""><img src="e/images/QG logo.jpg" width="102" height="97" border="0" /></a>
	   </div>
		<div class="menu_box" id="Menu">
			<ul>
				<li class="menu_style_homepage menu_current" id="MenuItem61"
					name="MenuItem"><a href="index.jsp" class="menu">首页</a></li>
				<li class="menu_style" id="MenuItem62" name="MenuItem"><a
					href="indexStuff/introduce.jsp" class="menu">QG简介</a></li>
				<%if((String)session.getAttribute("userName")!=null && isPassBM){ %>
				<li class="menu_style" id="MenuItem63" name="MenuItem"><a
					href="ViewtestFrontServlet" class="menu">QG试题下载</a></li>
				<%} %>
				<li class="menu_style" id="MenuItem64" name="MenuItem"><a
					href="GetLiuyan" class="menu">QG留言栏</a></li>
				<%if((String)session.getAttribute("userName")!=null && isJoin){ %>
				<li class="menu_style" id="MenuItem68" name="MenuItem"><a
					href="ViewQGTrainingResFront.jsp" class="menu">QG训练营</a></li>
				<%} %>
				<li class="menu_style" id="MenuItem65" name="MenuItem"><a
					href="indexStuff/contact.jsp" class="menu">联系我们</a></li>
			</ul>
		</div>
	  </div>
	</div>
	<script type="text/javascript">var IsPageHome="1";var Lanmu_Id="61";var Sublanmu_Id="0";ShowSubMenu(Lanmu_Id);</script>
	<div class="banner">
	  <div style="background:url(e/images/banner/tt33.jpg) no-repeat center top;height:355px;">
		<div style="width:980px;margin:0 auto;">
			<div style="padding:100px 0px 0 100px;">
				<div style="font-size:30px;fint-weight:bold;color:white;">
			      <p>QG<span style="font-size:26px;margin-left:20px;">展望未来</span></p>
			      <p>WE TOGETHER</p>
			    </div>
				<div style="font-size:24px;fint-weight:bold;color:white;"></div>
				<div style="font-size:14px;fint-weight:bold;color:white;">
					跨越自我，不同的梦想，一样的执着与追求	
				</div>
			</div>
		</div>
	  </div>
	</div>
	<div class="main_box main_box_style" style="width:1000px;">
		<div class="main_box_inner" style="width:250px;">
		  <div class="current">
			<ul>
				<li class="current_location_1">当前位置：<a href="index.jsp">首页</a> &gt;<a href="BMindex.jsp">QG报名</a>&gt;<a href="ZXBM">在线报名</a></li>
				<li class="current_location_2">在线报名</li>
			</ul>
		  </div>	
		  <div class="ab_us" style="height:270px;">
			<div class="tit" style="height:66px">
				<img src="images/BMXZ.png" width="260"/>
			</div>		
			<div class="con">
				<div class="wp-title_content" style="word-wrap:break-word;padding:0px;border-color:#CCCCCC;border-width:0px;height:132px;width:259px;display:block;border-style:solid;text-align:left;">
					<div align="center">
						<img src="e/images/home/ab_us7.gif" width="242" height="34" />
					</div>
		            <span style="line-height:180%;" id="LoadContact">QG工作室是在2005年11月5日，为了更好的让学生投入到计算机专业实践，而创立工作室。本团队目前有指导老师三位，分别是曾碧教授，谢光强老师，李扬老师。QG工作室目前拥有三个涵盖了目前社会上最炙手可热的三大专业方向，其分别是：智能与嵌入式方向、智能与图形处理方向、计算机网络与分布式信息系统方向</span>
		        </div>
		        <a style="color:#cc0000;" href="about/"></a>
		    </div>
		   </div>
		</div>
		<div class="xmzs">
			<div class="tit1">
		      <img src="images/BM.gif" width="143" height="30" />
		    </div>
		    <form action="addBMInfo" method="post" id="bm">
		      	<table class="tb_BM">
		      		<tr>
		      			<td colspan="6" bgcolor="#f7f7f7" style="font-size:20px;text-align:center">在线报名表 </td>
		      		</tr>
		      		<%if(request.getAttribute("user") != null){
		      			ResultSet user = (ResultSet)request.getAttribute("user");
		      		%>
		      		<tr class="BM_TR">
		      			<td class="BM_TD1">姓名：</td>
		      			<td class="BM_TD"><input type="text" name="name" readOnly="readonly" value="<%=user.getString("real_Name") %>"></td>
		      			<td class="BM_TD1">学号：</td>
		      			<td class="BM_TD"><input type="text" name="stuid" readOnly="readonly" value="<%=user.getString("stu_ID") %>"></td>
		      			<td class="BM_TD1">性别：</td>
		      			<%if(user.getString("reg_Gender").equals("M")) {%>
		      			<td class="BM_TD"><input type="text" name="gender" readOnly="readonly" value="男"></td>
		      			<%}else{ %>
		      			<td class="BM_TD"><input type="text" name="gender" readOnly="readonly" value="女"></td>
		      			<%} %>
		      		</tr>
					<tr class="BM_TR">
		      			<td class="BM_TD1">学院：</td>
		      			<td class="BM_TD"><input type="text" name="college" readOnly="readonly" value="<%=user.getString("college") %>"></td>
		      			<td class="BM_TD1">专业：</td>
		      			<td class="BM_TD"><input type="text" name="major" readOnly="readonly" value="<%=user.getString("major") %>"></td>
		      			<td class="BM_TD1">班级：</td>
		      			<td class="BM_TD">
		      				<%if(user.getString("class")==null){%>
		      				<input type="text" name="major" readOnly="readonly" value="无">
		      				<%}else{ %>
		      				<input type="text" name="major" readOnly="readonly" value="<%=user.getString("class") %>"><%} %>
		      			</td>
		      		</tr>
		      		<tr class="BM_TR">
		      			<td class="BM_TD1">手机：</td>
		      			<td class="BM_TD"><input type="text" name="tel" readOnly="readonly" value="<%=user.getString("tel_Number") %>"></td>
		      			<td class="BM_TD1">QQ：</td>
		      			<td class="BM_TD"><input type="text" name="qq" readOnly="readonly" value="<%=user.getString("qq") %>"></td>
		      			<td class="BM_TD1">E-Mail：</td>
		      			<td class="BM_TD"><input type="text" name="e-mail" readOnly="readonly" value="<%=user.getString("e_Mail") %>"></td>
		      		</tr>
					<tr class="BM_TR">
		      			<td class="BM_TD1">注册ID：</td>
		      			<td class="BM_TD"><input type="text" name="reg_id" readOnly="readonly" value="<%=user.getString("reg_ID") %>"></td>
		      			<td class="BM_TD1">注册名：</td>
		      			<td class="BM_TD"><input type="text" name="reg_name" readOnly="readonly" value="<%=user.getString("reg_Name") %>"></td>
		      			<td class="BM_TD1">生日：</td>
		      			<td class="BM_TD"><input type="text" name="birthday" readOnly="readonly" value="<%=user.getDate("reg_BomDate") %>"></td>
		      		</tr>	
					<tr class="BM_TR">
		      			<td class="BM_TD1">意向组别：</td>
		      			<td class="BM_TD" colSpan="5">
		      			<select name="groupID" id="groupID">
		      					<option value="0" selected="selected">--请选择--</option>
		      					<option value="1">网络组</option>
		      					<option value="2">嵌入式组</option>
		      					<option value="3">手游组</option>
		      					<option value="4">美工组</option>
		      					<option value="5">移动组</option>
		      			</select>
		      			</td>
		      		</tr>				      			      		
		      		<tr class="BM_TR">
		      			<td class="BM_TD1" >报名原因：</td>
		      			<td colSpan="5" class="BM_TD">
		      				<textarea id="reason" rows="10" cols="90" style="resize:none;" name="reason"></textarea>
		      			</td>
		      		</tr>	
		      		<tr class="BM_TR">
		      			<td colSpan="3" class="BM_TD1" valign="top">
		      				<input type="button" value="确认报名" onClick="IsOk()">
		      			</td>
		      			<td colSpan="3" class="BM_TD" style="text-align:center" valign="top">
		      				<input type="reset" value="重置信息">
		      			</td>
		      		</tr>	      			      		
		      	</table>
		      	<%}%>
		    </form>
		</div>
 	</div>
    <div class="clear main_box_inner_bottom"></div>
    </div>
	<div class="bottom_box">
		<div class="db" style="margin-left:26%;">
			<div class="db_1" >
				<img src="images/qg_logo.gif" width="100" height="100" />
			</div>
			<div class="db_2">
				<div class="db_2_1">
					<a href="index.jsp">网站首页</a> | <a href="indexStuff/introduce.jsp">QG简介</a> 
					| <a href="GetLiuyan">留言栏</a> | 
					<a href="ViewQGTrainingResFront.jsp">QG训练营</a> | 
					<a href="indexStuff/contact.jsp">联系我们</a> 
				</div>
				<div class="db_2_2">电话：XXXX-XXXXXXXX 地址：广东省 广东工业大学 QG工作室</div>
			</div>
			<div class="db_3">
				<img src="images/index/ewm.jpg" />
			</div>
		</div>
		<p style="padding-bottom:20px;padding-top:20px;" align="center">
			QG工作室<a target="_blank" href="http://weibo.com/qgstudio/">招新页面</a>版权所有&nbsp;Copyright <span style="font-family:Arial;">&copy;</span> 2008-2009&nbsp;&nbsp; <a href="#" target="_blank">http://weibo.com/qgstudio</a> 
		</p>
	</div>
	<div align='center' style='padding:5px'>
	  Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>PageAdmin CMS</strong></a>
    </div>
  </body>
</html>