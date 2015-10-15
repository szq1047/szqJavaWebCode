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
	<title>QG简介</title>
	<base href="<%=basePath%>">
	<meta name="Author" content="PageAdmin CMS" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link href="e/templates/150716/style.css" type="text/css" rel="stylesheet" />
	<script src="e/js/jquery.min.js" type="text/javascript"></script>
	<script src="e/js/comm.js" type="text/javascript"></script>
	<script src="e/js/zh-cn/lang.js" type="text/javascript"></script>
	<script src="e/js/script.js" type="text/javascript"></script>
	<script src="e/js/function.js" type="text/javascript"></script>
	<script type="text/javascript"> 
		function ChangeDiv(divId,divName,zDivCount) 
		{ 
			for(i=0;i<=zDivCount;i++) 
			{ 
				document.getElementById(divName+i).style.display="none"; 
				//将所有的层都隐藏 
			} 
			document.getElementById(divName+divId).style.display="block"; 
				//显示当前层 
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
	<div class="page_style sublanmupage page_l62_sl564">
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
 		<script type="text/javascript">var IsPageHome="";var Lanmu_Id="62";var Sublanmu_Id="564";ShowSubMenu(Lanmu_Id);</script>
		<div class="banner">
			<div style="background: url(images/index/tt33.jpg) no-repeat center top; height: 355px;">
				<div style="width: 980px; margin: 0 auto;">
					<div style="padding: 100px 0px 0 100px;">
						<div style="font-size: 30px; fint-weight: bold; color: white;">
							<p>
								QG<span style="font-size: 26px; margin-left: 20px;">宣传招新网</span>
							</p>
							<p>QG简介</p>
						</div>
						<div style="font-size: 24px; fint-weight: bold; color: white;"></div>
						<div style="font-size: 14px; fint-weight: bold; color: white;">
							Self-introduction</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_box main_box_style1">
  			<div class="main_box_inner">
    			<div class="main_box_inner_left">
      				<div id="nav_104"  class="nav_box nav_box_menu">
        				<div  class="nav_title">
        					<span  class="nav_sign">关于我们</span>
        					<span  class="nav_more"></span>
        				</div>
	        			<div id="nav_menu_104"  class="nav_menu">
		          			<ul id="rootul_104">
					            <li id="choice1" ><span onClick="JavaScript:ChangeDiv('0','JKDiv_',3)"><a href="#" class="sla564" onClick="return false">
								了解QG</a></span></li>
					            <li id="choice2"><span onClick="JavaScript:ChangeDiv('1','JKDiv_',3)"><a href="#" class="sla565" onClick="return false">
								QG技术</a></span></li>
					            <li id="choice3"><span onClick="JavaScript:ChangeDiv('2','JKDiv_',3)"><a href="#" class="sla566" onClick="return false">
							    QG荣誉</a></span></li>
					            <li id="choice4"><span onClick="JavaScript:ChangeDiv('3','JKDiv_',3)"><a href="#" class="sla625" onClick="return false">
								QG未来</a></span></li>
							</ul>
	        			</div>
      				</div>
     				<script type="text/javascript">shut_allsubnav("rootul_104");expand_subnav("sl564","0");</script>
      				<div style="border:1px solid #CCCCCC;margin-top:20px;">
        				<div style="padding-top:5px;:"><img src="images/call.gif"></div>
	        			<div style="padding:10px;">
				          <ul>
				            <li>QQ：434569735</li>
				            <li>邮箱：qg_studio@126.com</li>
				            <li>博客：http://www.cnblogs.com/qgstudio</li>
				            <li>地址：广东省 广州市 广东工业大学 计算机学院 QG工作室</li>
				          </ul>
	        			</div>
      				</div>
    			</div>
    			<div class="main_box_inner_right">
			      <div class="smallbanner">
			        <div style="border:1px solid #CBCBCB ;padding:3px 3px 0 3px;">
			        	<img src="images/003.jpg">
			        </div>
			      </div>
      			  <div class="current_location current_location_564">
			        <ul>
			          <li class="current_location_1">当前位置：<a href="index.jsp">首页 </a>&gt; <a href="#">QG简介</a></li>
			          <li class="current_location_2">QG简介</li>
			        </ul>
      			 </div>
      			 <div class="sublanmu_box sublanmu_box_564">
        			<div id="JKDiv_0"style="display:block">
          				<a><img src="images/qg.png" alt="" width="164" height="137" hspace="8" vspace="10" border="0" align="right" /></a> 
		  				<h2>了解QG</h2><br />
		  				<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QG工作室于2005年11月5日由谢光强副院长和李杨副教授指导下成立，由"广东工业大学-英特尔嵌入式技术联合实验室"负责发掘和培养创新型人才，工作室宗旨为大力提高学生科研创新、团队协作的能力，是计算机学院最大的学生科研创新团队之一。</p>
          				<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的口号是：“<strong>跨越自我，不同梦想，一样的执着追求</strong><strong>构建一流团队、造就创新人才</strong>”，我们把团队精神的培养上升到学术与科研能力培养并重，培养了QG工作室特有的“<strong>甘于奉献、勇为人先、开拓进取、大胆创新、团结协作</strong>”的团队精神，团队具有很强的<strong>凝聚力</strong>和<strong>战斗力</strong>。工作室还为成员提供一系列的团队特色活动：每年定期的新人培训，每周的技术交流会，丰富多彩的业余文化活动，不定期的讲座和教师指导，众多的研究课题和学生科技竞赛。工作室同学在<strong>研发、团队协作、做人</strong>各方面的能力都得到了很大的提升，受到了企业的肯定和欢迎，工作室毕业生近年来就业率都是<strong>100%</strong>，2015年7月毕业的10级学生，在2014年10月底就全部签订了就业协议，不少毕业生同时拿到几个知名IT公司的签约，从这个团队走出的成员，已相继走入社会：有的已到海内外著名高校深造，还有些团队成员毕业后进行了创业,有的进入<strong>百度、阿里巴巴、腾讯、华为、京东</strong>等知名IT公司工作，获得用人单位的肯定和好评！还有不少学生继续攻读硕（博）士研究生，到海内外著名高校深造！</p>
        			</div>
	        		<div id="JKDiv_1" style="display:none"> 
						<h2>QG技术</h2>
						<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本工作室是在2005年11月5日，在计算机智能与软计算研究所指导下，为了更好的让学生投入到计算机专业实践，而创立工作室。本团队目前有指导老师三位，分别是曾碧教授，谢光强老师，李扬老师。QG工作室目前下设四个计算机应用的热门方向：<strong>（1）计算机网络与分布式信息系统方向（2）智能与嵌入式方向（3）手机游戏图形图像开发（4）智能移动终端应用开发方向。</strong></p>
						<br/>
						<h3>网络组介绍</h3>
						<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QG工作室计算机网络与分布式信息系统小组，简称网络组（下面简称网络组），是QG工作室四个小组之一。网络组是顺应当今网络和计算机技术的快速发展，主要负责进行设计基于WEB的、可在Internet或Intranet上稳定运行和通讯的网站系统。前端方面，我们用HTML搭建网页架构、用CSS美化网站内容、用JavaScript让网站动起来，不仅如此，我们还用C#或者Java，利用MVC思想做前端最强硬的后台。每个网络组成员都是热爱互联网、喜欢编程、认真务实、积极向上的人。</p>
						<br/>
						<h3>嵌入式组介绍</h3>
						<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广东工业大学-因特尔嵌入式技术联合实验室（QG工作室）智能与嵌入式系统开发组，简称嵌入式组，是QG工作室所属四个小组之一。本小组是在2005年12月，在计算机智能与软计算所指导下，为了更好的让学生投入到计算机专业实践而创立。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;嵌入式小组有着丰富的开发资源，实验室拥有丰富的软硬件资源，包括电路板刻板机，控制芯片，电器元件，嵌入式实验平台等资源，以及历届传承下来的各类技术文档。小组的主要研究方向为基于ARM+LINUX平台嵌入式系统以及嵌在嵌入式系统研究后期，可进行嵌入式软件设计，嵌入式系统开发，嵌入式硬件开发。最终努力成为深入理解嵌入式系统技术，符合现代企业需求，综合能力强的人才。</p>
						<br/>
						<h3>移动组介绍</h3>
						<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;移动组全称智能移动终端应用开发小组。主要研究方向为手机平板等移动终端（目前主要是基于android操作系统）的应用开发。小组内主要有移动客户端开发和服务器端开发两个方向，开发时主要熟练使用到Java，AndroidSDK,Tomcat,Spring,MySQL等技术。移动组组内气氛活跃，勤奋，目前小组内已经自主开发出多款应用或游戏。同时，移动组与QG工作室的其他小组也有着密切的合作，为其他小组的移动终端需求提供技术支持。</p>
						<br/>
						<h3>手游组介绍</h3>
						<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小组主要的研究方向为虚拟现实技术的应用，以及手机游戏的开发：利用虚拟现实技术、3D建模技术，基于unity引擎开发技术等，通过视觉和听觉相结合的方式，基于PC机渲染出一个逼真的三维环境。再结合网络、数据库等技术开发出各种应用方向的软件。或者基于unity引擎，开发出可以发布到Android机，和ios机的手机游戏。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三维游戏既是虚拟现实技术重要的应用方向之一，也为虚拟现实技术的快速发展起了巨大的需求牵引作用。通过在小组的学习，已毕业的小组成员目前正在国内大型企业从事相关的软件开发工作，如阿里巴巴，西山居游戏，华为、3G等等。而游戏软件开发、网络、数据库开发的工作，也是该小组成员将来的理想选择。</p>
						<br/>
	        		</div>
        			<div id="JKDiv_2" style="display:none">
						<h2>QG的历史与荣誉</h2>
        				<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;QG工作室建起一个大学生科技创新实践平台，培养了一批又一批具有创新能力、高素质的计算机专业人才，取得了显著成效。工作室先后承担了教师科研课题<strong>30</strong>项、国家大学生创新创业训练计划等各类学生科技项目<strong>30</strong>多项,。所承担的科研项目共申请<strong>发明专利</strong>和<strong>软件著作权</strong>共<strong>12</strong>项，1项研究成果通过市级科技鉴定，获得<strong>市科技进步奖二等奖</strong>1项。工作室成员还获得计算机类各种国家、省、校级科研竞赛奖项<strong>80</strong>多项，其中省级以上奖项<strong>40</strong>项。工作室的同学曾获得第十二届“挑战杯”全国大学生课外学术科技作品竞赛终审决赛<strong>“一等奖”</strong>，刷新了学校在“挑战杯”竞赛中获奖层次的记录！重要奖项还有“挑战杯”广东省大学生课外学术科技作品竞赛 <strong>特等奖、一等奖</strong>，广东省“文泰高校杯”<strong>软件设计竞赛一等奖</strong>，广东省计算机专业本科大学生毕业作品赛<strong>一等奖</strong>，广东省大学生电子设计竞赛二等奖，多名同学获本科生毕业设计<strong>创新奖、罗克威尔奖学金、国家奖学金</strong>等各类奖学金、<strong>“广东工业大学十佳优秀毕业生”</strong>称号。
						</p>
					</div>
        			<div id="JKDiv_3" style="display:none">
						<img src="images/hd3.jpg" alt="" width="164" height="137" hspace="8" vspace="10" border="0" align="right" /></a></font> 
						<h2>QG的未来</h2>
        				<p style="letter-spacing:0.2em ; line-height:23px;font-family:宋体">&nbsp;&nbsp;&nbsp;QG工作室于2005年11月5日在计算机学院智能所谢光强老师和李杨老师的指导下成立，工作室宗旨为培养学生科研创新、团队协作的能力，是计算机学院最大的学生科研团队之一。在成立以来的10年时间里，工作室搭建起一个大学生科技创新实践平台，培养了一批又一批具有创新能力、高素质的计算机专业人才，取得了显著成效。<br/>&nbsp;&nbsp;&nbsp;<strong>“跨越自我，不同梦想，一样的执着追求, 构建一流团队、造就创新人才”</strong>，我们把团队精神的培养上升到学术与科研能力培养并重，培养了QG工作室特有的“甘于奉献、勇为人先、开拓进取、大胆创新、团结协作”的团队精神，团队具有很强的凝聚力和战斗力。QG工作室即将迎来它的第10周岁生日，QG工作室的队伍也在不断的扩大，培养了一批又一批德才兼备的优秀学生，工作室的目标也是每一位QG成员的目标，随着互联网的全球普及，云计算，大数据的兴起，QG工作室将适应时代的潮流，与时俱进，不断创新，社会的发展趋势就是我们所朝的方向，脚踏实地，勇往直前!
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
  		<div align='center' style='padding:5px'>Powered by <a href='http://www.pageadmin.net' target='_blank'><strong>PageAdmin CMS</strong></a></div>
	</div>
  </body>
</html>