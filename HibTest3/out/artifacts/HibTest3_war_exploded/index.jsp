<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/26
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>房间管理系统</title>
  <link rel="stylesheet" type="text/css" href="CSS/myCss.css" />
  <style type="text/css">
    .list{width:100%;overflow:hidden;zoom:0;border:1px solid #ccc}
    .list li{float:left;width:120px;padding:5px}
    li {list-style-type:none;}
  </style>
</head>
<body class="body">
<div class="top">
  <h1><center><font color="gray">房间管理系统</font></center></h1>
  <br>
  <ul class="list">
    <li><a href="AddcustomerInfo.jsp" target="content">客户信息管理</a></li>
    <li><a href="/HibTest3/room/getListRoom" target="content" >房间管理</a></li>
    <li><a href="/HibTest3/customer/getListCustomer" target="content">住宿管理</a></li>
    <li><a href="/HibTest3/living/getListCustomerLiving" target="content">退房管理</a></li>
    <li>房间物品管理</li>
  </ul>
</div>
<div class="main">
  <iframe src="/HibTest3/room/getListRoom" name="content" width="100%" height="100%" scrolling="no" frameborder="0" border=0 framespacing="2"></iframe>
</div>
</body>
</html>
