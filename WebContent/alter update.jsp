<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%! String sql; %>
<%! ResultSet rs; //定义结果集对象%>
<%! Statement stmt;//定义SQL语句对象 %>
<%! PreparedStatement pstmt;//定义SQL语句对象 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>query</title>
</head>
<body bgcolor="#F3F3F3" background="images/success.jpg" style="background-size:100% 100%;">
<%! String username,name,sex,age,jiguan,zhuanye,banji,minzu; %>
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

try{
	sql="update student set name=?,sex=?,age=?,jiguan=?,zhuanye=?,banji=?,minzu=? where username="+username+"";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,sex);
	pstmt.setString(3,age);
	pstmt.setString(4,jiguan);
	pstmt.setString(5,zhuanye);
	pstmt.setString(6,banji);
	pstmt.setString(7,minzu);
	pstmt.executeUpdate();
	out.println("<font size=4 color=red>正在处理，请稍等...</font><meta http-equiv='refresh' content='2;url=manager.jsp'>");
	pstmt.close();
	conn.close();	
}
catch(Exception e){
	response.sendRedirect("err.jsp");
}
%>
</body>
</html>
