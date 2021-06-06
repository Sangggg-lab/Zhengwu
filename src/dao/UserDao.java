package dao;
//dao���Ǵ������ݿ����ز�����
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.*;

import model.User;

public class UserDao {
	public User login(Connection con,User user)throws Exception {
		User resultUser=null;
		String sql="select * from ѧ�� where username=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(sql);//Ԥ����
		pstmt.setString(1, user.getUserName());//������ĵ�һ������ֵ
		pstmt.setString(2, user.getPassWord());//������ĵڶ�������ֵ
		ResultSet rs=pstmt.executeQuery();//����һ����ά�Ľ����
		if (rs.next()) {//��ѯ����
			resultUser=new User();//ʵ�����������
			//ResultSet�е�һ������getString�����Ƕ����������еĶ����������ֽ�������
			resultUser.setUserName(rs.getString("username"));
			resultUser.setPassWord(rs.getString("password"));
		}
		return resultUser;
	}
}
