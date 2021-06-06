package db;

import java.sql.*;

public class DataBaseConnection {
	private final String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//加载驱动程序
	//定义数据库连接URL
	private final String url="jdbc:sqlserver://localhost:1433;DatabaseName=SQLTest";
	//定义数据库连接用户名
	private final String user="sa";
	//定义数据库连接密码 
	private final String pwd="123456";
	//定义数据库连接对象
	private Connection conn=null;
	
	//构造方法，加载驱动，尝试连接
	public DataBaseConnection(){
		try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(url,user,pwd);//建立数据库连接
		}catch(Exception e){
			   System.out.println("加载驱动失败"); 
		   }
	}
	
	public Connection getConnection(){  //返回连接对象
		return this.conn;
	}
	
	public void Close(){  //关闭数据库
	try{	
		this.conn.close();
	   }
	    catch(Exception e){
	    	 System.out.println("数据库连接关闭失败");
	    }
	}
}
