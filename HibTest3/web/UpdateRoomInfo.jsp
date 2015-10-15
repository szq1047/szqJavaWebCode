<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.hibtest3.entity.RoomInfo" %>
<%
	//System.out.println("roomInfo=================="+request.getAttribute("room"));
	RoomInfo roomInfo = (RoomInfo) request.getAttribute("room");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改客房信息</title>
<link rel="stylesheet" type="text/css" href="CSS/myCss.css" />
<style type="text/css">
.style2 {
	width: 400px;
	height: 250px;
	text-align: center;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	border-style: solid;
	border-width: 1px;
	border-color: gray;
}

.selectStyle {
	width: 150px;
}
</style>

</head>
<body>
	<form method="post" action="/HibTest3/room/updateRoomInfo">
		<div class="main">
			<table class="style2">
						<tr>
							<td>房间编号</td>
							<td><input type="text" name="roomInfos.Rno" value="<%=roomInfo.getRno()%>" readonly="readonly"/></td>
						</tr>
						<tr>
							<td>房间类型</td>
							<td><select class="selectStyle" name="roomInfos.Rstyle" id="rstyle">
									<option value="1" >单人间</option>
									<option value="2" >双人间</option>
									<option value="3" >豪华单人间</option>
									<option value="4" >豪华双人间</option>
									<option value="5" >标准间</option>
							</select>
								<script>
								 for(var i=0;i<document.getElementById('rstyle').options.length;i++){
									if(document.getElementById('rstyle').options[i].text==='<%=roomInfo.getRstyle()%>'){
									document.getElementById('rstyle').options[i].selected=true;
									}
								}   
								
								</script>
							</td>
						</tr>
						<tr>
							<td>房间价格</td>
							<td><input type="text" name="roomInfos.Rprice" value="<%=roomInfo.getRprice()%>"/></td>
						</tr>
						<tr>
							<td>房间状态</td>
							<td><select class="selectStyle" name="roomInfos.Rstate" id="selstate">
									<option value="1">占用</option>
									<option value="2">未占用</option>
							</select>
							<script>
								 for(var i=0;i<document.getElementById('selstate').options.length;i++){
									if(document.getElementById('selstate').options[i].text==='<%=roomInfo.getRstate()%>'){
									document.getElementById('selstate').options[i].selected=true;
									}//通过遍历select标签的文件，如果文本与rom.getRstate()得到值相同，那么就设为标记
								}   
								</script>
							</td>
						</tr>
						<tr>
							<td>房间号码</td>
							<td><input type="text" name="roomInfos.Rtel" value="<%=roomInfo.getRtel()%>"/></td>
						</tr>

						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="修改" /></td>
						</tr>
			</table>
		</div>
	</form>
</body>
</html>