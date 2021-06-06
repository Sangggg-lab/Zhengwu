<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%@ include file="search2.jsp" %>
<%! String sql; %>
<%! ResultSet rs; //定义结果集对象%>
<%! Statement stmt;//定义SQL语句对象 %>
<%! PreparedStatement pstmt;//定义SQL语句对象 %>
<%! int i; %>
<%! String id; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
#home {position:absolute;top:10px;right:10px;}
#home img{width:30px;height:30px;padding-right:10px;}
</style>
</head>
<body bgcolor="#F3F3F3" background="images/manager.jpg" style="background-size:100% 100%;">
<div align="center"><font color="#31708F" size="5">便民电话/邮箱</font>
</div>
<br/>
<br/>
<div id="home">
<img src="images/home.png"  alt="返回主页"  onclick="javascript:location.href='index.jsp'"/>
<img src="images/back.png"  alt="返回上一页"  onclick="javascript:history.back(-1);"/>
</div>
<table  align="center" width="50%" border="1" cellspacing="0" cellpadding="0" style= "opacity: 0.9;">
<tr bgcolor=#F3F3F3>
  <td width=8% align="center">编号</td>
  <td width=12% align="center">姓名</td>
  <td width=8% align="center">性别</td>
  <td width=15% align="center">单位</td>
  <td width=15% align="center">电话</td>
  <td width=15% align="center">邮箱</td>
</tr>
<%

try
{
	stmt=conn.createStatement();
    sql="select *from 通讯信息";
    rs= stmt.executeQuery(sql);
while(rs.next()){
%>
<tr bgcolor=#FFFFFF>
  <td width=10% align="center"><%=rs.getObject(1)%></td>
  <td width=10% align="center"><%=rs.getObject(2)%></td>
  <td width=10% align="center"><%=rs.getObject(3)%></td>
  <td width=10% align="center"><%=rs.getObject(4)%></td>
  <td width=10% align="center"><%=rs.getObject(5)%></td>
  <td width=10% align="center"><%=rs.getObject(6)%></td>
</tr>
<%
}
rs.close();
stmt.close();
conn.close();
}catch(Exception e)
{
	response.sendRedirect("err.jsp");
}

%>
</table>
<div style='display:none;'><a href='https://www.live800.com'>在线客服</a></div><script language="javascript" src="https://chat56.live800.com/live800/chatClient/floatButton.js?jid=1118674344&companyID=1474201&configID=567453&codeType=custom&ss=1"></script><div style='display:none;'><a href='https://en.live800.com'>live chat</a></div>
<script language="javascript" src="https://chat56.live800.com/live800/chatClient/monitor.js?jid=1118674344&companyID=1474201&configID=567451&codeType=custom&ss=1"></script>
<a href="javascript:scroll(0,0)">返回顶部</a>
</body>
</html>