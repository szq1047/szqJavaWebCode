<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.hibtest3.entity.CustomerInfo" %>
<%@ page import="com.hibtest3.entity.RoomInfo" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    CustomerInfo customerInfo = (CustomerInfo) request.getAttribute("customer");
    List<RoomInfo> roomList = (List<RoomInfo>) request.getAttribute("roomlist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>客人入住</title>
    <link rel="stylesheet" type="text/css" href="CSS/myCss.css"/>
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
    <script src="javascript/prototype.js" type="text/javascript"></script>
    <script src="javascript/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        function jsonClick(obj) {
            var url = "/HibTest3/myjson/SZQJson?Rno=" + obj;
            if(window.XMLHttpRequest) {
                //IE7, Firefox, Opera支持
                req = new XMLHttpRequest();
            }else if(window.ActiveXObject) {
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
            if(req.readyState == 4 && req.status == 200) {
                var check = req.responseText;
                show (check);
            }
        }

        function show(str) {
            var rstyle = document.getElementById('rstyle');
            var rprice = document.getElementById('rprice');
            var lens=str.length;
            var str1=str.substring(2,lens-5);
            var str2=str1.split(',');
            for(var i=0;i<str2.length;i++){
                var obj=str2[i].split(':');
                if(obj[0]=='"rstyle"'){
                    rstyle.value=obj[1];
                }else if(obj[0]=='"rprice"'){
                    rprice.value=obj[1];
                }

            }
        }
        function getToday() {
            var tfromDate = document.getElementById("tfromDate");
            var date = new Date();
            var dateFormat = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            tfromDate.value = dateFormat;
        }
        function GetDateNow() {
            var tday = document.getElementById("tday").value;
            var tleftDate = document.getElementById("tleftDate");
            var date = new Date();
            var day = parseInt(tday);
            if (/^\d+$/.test(day)) {//js判断是否为数字
                date.setDate(date.getDate() + day);
                tleftDate.value = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
            } else {
                alert("请输入整数！");
            }


        }
        function getMoney() {
            var tday = document.getElementById("tday").value;
            var rprice = document.getElementById("rprice").value;
            tday = parseInt(tday);
            rprice = parseInt(rprice);
            var tmoney = document.getElementById("tmoney");
            //alert(rprice*tday);
            tmoney.value = rprice * tday.toString();
        }
    </script>
</head>
<body>
<form method="post" action="/HibTest3/living/addCustomerLiving">
    <div class="main">
        <table class="style2">

            <tr>
                <td colspan="2"><input type="hidden" name="customerInfos.Cno"
                                       value="<%=customerInfo.getCno()%>"></td>
            </tr>
            <tr>
                <td>客户姓名</td>
                <td><input type="text" name="customerInfos.Cname"
                           value="<%=customerInfo.getCname()%>"
                           readonly="readonly"></td>
            </tr>

            <tr>
                <td>房间号</td>
                <td><select class="selectStyle" name="roomInfos.Rno" id="rno"
                            onchange="jsonClick(this.options[this.options.selectedIndex].value)">
                    <%for(int i=0;i<roomList.size();i++){
                        RoomInfo roomInfo=roomList.get(i);
                    %>
                        <option value="<%=roomInfo.getRno()%>"><%=roomInfo.getRno()%></option>
                    <%}%>
                </select></td>
            </tr>

            <tr>
                <td>房间类型</td>
                <td><input type="text" name="roomInfos.Rstyle" id="rstyle"
                           readonly="readonly"></td>
            </tr>
            <tr>
                <td>房间价格</td>
                <td><input type="text" name="roomInfos.Rprice" id="rprice"
                           readonly="readonly"></td>
            </tr>

            <tr>
                <td>入住日期</td>
                <td><input type="text" name="customerLivingInfos.TenrollDate" id="tfromDate"
                           onclick="getToday()"></td>
            </tr>
            <tr>
                <td>入住天数</td>
                <td><input type="text" name="tday" id="tday"
                           onblur="getMoney()"></td>
            </tr>
            <tr>
                <td>退房日期</td>
                <td><input type="text" name="customerLivingInfos.TleftDate" id="tleftDate"
                           onclick="GetDateNow()"></td>
            </tr>
            <tr>
                <td>金额</td>
                <td><input type="text" name="customerLivingInfos.Tmoney" id="tmoney"></td>
            </tr>
            <tr>
                <td>押金</td>
                <td><input type="text" name="customerLivingInfos.Tdeposit" value="100"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="开房"/></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>