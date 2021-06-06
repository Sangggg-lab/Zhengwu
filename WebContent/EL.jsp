<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL表达式简介</title>
</head>
<body>
	<%
		request.setAttribute("userName", "root");
	%>
	
	JSP表达式输出userName:<%= request.getAttribute("userName") %><br />	
	JSP表达式输出password:<%= request.getAttribute("password") %><br />
	EL表达式输出userName:${userName }<br /> 
	EL表达式输出password:${password }<br />
</body>
</html>