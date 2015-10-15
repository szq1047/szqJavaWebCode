<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/myCss.css" />
<style type="text/css">
	
	.style2{
	width:400px;
	height:250px;
	text-align:center;
	margin-top:50px;
	margin-left:auto;
	margin-right:auto;
	border-style: solid;border-width:1px;border-color: gray;
	}
	.selectStyle{
		width:150px;
	}
</style>
</head>
<body>
<form method="post" action="/HibTest3/room/addRoomInfo">
	<div class="main">
	<table class="style2">
		<tr>
			<td >房间编号</td><td><input type="text" name="roomInfos.Rno"></td>
		</tr>
		<tr>
			<td>房间类型</td>
			
			<td>
				<select class="selectStyle" name="roomInfos.Rstyle">
					<option value="1" selected="selected">单人间</option>
					<option value="2">双人间</option>
					<option value="3">豪华单人间</option>
					<option value="4">豪华双人间</option>
					<option value="5">标准间</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>房间价格</td><td><input type="text" name="roomInfos.Rprice"></td>
		</tr>
		<tr>
			<td>房间状态</td>
			<td>
			<select class="selectStyle" name="roomInfos.Rstate">
					<option value="1">占用</option>
					<option value="2" selected="selected">未占用</option>		
			</select>
			</td>
		</tr>
		<tr>
			<td>房间号码</td><td><input type="text" name="roomInfos.Rtel"></td>
		</tr>
		
		<tr><td colspan="2" align="center"><input type="submit" value="添加"/></td></tr>
		</table>
	</div>
	</form>
</body>
</html>