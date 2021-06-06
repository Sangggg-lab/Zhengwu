package dao;
//dao类是处理数据库的相关操作的
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.*;

import model.User;

public class UserDao {
	public User login(Connection con,User user)throws Exception {
		User resultUser=null;
		String sql="select * from 学生 where username=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(sql);//预编译
		pstmt.setString(1, user.getUserName());//向上面的第一个坑填值
		pstmt.setString(2, user.getPassWord());//向上面的第二个坑填值
		ResultSet rs=pstmt.executeQuery();//返回一个二维的结果集
		if (rs.next()) {//查询数据
			resultUser=new User();//实例化这个对象
			//ResultSet中的一个方法getString方法是对这个结果集中的东西按照名字进行搜索
			resultUser.setUserName(rs.getString("username"));
			resultUser.setPassWord(rs.getString("password"));
		}
		return resultUser;
	}
}
