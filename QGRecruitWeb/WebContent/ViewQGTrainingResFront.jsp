<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.qg.model.*,java.util.*,java.text.*,com.qg.BLL.*,java.util.*"%>
<%!String formatString(Object text) {
		if (text == null) {
			return "";
		}
		return text.toString();
	}%>
<%	
	String user = "";
	int uid = 0;
	String realname = "";
	UserBLL userbll = new UserBLL();
	if (session.getAttribute("userName") == null){
		response.sendRedirect("index.jsp");
		return;
	} 
	else{
		user = session.getAttribute("userName").toString();
		uid = Integer.parseInt(session.getAttribute("userId").toString());
		realname = userbll.getUserRealName(user, uid);
	}
	BM bm=new BM(); 
	BMBLL bmbll=new BMBLL();
	bm=bmbll.getBMInfoByUserId(Integer.parseInt(session.getAttribute("userId").toString()));
	ResourceBll resbll=new ResourceBll();
	List<Resource> reslist=resbll.getAllResourceInfoByGroupId(bm.getGroupID());
	GroupInfoBll groupbll=new GroupInfoBll();
	List<GroupInfo> grouplist=groupbll.getAllGroupInfo();
	
	DownLoadHW hw = new DownLoadHW();
	DownLoadHWBLL hwbll = new DownLoadHWBLL();
	List<DownLoadHW> hwlist = hwbll.getMHWList(Integer.parseInt(session.getAttribute("userId").toString()));
	
	ZJ zj = new ZJ();
	ZJBLL zjbll = new ZJBLL();
	List<ZJ> zjlist = zjbll.getZJList(realname);
	
	//下面这一段是从user表中 获取是否通过报名表以及是否可以加入QG训练营
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
	<title>QG训练营</title>
	<meta name="Keywords" content="QG工作室招系统" />
	<meta name="Author" content="PageAdmin CMS" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/style.css" type="text/css" rel="stylesheet" />
	<script src="js/index/function.js" type="text/javascript"></script>
	<script src="js/comm.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/lrtk.css" type="text/css" />
	<link rel="stylesheet" href="css/main.css" type="text/css" />
	<script src="js/hashtabber.js"></script>
	<script type="text/javascript">
		function ExitSystem(){
			<%-- var name="<%=session.getAttribute("userName")%>";
			alert(name); --%>
			var msg="确定要退出吗？";
			if (window.confirm(msg)){
				window.location = "ExitFrontSystemServlet";//跳出框架,清除session
				//window.href="index.jsp";
			}
		}
	</script>
	<style type="text/css">
		.notify1 {
			width: 650px;
			height: 300px;
			float: left;
			border: 1px #CCCCCC solid;
			margin-left: 0px;
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
	</style>
  </head>
  <body style="padding:0px;">
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
						<%if ((String)session.getAttribute("userName") != null&& isPassBM) {%>
						<li class="menu_style" id="MenuItem63" name="MenuItem"><a
							href="ViewtestFrontServlet" class="menu">QG试题下载</a></li>
						<%}%>
						<li class="menu_style" id="MenuItem64" name="MenuItem"><a
							href="GetLiuyan" class="menu">QG留言栏</a></li>
						<%if ((String)session.getAttribute("userName") != null&& isJoin) {%>
						<li class="menu_style" id="MenuItem68" name="MenuItem"><a
							href="ViewQGTrainingResFront.jsp" class="menu">QG训练营</a></li>
						<%}%>
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
		<!-- 代码 开始 -->
		<section class="example"> <section class="hashTabber-sandstone-wrapper">
		<ol class="hashTabber-nav hashTabber-sandstone" data-hashtabber-id="dinosaurs" data-hashtabber- default="pterosaur">
			<h2>QG训练营</h2>
			<li data-hashtabber-pair="velociraptor" class="">
				<a href="#dinosaurs=velociraptor">资料</a></li>
			<li data-hashtabber-pair="pterosaur" class="">
				<a href="#dinosaurs=pterosaur">周记</a></li>
			<li data-hashtabber-pair="lambeosaurus" class="">
				<a href="#dinosaurs=lambeosaurus">作业</a></li>
		</ol>
		<ol class="hashTabber-data hashTabber-sandstone" data-hashtabber-id="dinosaurs">
			<li data-hashtabber-pair="velociraptor" class="">
			<article>
				<div class="notify1">
					<div class="tit">
						资料下载
					</div>
					<div class="con">
						<div class="tw_article" id="notify">
							<div style="font-size: 13px; margin: 10px 5px;">
								<table class="table_a" border="1" width="100%">
									<tbody>
										<%if (reslist.equals("") || reslist == null || reslist.size()==0) {%>
										<tr>
											<td colspan="5"><center>暂无数据！</center></td>
										</tr>
										<%} else {%>
										<%for (int i = 0; i < reslist.size(); i++) {%>
										<tr>
											<td><%=reslist.get(i).getInfoTitle()%></td>
											<td><%=reslist.get(i).getAdminName() %></td>
											<td align="center"><%=reslist.get(i).getInfoPubDate().substring(0,16)%></td>
											<td><%=grouplist.get(Integer.parseInt(reslist.get(i).getInfoGroupId())).getGroupName()%></td>
											<td>
												<a href="DownloadFileServlet?filename=<%=reslist.get(i).getInPath()%>">下载</a>
											</td>
										</tr>
										<%}}%>
									</tbody>
								</table> 	 
							</div>
						</div>
					</div>
				</div>
			</article>
			</li>
			<li data-hashtabber-pair="pterosaur" class="">
				<article>
				<div class="notify1">
					<div class="tit">
						周记上传
					</div>
					<div class="con">
						<div class="tw_article" id="notify">
							<div style="font-size: 13px; margin: 10px 5px;">
								<table class="table_a" border="1" width="100%">
									<tbody>
										<tr>
											<td>周记ID</td>
											<td>标题</td>
											<td>上传人</td>
											<td>上传时间</td>
											<td>所属小组</td>
											<td>下载</td>
										</tr>
										<%if (zjlist.equals(null) || zjlist == null){%>
										<tr>
											<td colspan="5"><center>暂无数据！</center></td>
										</tr>
										<%} else {
											for (int i = 0; i < zjlist.size(); i++) {%>
										<tr>
											<td><%=zjlist.get(i).getWrID() %></td>
											<td><%=zjlist.get(i).getWrTitle() %></td>
											<td><%=zjlist.get(i).getWrAuthor() %></td>
											<td><%=zjlist.get(i).getWrUptime() %></td>
											<td><%=grouplist.get(zjlist.get(i).getWrGroupID()).getGroupName()%></td>
											<td>
												<a href="DownLoadFile?url=<%=zjlist.get(i).getWrPath() %>">下载</a>
											</td>
										</tr>
										<%}}%>
									</tbody>
								</table> 
						        <form action="UploadNewZJ?uid=<%=uid %>&&user=<%=user %>&&realname=<%=realname %>" enctype="multipart/form-data" method="post">  
								  <table id="upNewTB">
						          <tr>
						          	<td>
						          	 	上传新的周记：
						          	</td>
						          </tr>
						          <tr>
						         	<td>
						         	  <div style="width:70%;">
						         	  	<input name="file" type="file" style="width:100%;border:1px solid gray" />
						         	  </div>
						         	  <div style="width:15%;margin-left:75%;margin-top:-25px;">
						         	  	<input type="submit" value="上传 " />
						         	  </div>
						         	  <div style="width:15%;height:20px;margin-left:88%;margin-top:-25px">
						         	  	<input type="reset" value="重置" />
						         	  </div>
						         	</td>       	        
						          </tr> 
								  </table>	
								 </form>					
							</div>
						</div>
					</div>
				</div>
				</article>
			</li>
		    <li data-hashtabber-pair="lambeosaurus" class="">
				<article>
				<div class="notify1">
					<div class="tit">
						作业下载
					</div>
					<div class="con">
						<div class="tw_article" id="notify">
							<div style="font-size: 13px; margin: 10px 5px;">
								<table class="table_a" border="1" width="100%">
									<tbody>
										<%if (hwlist.equals("") || hwlist == null){%>
										<tr>
											<td colspan="5"><center>暂无数据！</center></td>
										</tr>
										<%} else {
											for (int i = 0; i < hwlist.size(); i++) {%>
										<tr>
											<td>作业序号</td>
											<td>作业题目</td>
											<td>发布者</td>
											<td>所属组</td>
											<td>发布时间</td>
											<td>下载</td>
										</tr>
										<tr>
											<td><%=hwlist.get(i).getHw_id() %></td>
											<td><%=hwlist.get(i).getHw_title() %></td>
											<td><%=hwlist.get(i).getHw_author() %></td>
											<td><%=grouplist.get(hwlist.get(i).getGroup_id()).getGroupName()%></td>
											<td><%=hwlist.get(i).getHw_uptime() %></td>
											<td>
											<a href="DownLoadFile?url=<%=hwlist.get(i).getHw_path() %>">下载</a></td>
										</tr>
										<%}}%>
									</tbody>
								</table> 
						        <form action="UploadFinishedWork?user=<%=user %>&&uid=<%=uid %>" enctype="multipart/form-data" method="post">  
								  <table id="upNewTB">
						          <tr>
						          	<td>
						          	 	上传已完成的作业：
						          	</td>
						          </tr>
						          <tr>
						         	<td>
						         	  <div style="width:70%;">
						         	  	<input name="file" type="file" style="width:100%;border:1px solid gray" />
						         	  </div>
						         	  <div style="width:15%;margin-left:75%;margin-top:-25px;">
						         	  	<input type="submit" value="上传 " />
						         	  </div>
						         	  <div style="width:15%;height:20px;margin-left:88%;margin-top:-25px">
						         	  	<input type="reset" value="重置" />
						         	  </div>
						         	</td>       	        
						          </tr> 
								  </table>	
								 </form>					
							</div>
						</div>
					</div>
				</div>
				</article>
			</li>
		</ol>
		</section></section>
		<script>
			var tabber = new HashTabber();
			tabber.run();
		</script>
		<!--中间 代码结束 -->
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
			Powered by 
			<a href='http://www.pageadmin.net' target='_blank'><strong>PageAdminCMS</strong></a>
		</div>
	</div>
  </body>
</html>