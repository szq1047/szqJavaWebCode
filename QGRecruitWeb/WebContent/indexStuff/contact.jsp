<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.*,java.util.*,java.text.*,com.qg.BLL.*"%>
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
<!DOCTYPE html>
<html>
  <head>
	<title>QG联系方式</title>
	<meta name="Author" content="PageAdmin CMS" />
	<base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link href="e/templates/150716/style.css" type="text/css" rel="stylesheet" />
	<script src="e/js/jquery.min.js" type="text/javascript"></script>
	<script src="e/js/comm.js" type="text/javascript"></script>
	<script src="e/js/zh-cn/lang.js" type="text/javascript"></script>
	<script src="e/js/script.js" type="text/javascript"></script>
	<script src="e/js/function.js" type="text/javascript"></script>
	<script type="text/javascript">
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
	<div class="page_style sublanmupage page_l65_sl534">
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
						</div></div><div class="clear"></div>
	   <div class="logo"><a href=""><img src="images/QG logo.gif" width="102" height="97" border="0" /></a></div>
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
	<script type="text/javascript">var IsPageHome="";var Lanmu_Id="65";var Sublanmu_Id="534";ShowSubMenu(Lanmu_Id);</script>
	<div class="banner">
			<div style="background: url(images/index/tt33.jpg) no-repeat center top; height: 355px;">
				<div style="width: 980px; margin: 0 auto;">
					<div style="padding: 100px 0px 0 100px;">
						<div style="font-size: 30px; fint-weight: bold; color: white;">
							<p>
								QG<span style="font-size: 26px; margin-left: 20px;">宣传招新网</span>
							</p>
							<p>联系方式</p>
						</div>
						<div style="font-size: 24px; fint-weight: bold; color: white;"></div>
						<div style="font-size: 14px; fint-weight: bold; color: white;">
							Welcome to contact with us</div>
					</div>
				</div>
			</div>
		</div>
	<div class="main_box main_box_style1">
	 <div class="main_box_inner">
	   <div class="main_box_inner_left">
	<div id="nav_108"  class="nav_box nav_box_menu">
	
	<div  class="nav_title"><span  class="nav_sign">联系我们</span><span  class="nav_more"></span></div>
	<div id="nav_menu_108"  class="nav_menu">
	<ul id="rootul_108"><li id="sl534"><a href="#" class="sla534">联系方式</a></li>
	<li id="sl535"><a href="GetLiuyan" class="sla535">在线留言</a></li>
	</ul>
	</div></div>
	<script type="text/javascript">
	shut_allsubnav("rootul_108");
	expand_subnav("sl534","0");
	</script>
	<div style="border:1px solid #CCCCCC;margin-top:20px;">
	<div style="padding-top:5px;:"><img src="e/images/home/call.gif"></div>
	<div style="padding:10px;">
	<ul>
	<li>热线：XXXX-XXXXXXXX</li>
	<li>邮箱：XXXXe@xxxxx.com</li>
	<li>传真：XXXX-XXXXXXXX</li>
	<li>地址：中国某某市某某区某某街某某栋某某号</li>
	</ul>
	</div>
	</div>
	
	</div>
	<div class="main_box_inner_right"><div class="smallbanner"><div style="border:1px solid #CBCBCB ;padding:3px 3px 0 3px;"><img src="e/images/home/nut_5.jpg"></div></div>
	<div class="current_location current_location_534"><ul><li class="current_location_1">当前位置：<a href="index.jsp">首页</a>&gt;<a href="#">联系我们</a></li><li class="current_location_2">联系方式</li></ul></div>
	<div class="sublanmu_box sublanmu_box_534">
	<div class="sublanmu_content sublanmu_content_introduct">
	<style type="text/css">
	.lxtable{border-collapse:collapse;border:1px solid #cccccc;width:100%}
	.lxtable td{border:1px solid #cccccc;padding:5px}
	</style>
	<img src="e/upload/s1/fck/image/2015/05/25/1604425781.gif" alt="" height="122" vspace="5" width="520" /><br />
	<table class="lxtable ke-zeroborder" border="0" cellpadding="0" cellspacing="0" align="center">
		<tbody>
			<tr>
				<td height="21" bgcolor="#e8e8e8" width="20%">
					<div align="center">
						工作室名称：
					</div>
				</td>
				<td height="21" width="80%">
					QG工作室
				</td>
			</tr>
			<tr class="L15">
				<td bgcolor="#e8e8e8" width="20%">
					<div align="center">
						通讯地址：
					</div>
				</td>
				<td width="80%">
					广东省广州市番禺区大学城广东工业大学工学一号馆
				</td>
			</tr>
			<tr class="L15">
				<td bgcolor="#e8e8e8">
					<div align="center">
						邮政编码：
					</div>
				</td>
				<td>
					511400
				</td>
			</tr>
			<tr class="L15">
				<td bgcolor="#e8e8e8" width="20%">
					<div align="center">
						联系电话：
					</div>
				</td>
				<td width="80%">
					XXX-XXXXXXXX
				</td>
			</tr>
			<tr class="L15">
				<td bgcolor="#e8e8e8" width="20%">
					<div align="center">
						报名咨询：
					</div>
				</td>
				<td width="80%">
					<a target="_blank" href="http://wpa.qq.com/msgrd?V=1&amp;uin=14837715&amp;Site=pageadmin&amp;Menu=yes"><img src="http://wpa.qq.com/pa?p=1:14837715:4" alt="14837715" height="16" border="0" vspace="3" align="absMiddle" />14837715</a>（授权） &nbsp;&nbsp; <a target="_blank" href="http://wpa.qq.com/msgrd?V=1&amp;uin=190452532&amp;Site=pageadmin&amp;Menu=yes"><img src="http://wpa.qq.com/pa?p=1:190452532:4" alt="190452532" height="16" border="0" vspace="3" align="absMiddle" />190452532</a>（定制）
				</td>
			</tr>
			<tr class="L15">
				<td bgcolor="#e8e8e8" width="20%">
					<div align="center">
						传真号码：
					</div>
				</td>
				<td width="80%">
					0760-86744123
				</td>
			</tr>
		</tbody>
	</table>
	<p>&nbsp;</p><br />
	</div>
	</div>
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
		<div align='center' style='padding:5px'>Powered by 
		<a href='http://www.pageadmin.net' target='_blank'><strong>PageAdmin CMS</strong></a>
		</div>
	</div>
  </body>
</html>