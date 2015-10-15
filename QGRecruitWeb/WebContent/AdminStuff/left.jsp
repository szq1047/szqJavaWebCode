<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <base href="<%=basePath%>"/>       
        <link href="AdminStuff/css/admin.css" type="text/css" rel="stylesheet" />
        <script language=javascript>
            function expand(el)
            {
                childobj = document.getElementById("child" + el);
                if (childobj.style.display == 'none')
                {
                    childobj.style.display = 'block';
                }
                else
                {
                    childobj.style.display = 'none';
                }
                return;
            }
        </script>
    </head>
    <body>
        <table height="100%" cellspacing=0 cellpadding=0 width=170 background=AdminStuff/img/menu_bg.jpg border=0>
        	<tr>
            	<td valign=top align=middle>
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>
                    	<tr>
                            <td height=10></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(1) href="javascript:void(0);">用户管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
					
					<table id=child1 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                           	</td>
                            <td style="text-align: left" >
                            	<a class=menuchild href="ViewPassTestInfoServlet" target="right">加入训练营管理</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30 >
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td style="text-align: left">
                            	<a class=menuchild href="ViewAdminAndUserServlet" target=right>导师分配管理</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td style="text-align: left">
                            	<a class=menuchild href="ViewAllAllocateServlet" target=right>查看分配结果</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
					
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                        	<td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(2) href="javascript:void(0);">报名管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child2 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                           	</td>
                            <td style="text-align: left">
                            	<a class=menuchild href="NewBMTableManage" target="right">空报名表管理</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30 >
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td style="text-align: left">
                            	<a class=menuchild href="ZXBMManage" target="right">在线报名管理</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30 >
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td style="text-align: left">
                            	<a class=menuchild href="BMTableManage" target="right">报名表管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(3) href="javascript:void(0);">留言管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child3 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                           	</td>
                            <td>
                            	<a class=menuchild href="GetLiuyan?role=admin" target="right">查看删除留言</a>
                           	</td>
                        </tr>
						<tr height=4>
                            <td colspan=2></td>
                        </tr>                        
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(4) href="javascript:void(0);">试题管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child4 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                           		<img height=9 src="AdminStuff/img/menu_icon.gif" width=9></td>
                            <td style="text-align: left">
                            	<a class=menuchild href="ViewAllVoidTestServlet" target="right">空试题管理</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td style="text-align: left">
                            	<a class=menuchild href="ViewAllTestServlet" target=right>用户试题管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a  class=menuparent onclick=expand(5) href="javascript:void(0);">资料管理</a>
                           	</td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child5 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td>
                            	<a class=menuchild href="ViewAllResServlet" target="right">查看管理资料</a>
                           	</td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(6) href="javascript:void(0);">作业管理</a>
                           	</td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child6 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                         	</td>
                            <td style="text-align: left">
                            	<a class=menuchild href="NewWorkManage" target="right">新作业管理</a>
                           	</td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9></td>
                            <td style="text-align: left">
                            	<a class=menuchild  href="FinishWorkManage" target="right">学员作业管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(7) href="javascript:void(0);">周记管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child7 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            	<img height=9 src="AdminStuff/img/menu_icon.gif" width=9>
                            </td>
                            <td>
                            	<a class=menuchild href="ZJManage" target="right">学员周记管理</a>
                            </td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                        </tr>
                    </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=AdminStuff/img/menu_bt.jpg>
                            	<a class=menuparent onclick=expand(0) href="javascript:void(0);">通知管理</a>
                         	</td>
                        </tr>
                        <tr height=4>
                            <td></td>
                        </tr>
                    </table>
                    <table id=child0 style="display: none" cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                           		<img height=9 src="AdminStuff/img/menu_icon.gif" width=9></td>
                            <td>
                            	<a class=menuchild href="ViewAllNotifyServlet" target="right">查看管理通知</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width=1 bgcolor=#d1e6f7></td>
            </tr>
        </table>
    </body>
</html>