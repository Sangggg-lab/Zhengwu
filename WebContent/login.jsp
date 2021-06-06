<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql,sql2; %>
<%! ResultSet rs,rs2; //定义结果集对象%>
<%! PreparedStatement pstmt,pstmt2;//定义SQL语句对象 %>
<%! String u,p,u2,p2,rand,input;%>
<%! String user,password; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>login</title>
</head>
<body bgcolor="#F3F3F3">
<%
boolean flag = false;
boolean flag2 = false;
u = request.getParameter("username");
p = request.getParameter("password");
u2 = request.getParameter("username");
p2 = request.getParameter("password");
rand = session.getAttribute("code").toString().toLowerCase();
input = request.getParameter("code").toLowerCase();

 %>
<%
String sql = "select username from 登录 where username=? and password=?";
String sql2 = "select username from 管理员 where username=? and password=?";
try {
	   pstmt = conn.prepareStatement(sql); 
	   pstmt.setString(1,u);
	   pstmt.setString(2,p);
	   rs = pstmt.executeQuery();
	   
	   pstmt2 = conn.prepareStatement(sql2); 
	   pstmt2.setString(1,u2);
	   pstmt2.setString(2,p2);
	   rs2 = pstmt2.executeQuery();
	   
	   if(rs.next()) {
	    out.println(rs.getString("username"));
	    flag = true;
	     session.setAttribute("username",rs.getString("username"));
	   } else if(rs2.next()){
		   out.println(rs2.getString("username"));
		    flag2 = true;
		     session.setAttribute("username",rs2.getString("username"));
	   }
	   else{
	    request.setAttribute("err","用户名或密码错误!");
	   }
	  
	   rs.close();
	   pstmt.close();
	   rs2.close();
	   pstmt2.close();
	   conn.close();

	}catch (Exception e) {
		out.println(e);
	}
%>
<%
if(flag && rand.equals(input)){%>
<jsp:forward page="user.jsp" />
<%} else if(flag2 && rand.equals(input)){
	   %>
	   <jsp:forward page="manager.jsp" />
	   <% } else {
		   %>
		   <script>
		   alert("账号/密码或验证码错误，页面将在1秒内跳转登录界面")
		   </script>
		   <meta http-equiv=refresh  content="1;url = index.jsp" >	
	   <%}
%>