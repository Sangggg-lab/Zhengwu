<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql,sql2; %>
<%! ResultSet rs; //定义结果集对象%>
<%! PreparedStatement pstmt,pstmt2;//定义SQL语句对象 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>query</title>
</head>
<body bgcolor="#F3F3F3" background="images/success.jpg" style="background-size:100% 100%;">
<%! String username,name,sex,age,jiguan,zhuanye,banji,minzu,password,username2; %>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
username=request.getParameter("username");
name=request.getParameter("name");
sex=request.getParameter("sex"); 
age=request.getParameter("age"); 
jiguan=request.getParameter("jiguan"); 
zhuanye=request.getParameter("zhuanye");
banji=request.getParameter("banji"); 
minzu=request.getParameter("minzu"); 
password=request.getParameter("password"); 
username2=request.getParameter("username");
try{
	sql="insert into student (username,name,sex,age,jiguan,zhuanye,banji,minzu) values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,username);
	pstmt.setString(2,name);
	pstmt.setString(3,sex);
	pstmt.setString(4,age);
	pstmt.setString(5,jiguan);
	pstmt.setString(6,zhuanye);
	pstmt.setString(7,banji);
	pstmt.setString(8,minzu);
	pstmt.executeUpdate();
	sql2="insert into 登录 (username,password) values(?,?)";
	pstmt2=conn.prepareStatement(sql2);
	pstmt2.setString(1,username2);
	pstmt2.setString(2,password);
	pstmt2.executeUpdate();
	out.println("<font size=4 color=red>正在处理，请稍等...</font><meta http-equiv='refresh' content='2;url=manager.jsp'>");
	pstmt2.close();
	pstmt.close();
	conn.close();		
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>
</body>
</html>