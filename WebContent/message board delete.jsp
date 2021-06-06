<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="connection.jsp" %>
<%@ page import="java.sql.*" %>
<%! String sql,id;%>
<%! ResultSet rs; //定义结果集对象%>
<%! PreparedStatement pstmt;//定义SQL语句对象 %>
<!DOCTYPE html>

<html>
<head>
<title>message board delete</title>
</head>
<body bgcolor="#F3F3F3" background="images/success.jpg" style="background-size:100% 100%;">
<%
id=request.getParameter("id");
try{
	Statement stmt=conn.createStatement();
	sql="delete from 留言板 where id='"+id+"'";
	stmt.execute(sql);
	out.println("<font size=3 color=red>正在处理，情稍等...</font><meta http-equiv='refresh' content='2;url=message board.jsp'>");
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>

</html>