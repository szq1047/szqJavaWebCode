<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.*,java.util.*,java.text.*,com.qg.BLL.*"%>
<%@ page import="com.qg.model.Message,java.sql.*,java.util.*" %>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>  
<%	
	String user="";
	if(session.getAttribute("userName")!=null) {
		user = session.getAttribute("userName").toString();
  	}
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
	<title>QG工作室招新网站——QG留言栏</title>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="e/templates/150716/style.css" type="text/css" rel="stylesheet" />
	<script src="e/js/jquery.min.js" type="text/javascript"></script>
	<script src="e/js/comm.js" type="text/javascript"></script>
	<script src="e/js/zh-cn/lang.js" type="text/javascript"></script>
	<script src="e/js/script.js" type="text/javascript"></script>
	<script src="e/js/function.js" type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/lang/zh-cn/zh-cn.js"></script>	
  
    <script type="text/javascript">
	    //实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');
	</script>
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
    <div class="page_style sublanmupage page_l64_sl658">
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
   				<a href=""><img src="images/QG logo.gif" width="102" height="97" border="0" /></a>
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
	  <script type="text/javascript">var IsPageHome="";var Lanmu_Id="64";var Sublanmu_Id="658";ShowSubMenu(Lanmu_Id);</script>
	  <div class="banner">
		<div style="background: url(images/index/tt33.jpg) no-repeat center top; height: 355px;">
			<div style="width: 980px; margin: 0 auto;">
				<div style="padding: 100px 0px 0 100px;">
					<div style="font-size: 30px; fint-weight: bold; color: white;">
						<p>
							QG<span style="font-size: 26px; margin-left: 20px;">宣传招新网</span>
						</p>
						<p>留言栏</p>
					</div>
					<div style="font-size: 24px; fint-weight: bold; color: white;"></div>
					<div style="font-size: 14px; fint-weight: bold; color: white;">
						Build happy</div>
				</div>
			</div>
		</div>
	  </div>
	  <div class="main_box main_box_style1">
 		<div class="main_box_inner">
   			<div class="main_box_inner_left" style="margin-top:-230px;">
				<div id="nav_106"  class="nav_box nav_box_menu" >
					<div  class="nav_title">
						<span  class="nav_sign">留言展示</span>
						<span  class="nav_more"></span>
					</div>
				</div>
				<script type="text/javascript">
					shut_allsubnav("rootul_106");
					expand_subnav("sl658",",653,");
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
   			<div class="main_box_inner_right" style="margin-top:-230px;">
				<div class="current_location current_location_658">
					<ul>
						<li class="current_location_1">当前位置：<a href="index.jsp">首页</a> &gt;<a href="GetLiuyan">QG留言栏</a></li>
						<li class="current_location_2">QG留言栏</li>
					</ul>
				</div>
				<div class="sublanmu_box sublanmu_box_658"  style="margin-top:-25px;">
					<div class="sublanmu_content sublanmu_content_article">
						<ul class="tw_article" style="font-size:18px;">
					      <%!int showPage;int maxPage; %>
						  <%
						   Integer spstr=(Integer)request.getAttribute("showPage");//获取当前所显示的页码 
						   Integer tpnstr=(Integer)request.getAttribute("totalPageNum");//获取总页数
						   //处理当前页码值  
						   if(spstr==null||"".equals(spstr)){
							   showPage=1;
						   }else						   {
							  showPage=spstr.intValue();
						   }	
						   //处理总页码值
						   maxPage=tpnstr.intValue();
						   if (request.getAttribute("dataList") == null||request.getAttribute("dataList").equals("")){
					      %>
							<li>
								<span class="pic">
								  <a href="#" target="_self">
								  <img src="e/upload/s1/article/image/2015/07/t_15144639.jpg" border="0" style="width:150px;height:150px;"></a>
								</span>							
								<p class="introduct">
								  啊哦！当前还没有任何人留下一句话！
								</p>
							</li>
					      <%
					       } else {
					    	  List<Message> list = (List<Message>) request.getAttribute("dataList");
					    	  for(Object messageList : list){
					    		  Message message = (Message) messageList;
					        	  %>
							<li>
								<span class="title">
								    留言人：<a href="GetLiuyan"  target="_self"><%=message.getUsername() %></a>
								</span>
								<span class="title">
								    留言标题：<%=message.getMsgName() %>
								</span>		
								<span class="title">
								    留言时间：<%=message.getMsgPubDate() %>
								</span>															
								<p class="introduct">
								    留言内容：<%=message.getMsgContent() %>
								</p>
							</li>					        	  
					      <%  }
					      }
					      %>					      						  						
						</ul>	
						<div style="margin-left:520px; font-size:15px;">
						  <%if (showPage > 1){
						  %>
						  <a href="GetLiuyan?page=1">首页</a>
						  <a href="GetLiuyan?page=<%=spstr - 1%>">上一页</a>
						  <%}else {%>
						 	 首页 上一页
						  <%}
						  	if (showPage < maxPage){
						  %>  
						  <a href="GetLiuyan?page=<%=spstr + 1%>">下一页</a>
						  <a href="GetLiuyan?page=<%=tpnstr %>">尾页</a>
						  <% }else { %>
						  	下一页 尾页
						  <%}%>   
						  </div>   											
					</div>
				</div>
				<div id="liuyan" style="margin-left:10px;margin-top:-10px;">
					<form action="addMessage?user=<%=user %>" method="post">
						<script id="editor" name="content" type="text/plain" style="width:725px;height:200px;"></script>
						<div style="margin-top:10px;margin-left:300px;width:20px;">
							<input type="submit" value="提交留言">
						</div>
					</form>		
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
	  <div align='center' style='padding:5px'>
	  	Powered by <a href='http://www.pageadmin.net' target='_blank'>
	  	<strong>PageAdmin CMS</strong></a>
	  </div>
	</div>
  </body>
</html>