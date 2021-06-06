<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql,sql2; %>
<%! ResultSet rs; //定义结果集对象%>
<%! PreparedStatement pstmt,pstmt2;//定义SQL语句对象 %>
<%! String username,username2; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>delete</title>
</head>
<body bgcolor="#F3F3F3" background="images/success.jpg" style="background-size:100% 100%;">
<%
username=request.getParameter("username");
username2=request.getParameter("username");
try{
	Statement stmt=conn.createStatement();
	sql="delete from student where username='"+username+"'";
	stmt.execute(sql);
	Statement stmt2=conn.createStatement();
	sql2="delete from 登录 where username='"+username2+"'";
	stmt2.execute(sql);
	out.println("<font size=3 color=red>正在处理，情稍等...</font><meta http-equiv='refresh' content='2;url=manager.jsp'>");
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>
</body>
</html>