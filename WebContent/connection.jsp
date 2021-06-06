<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "java.sql.*" %>
<%! Connection conn = null;//定义数据库连接对象 %>
 <% 
    try {  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载驱动
         try{ String url="jdbc:sqlserver://localhost:1433;DatabaseName=SQLTest";//地址+端口号，数据库名字
			  String user="sa";//登录名
			  String password="123456";//登陆密码
			  conn=DriverManager.getConnection(url,user,password);
			  out.println("连接数据库成功！");
            }
		catch(SQLException e){
			e.printStackTrace();
		    out.print("SQL Server连接失败！");}         
        }
    	catch(Exception e){
    	 	e.printStackTrace();
  	    	out.println("加载驱动失败！");}   
%>