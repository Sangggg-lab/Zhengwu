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
		
		// ��ȡ�û���������ݺ͵�ǰʱ�䡣
		String DataText = request.getParameter("area");
		// ����õ��ı������ٴα��룬�����ȡ������ı�
		DataText = new String(DataText.getBytes("8859_1"),"utf-8");
		// ��ȡ��ǰ��ʱ��
		Calendar cal = Calendar.getInstance();
		int h = cal.get(Calendar.HOUR_OF_DAY);
		int mi = cal.get(Calendar.MINUTE);
		String Time = h+":"+mi;
		
		dbc=new DataBaseConnection();
		String sql = "insert into ���԰�(leaverdata,leavertime)values('"+DataText+"','"+Time+"')";
		
		try {
			stmt = dbc.getConnection().createStatement();
			//ִ�и�������
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//�ر����ݿ⣬�ͷ���Դ
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