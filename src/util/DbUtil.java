package util;

import java.sql.DriverManager;
import java.sql.*;

public class DbUtil {
	private String dbUrl = "jdbc:sqlserver://localhost:1433;Datebasename=SQLTest;";
	
	//��ȡ���ݿ������
		public Connection getCon()throws Exception{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//��������
			Connection con = DriverManager.getConnection(dbUrl,"sa","123456");
			return con;
		}
		//�ر����ݿ������
		public void closeCon(Connection con) throws Exception{
			if (con!=null) {
				con.close();
			}
		}
		public void name() {
			
		}
		
		//��������
		public static void main(String[] args) {
			DbUtil dbUtil=new DbUtil();
			try {
				dbUtil.getCon();
				System.out.println("���ݿ����ӳɹ���");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("���ݿ�����ʧ�ܣ�");
			}
		}
}
