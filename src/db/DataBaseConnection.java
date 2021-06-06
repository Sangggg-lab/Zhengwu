package db;

import java.sql.*;

public class DataBaseConnection {
	private final String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";//������������
	//�������ݿ�����URL
	private final String url="jdbc:sqlserver://localhost:1433;DatabaseName=SQLTest";
	//�������ݿ������û���
	private final String user="sa";
	//�������ݿ��������� 
	private final String pwd="123456";
	//�������ݿ����Ӷ���
	private Connection conn=null;
	
	//���췽����������������������
	public DataBaseConnection(){
		try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(url,user,pwd);//�������ݿ�����
		}catch(Exception e){
			   System.out.println("��������ʧ��"); 
		   }
	}
	
	public Connection getConnection(){  //�������Ӷ���
		return this.conn;
	}
	
	public void Close(){  //�ر����ݿ�
	try{	
		this.conn.close();
	   }
	    catch(Exception e){
	    	 System.out.println("���ݿ����ӹر�ʧ��");
	    }
	}
}
