<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hibtest3.entity.RoomInfo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    //System.out.println("heeloo  我到roomManage.jsp页面了");
    List<RoomInfo> roomInfoList = (List<RoomInfo>) request.getAttribute("roomList");
    int pagesCount=Integer.parseInt(request.getAttribute("pageCount").toString());
    System.out.println("pagesCount========"+pagesCount);
    //System.out.println("roomAAA====="+roomInfoList);
    //List<RoomInfo> romInfoBySelect=(List<RoomInfo>)request.getAttribute("selectRoomInfo");
    //String message=request.getAttribute("message").toString();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="CSS/myCss.css"/>
    <style type="text/css">
        .style1 {
            margin-top: 0px;;
            padding: 0px;
        }

        .style2 td {
            width: 150px;
            text-align: center;
            border-style: solid;
            border-width: 1px;
            border-color: gray;
        }
    </style>
    <script type="text/javascript">
        function Studelete(rno) {
            msg = "是否删除？";
            if (window.confirm(msg)) {
                window.location = "deleteRoomInfo?Rno=" + rno;
            }
        }
    </script>
</head>
<body>
<div class="main">
    <table>
        <tr>
            <td><a href="/HibTest3/addRoom.jsp">添加客房</a></td>
            <!-- <td>
                <form method="post" action="selectRoomInfo.do">
                <table style="margin-left: 100px">
                <tr>
                <td>房间类型：</td>
                <td>
                <select name="rstyle">
                    <option value="1">单人间</option>
                    <option value="2">双人间</option>
                    <option value="3">豪华单人间</option>
                    <option value="4">豪华双人间</option>
                    <option value="5">标准间</option>
                </select></td>
                <td >房间状态：</td>
                <td><select name="rstate"><option value="1">占用</option><option value="2">未占用</option></select></td>
                <td><input type="submit" value="查询"></td>
                </tr>
                </table>
                </form>
            </td> -->
        </tr>
        <tr>
            <table class="style2">
                <tr>
                    <td>房间编号</td>
                    <td>房间类型</td>
                    <td>房间价格</td>
                    <td>房间状态</td>
                    <td>房内电话号码</td>
                    <td>操作</td>
                </tr>
                <%if (roomInfoList.equals("") || roomInfoList == null) {%>
                <tr align="center">
                    <td colspan="6">暂无数据</td>
                </tr>
                <%
                } else {
                    for (int i = 0; i < roomInfoList.size(); i++) {
                        RoomInfo roomInfo = roomInfoList.get(i);
                %>
                <tr align="center">
                    <td><%=roomInfo.getRno()%>
                    </td>
                    <td><%=roomInfo.getRstyle()%>
                    </td>
                    <td><%=roomInfo.getRprice()%>
                    </td>
                    <td><%=roomInfo.getRstate()%>
                    </td>
                    <td><%=roomInfo.getRtel()%>
                    </td>
                    <td><a href="getRoomInfoByRno?Rno=<%=roomInfo.getRno()%>">修改</a> <a href="#"
                                                                                                     onclick="Studelete(<%=roomInfo.getRno()%>);">删除</a>
                    </td>
                </tr>
                <%
                        }
                    }%>
            </table>
        </tr>
    </table>
    <p/>
   <%-- <s:iterator id="page" value="pagesCount">
        <a href="/HibTest3/room/getListRoom?currentPage=<s:property value="#page"/>">
            <s:property value="#page"/>
        </a>&nbsp;&nbsp;
    </s:iterator>--%>
    <%for(int i=1;i<=pagesCount;i++){%>
        <a href="/HibTest3/room/getListRoom?currentPage=<%=i%>">
            <%=i%>
        </a>&nbsp;&nbsp;
   <%}%>
</div>
</body>
</html>