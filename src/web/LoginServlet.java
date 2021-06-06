package web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

import dao.UserDao;
import model.User;
import util.DbUtil;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbUtil dbUtil=new DbUtil();   
    UserDao userDao=new UserDao();
	public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userName=request.getParameter("username");
		String passWord=request.getParameter("password");
		Connection con = null;
		try {
			User user = new User(userName, passWord);
			con = dbUtil.getCon();
			User currentUser=userDao.login(con, user);
			if (currentUser==null) {
				System.out.println("µÇÂ¼Ê§°Ü");
			}else{
				System.out.println("µÇÂ¼³É¹¦");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {//¹Ø±ÕÊý¾Ý¿â
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}