<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	try{
		String userName=request.getSession().getAttribute("adminName").toString();
	}catch(Exception e){
		response.sendRedirect("login.jsp");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>发布通知</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <link href="./css/mine.css" type="text/css" rel="stylesheet">
        <link href="./js/ueditor/themes/default/css/ueditor.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="./js/ueditor/third-party/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="./js/ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="./js/ueditor/ueditor.all.min.js"></script>
        <script type="text/javascript" src="./js/ueditor/lang/zh-cn/zh-cn.js"></script>
    </head>

    <body>
        <div class="div_head">
            <span>
                <span style="float:left">当前位置是：通知管理->发布通知</span>
                <span style="float:right;margin-right: 8px;font-weight: bold">
                    <a style="text-decoration: none" href="ViewAllNotifyServlet">【返回】</a>
                </span>
            </span>
        </div>
        <div></div>

        <div style="font-size: 13px;margin: 10px 5px">
            <form action="AddNotifyServlet" method="post" >
            <table border="1" width="100%" class="table_a">
                <tr>
                    <td>通知标题</td>
                    <td><input type="text" name="notifyTitle"/></td>
                </tr>
               
                <tr>
                    <td>通知内容</td>
                    <td> 
                    	<script type="text/plain" id="myEditor" name="content" style="width:1000px;height:240px">
                       
						<p>这里我可以填写一些输入提示</p>
						</script>
						<script type="text/javascript"> 
							//实例化编辑器
							var um=UE.getEditor('myEditor');
						</script>
                    </td>
                </tr>
                
                <tr >
                    <td colspan="2">
                        <input type="submit" value="添加">
                    </td>
                </tr>  
            </table>
            </form>
        </div>
    </body>
</html>