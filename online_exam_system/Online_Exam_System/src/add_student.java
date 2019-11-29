

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add_student")
public class add_student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public add_student() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		int sl =Integer.parseInt(request.getParameter("sl")); 
		String sid = request.getParameter("sid");
		String sname = request.getParameter("sname");
		String spass = request.getParameter("spass");
		
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			
			String sql="insert into slogin values(?,?,?,?)"; 
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, sl); 
			pst.setString(2, sid); 
			pst.setString(3, spass); 
			pst.setString(4, sname); 
			
			pst.executeUpdate();
			out.print("Student added successfully");
			response.sendRedirect("zStable.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			out.print("error");
		}
	}

}
