

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add_question")
public class add_question extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public add_question() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		String question = request.getParameter("question");
		String op1 = request.getParameter("op1");
		String op2 = request.getParameter("op2");
		String op3 = request.getParameter("op3");
		String op4 = request.getParameter("op4");
		String answer =request.getParameter("answer"); 
		int count=1;
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
			
			String sql1="select * from question";
			Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery(sql1);
			while(rs.next())
			{
				count++;
			}
			
			String sql="insert into question values(?,?,?,?,?,?,?)"; 
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setInt(1, count);
			pst.setString(2, question); 
			pst.setString(3, op1); 
			pst.setString(4, op2); 
			pst.setString(5, op3); 
			pst.setString(6, op4); 
			pst.setString(7, answer);
			
			int a=pst.executeUpdate(); 
			out.print("<center><h3>Question Added</h3></center>");
			response.sendRedirect("zQtable.jsp");
			System.out.println(a);
		} 
		
		catch (Exception e) 
		{
			e.printStackTrace();
			out.print("error");
		}
		
	}

}
