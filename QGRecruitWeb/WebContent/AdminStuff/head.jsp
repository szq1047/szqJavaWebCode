<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8" />
        <base href="<%=basePath%>"/>  
        <link href="AdminStuff/css/admin.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <table cellspacing=0 cellpadding=0 width="100%" background="AdminStuff/img/header_bg.jpg" border=0>
            <tr height=56>
                <td width=260>
                	<img height=56 src="images/header_left.jpg" width=260>
               	</td>
                <td style="font-weight: bold; color: #fff; padding-top: 20px" align=right>
                	 当前用户：<%=request.getSession().getAttribute("adminName") %> &nbsp;&nbsp; 
                	 <a style="color: #fff" href="AdminStuff/index.jsp" target="main">修改口令</a> &nbsp;&nbsp; 
                	 <a style="color: #fff" onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="exit.jsp" target=_top>退出系统</a> 
                </td>  
            </tr> 
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
            <tr bgcolor=#1c5db6 height=4>
                <td></td>
            </tr>
        </table>
    </body>
</html>