<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% response.setContentType("text/html;charset=utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
	div{
		margin:0;	
	}
	#content {
		background:#F1F3F4;
		width:890px;
		height:280px;
		margin:5px auto;
		padding:10px;
	}
	#submit{
		margin:0 0 0 810px;
		width:70px;
		height:30px;
	}
	#area{
		margin:5px;
		font-size:25px;
		resize:none;
	}
	#next_text {
		background:#F1F3FF;
		width:890px;
		height:180px;
		margin:10px auto;
		padding:10px;
	}
	.text{
		width:880px;
		height:150px;
	}
	.time{
		margin:10px 5px 15px 20px;
	}
	#delete:hover {
		color:#f00;
	}
</style>
<title>message board</title>
</head>
<body>
	<h1>message board留言板：</h1>
	<div id="content">
		<form  method="post" action="SaveContent">
			<b><tr>留言内容：</tr></b>
			<br />
			<textarea rows="7" cols="66" id="area" name="area"></textarea>
			<br />
			<input type="submit" id="submit" value="提交">
		</form>
	</div>
<% 
		Connection conn = null;
		Statement stmt = null;
		ResultSet re = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=SQLTest";
		String user = "sa";
		String password = "123456";
		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			
			String sql = "select * from 留言板 where id>0 order by id desc";
			re = stmt.executeQuery(sql);
			while(re.next()) {
%>
	<div id="next_text">
		<div class="text"><% out.println(re.getString("leaverdata")); %></div>
		<span> <a href="message board delete.jsp?id=<%=re.getString("id")%>" onclick="return confirm('确定要删除吗？')">删除</a></span>
		<span class="time"><% out.println(re.getString("leavertime")); %></span>
	</div>
<% 
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//关闭数据库，释放资源
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(re!=null) {
				try {
					re.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
%>
<a href="javascript:scroll(0,50)">返回顶部</a>
</body>
</html>