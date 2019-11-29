import java.io.*;

import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public admin_login() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String aid = request.getParameter("aid");
		String apword = request.getParameter("apword");
		
		try {
			
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			
			
			String sql = "select * from alogin";
			PreparedStatement pst=con.prepareStatement(sql);
			 
					//pst.setString(1,aid);
					ResultSet rs=pst.executeQuery();
					
				while(rs.next())
				{
				String a=rs.getString(2);
				String b=rs.getString(3);
				if(a.equals(aid) &&  b.equals(apword))
				{
					out.println("<center><h3>Login Succesful</h3></center>");	
					out.print("<br><center><a href='admin_WC.html'>CLICK HERE TO GO TO ADMIN'S WELCOME PAGE</a><center>");
				    response.sendRedirect("admin_WC.html");
				}
				else
				{
					out.print("<center><h3>Wrong Id or Password</h3></center>");
					out.print("<br><center><a href='admin_login.html'>CLICK HERE TO GO TO LOGIN PAGE</a><center>");
					break;
				}			
			}		
		}
		catch (Exception e) {
			e.printStackTrace();
			
			 out.print("Enter Username and password correctly");
			 out.print("Username and password cann't be blank");
			 out.print("<br><a href='index.html'>CLICK HERE TO GO TO HOME PAGE</a>");
		}
		
	}

}
