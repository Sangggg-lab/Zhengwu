<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql; %>
<%! ResultSet rs; //定义结果集对象%>
<%! PreparedStatement pstmt;//定义SQL语句对象 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>query</title>
</head>
<body bgcolor="#F3F3F3" background="images/success.jpg" style="background-size:100% 100%;">
<%! String username,password; %>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
username=request.getParameter("username");
password=request.getParameter("password");
%>
<%
try{
	sql="update 登录 set password=? where username="+username+"";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,password);
	pstmt.executeUpdate();
	out.println("<font size=6 color=red>正在处理，请稍等...</font> ");
	%>
	<jsp:forward page="user.jsp" />
	<% 
	pstmt.close();
	conn.close();		
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>
</body>
</html>