<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.*,java.util.*,java.text.*,com.qg.BLL.*"%>
<%!String formatString(Object text) {
		if (text == null) {
			return "";
		}
		return text.toString();
	}
%>
<%
	//List<Notify> list=(List<Notify>)request.getAttribute("notifyList");
	NotifyManageBll bll = new NotifyManageBll();
	int pageNum = bll.getTotalpageNum();
	int curPage = bll.getCurPage("");
	System.out.println("pageNum=" + pageNum + ",curPage=" + curPage);
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>更多通知</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script src="js/index/jquery.min.js" type="text/javascript"></script>
<script src="js/index/function.js" type="text/javascript"></script>
<script src="js/comm.js" type="text/javascript"></script>
<script src="js/index/lang.js" type="text/javascript"></script>
<script src="js/index/script.js" type="text/javascript"></script>
<style>
.notify1 {
	width: 690px;
	height: 600px;
	float: left;
	border: 1px #CCCCCC solid;
	margin-left: 15px;
}

.notify1 .tit {
	background: url(images/index/new_tit.gif) no-repeat;
	text-align: left;
	padding-left: 5px;
	height: 35px;
	padding-top: 15px;
}

.notify1 .con {
	padding: 5px 10px 10px 10px;
}

.pageClass {
	position: absolute;
	bottom: -450px;
	padding-left: 250px;
}
}
</style>
<script type="text/javascript">
	$(function() {
		pageSwitch(1);
	});
	var page=1;
	function pageSwitch(curPage) {
		var pageNum=document.getElementById("pageNum").value;
		if(curPage=="last"){
			page=page-1;
			if(page<1){
				page=1;
			}
		}else if(curPage=="next"){
			page=page+1;
			if(page>pageNum){
				page=pageNum;
			}
		}else{
			page=curPage;
		}
		
		var url = "PageDivideServlet?curPage=" + page;
		if (window.XMLHttpRequest) {
			//IE7, Firefox, Opera支持  
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			//IE5,IE6支持  
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("POST", url, true);
		//onreadystatechange属性存有处理服务器响应的函数,有5个取值分别代表不同状态  
		req.onreadystatechange = callback;
		//send函数发送请求  
		req.send(null);
	}
	function callback() {
		if (req.readyState == 4 && req.status == 200) {
			var check = req.responseText;
			show(check);
		}
	}
	function show(str) {
		//alert(str);
		var json = eval(str);
		//str.subString(1,120)
		var title = null;
		document.getElementById("notify").innerHTML = '';
		for (var i = 0; i < json.length; i++) {
			var notfiyInfo = json[i];
			//实现如果标题的字数大于10的话，则用省略号显示
			if (notfiyInfo.ntfTitle.length > 10) {
				title = notfiyInfo.ntfTitle.substr(0, 10) + "...";
			} else {
				title = notfiyInfo.ntfTitle;
			}

			document.getElementById("notify").innerHTML += '<li><a href=ViewNotifyFrontByIdServlet?ntfId='
					+ notfiyInfo.ntfId
					+ '><span class="title">'
					+ title
					+ '</span> <span class="date" style="float:right">'
					+ notfiyInfo.ntfPubDate.substr(0, 10) + '</span></a><li>';
		}
	}
	function ExitSystem(){
		<%-- var name="<%=session.getAttribute("userName")%>";
		alert(name); --%>
		var msg="确定要退出吗？";
		if (window.confirm(msg)) {
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
					<a href=""><img src="images/QG logo.gif" width="102"
						height="97" border="0" /></a>
				</div>
				<div class="menu_box" id="Menu">
					<ul>
						<li class="menu_style_homepage menu_current" id="MenuItem61"
							name="MenuItem"><a href="index.jsp" class="menu">首页</a></li>
						<li class="menu_style" id="MenuItem62" name="MenuItem"><a
							href="indexStuff/introduce.jsp" class="menu">QG简介</a></li>
						<%
							if ((String)session.getAttribute("userName") != null
									&& isPassBM) {
						%>
						<li class="menu_style" id="MenuItem63" name="MenuItem"><a
							href="ViewtestFrontServlet" class="menu">QG试题下载</a></li>
						<%
							}
						%>
						<li class="menu_style" id="MenuItem64" name="MenuItem"><a
							href="GetLiuyan" class="menu">QG留言栏</a></li>
						<%
							if ((String)session.getAttribute("userName") != null
									&& isJoin) {
						%>
						<li class="menu_style" id="MenuItem68" name="MenuItem"><a
							href="ViewQGTrainingResFront.jsp" class="menu">QG训练营</a></li>
						<%} %>
						<li class="menu_style" id="MenuItem65" name="MenuItem"><a
							href="indexStuff/contact.jsp" class="menu">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var IsPageHome = "1";
			var Lanmu_Id = "61";
			var Sublanmu_Id = "0";
			ShowSubMenu(Lanmu_Id);
		</script>
		<div class="banner">
			<div
				style="background: url(images/index/tt33.jpg) no-repeat center top; height: 355px;">
				<div style="width: 980px; margin: 0 auto;">
					<div style="padding: 100px 0px 0 100px;">
						<div style="font-size: 30px; fint-weight: bold; color: white;">
							<p>
								QG<span style="font-size: 26px; margin-left: 20px;">展望未来</span>
							</p>
							<p>WE TOGETHER</p>
						</div>
						<div style="font-size: 24px; fint-weight: bold; color: white;"></div>
						<div style="font-size: 14px; fint-weight: bold; color: white;">
							跨越自我，不同的梦想，一样的执着与追求</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_box main_box_style">
			<div class="main_box_inner">
				<div class="ab_us">
					<div class="tit">
						<img src="images/index/ab_us.gif" />
					</div>
					<div class="con">
						<div class="wp-title_content"
							style="word-wrap: break-word; padding: 0px; border-color: #CCCCCC; border-width: 0px; height: 132px; width: 259px; display: block; border-style: solid; text-align: left;">
							<div align="center">
								<img src="images/index/ab_us7.gif" width="242" height="34" />
							</div>
							<span style="line-height: 180%;" id="LoadContact">
								QG工作室是在2005年11月5日，为了更好的让学生投入到计算机专业实践，而创立工作室。本团队目前有指导老师三位，分别是曾碧教授，谢光强老师，李扬老师。QG工作室目前拥有三个涵盖了目前社会上最炙手可热的三大专业方向，其分别是：智能与嵌入式方向、智能与图形处理方向、计算机网络与分布式信息系统方向</span>
						</div>
						<a style="color: #cc0000;" href="about/"></a>
					</div>
				</div>
				<div class="notify1">
					<div class="tit">
						<img src="images/index/new.gif" />
					</div>
					<div class="con">
						<div>
							<ul class="tw_article" id="notify">

							</ul>
							<%-- <ul class="tw_article">
								<%
									if (list == null) {
								%>
								<li>暂无通知！</li>
								<%
									} else {
										for (int i = 0; i < list.size(); i++) {
											String title = list.get(i).getNtfTitle();
											if (title.length() > 10) {
												title += "...";
											}
											String ntfId = String.valueOf(list.get(i).getNtfId());
											//System.out.println("ntfId="+list.get(i).getNtfId());
								%>
								<li><a href="ViewNotifyFrontByIdServlet?ntfId=<%=ntfId%>">
										<span class="title"><%=title%></span> <span class="date"
										style="float: right"><%=list.get(i).getNtfPubDate().substring(0, 10)%></span>
								</a>
									<li>
										<%
											}
											}
										%>
								
							</ul> --%>
							<div class="pageClass">
								<input type="button" id="" onclick="pageSwitch(1)" value="首页" />
								<%
									if (curPage >= 1) {
								%>
								<%-- <input type="button" value="上一页" 
									onclick='pageSwitch("<%=curPage-1 %>")' /> --%>
								<input type="button" value="上一页" onclick='pageSwitch("last")' />
								<%
									}
								%>
								<%
									if (curPage <= pageNum) {
								%>
								<%-- <input type="button" value="下一页"
									onclick='pageSwitch("<%=curPage + 1%>")' /> --%>
								<input type="button" value="下一页" onclick='pageSwitch("next")' />
								<%
									}
								%>
								<input type="button" onclick='pageSwitch("<%=pageNum%>")'
									value="尾页" /> <input type="text" id="pageNum"
									value="<%=pageNum %>" style="display: none" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear main_box_inner_bottom"></div>
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
			<div align='center' style='padding: 5px'>
				Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>PageAdmin
						CMS</strong></a>
			</div>
		</div>
	</div>
</body>
</html>