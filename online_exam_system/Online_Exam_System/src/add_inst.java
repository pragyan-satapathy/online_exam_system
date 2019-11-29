

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/add_inst")
public class add_inst extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public add_inst() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		int inst_no =Integer.parseInt(request.getParameter("inst_no")); 
		String inst = request.getParameter("inst");
		
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			
			String sql="insert into instruction values(?,?)"; 
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, inst_no); 
			pst.setString(2, inst); 
			
			pst.executeUpdate();
			out.print("Instruction added successfully");
			response.sendRedirect("zItable.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			out.print("error");
		}
	}

}
