package save;

import java.io.IOException;
import java.sql.*;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DataBaseConnection;
/**
 * Servlet implementation class SaveContent
 */
@WebServlet("/SaveContent")
public class SaveContent extends HttpServlet {
	DataBaseConnection dbc=null;
	Statement stmt = null;
	ResultSet re = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveContent() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		// 获取用户输入的内容和当前时间。
		String DataText = request.getParameter("area");
		// 将获得的文本进行再次编码，以免获取乱码的文本
		DataText = new String(DataText.getBytes("8859_1"),"utf-8");
		// 获取当前的时分
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR_OF_DAY);
		int mi = cal.get(Calendar.MINUTE);
		String Time = h+":"+mi;
		
		dbc=new DataBaseConnection();
		String sql = "insert into 留言板(leaverdata,leavertime)values('"+DataText+"','"+Time+"')";
		
		try {
			stmt = dbc.getConnection().createStatement();
			//执行跟新命令
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//关闭数据库，释放资源
			if(dbc!=null) {
				try {
					dbc.Close();
				} catch (Exception e) {
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
		response.sendRedirect("message board.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}