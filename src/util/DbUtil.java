package util;

import java.sql.DriverManager;
import java.sql.*;

public class DbUtil {
	private String dbUrl = "jdbc:sqlserver://localhost:1433;Datebasename=SQLTest;";
	
	//获取数据库的连接
		public Connection getCon()throws Exception{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载驱动
			Connection con = DriverManager.getConnection(dbUrl,"sa","123456");
			return con;
		}
		//关闭数据库的连接
		public void closeCon(Connection con) throws Exception{
			if (con!=null) {
				con.close();
			}
		}
		public void name() {
			
		}
		
		//测试连接
		public static void main(String[] args) {
			DbUtil dbUtil=new DbUtil();
			try {
				dbUtil.getCon();
				System.out.println("数据库连接成功！");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("数据库连接失败！");
			}
		}
}
