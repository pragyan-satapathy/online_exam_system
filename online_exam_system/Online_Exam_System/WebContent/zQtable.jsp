<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
background:#FFB6C1;
}
</style>
<body>





<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	String sql="select * from question";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>
			
			
					<h1>List of QUESTIONS</h1><br>
			
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>QUESTIONS</th>
  					  <th>OPTION A</th>
  					  <th>OPTION B</th>
  					  <th>OPTION C</th>
  					  <th>OPTION D</th>
  					  <th>Correct Ans</th>
  					  <th>Update/Delete</th>
  					</tr>
	<%
			while(rs.next())
			{
			%>
				<tr>
					<td>
						<%=i %>
					</td>
					<td>
			 			<%=rs.getString("question") %>
						
					</td>
					<td>
			 			<%=rs.getString("op1") %>
						
					</td>
					<td>
			 			<%=rs.getString("op2") %>
						
					</td>
					<td>
			 			<%=rs.getString("op3") %>
						
					</td>
					<td>
			 			<%=rs.getString("op4") %>
						
					</td>
					<td>
			 			<%=rs.getString("crctans") %>
						
					</td>
					<td><a href="zQupdate.jsp?id=<%=rs.getString("op1")%>" > - UPDATE</a><br><a href="zQdelete.jsp?id=<%=rs.getString("op1")%>" > - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				
				<input type="button" name="Exit" style="white-space: normal;" value="Add Question" class="btn" onclick="window.location.href='add_question.html';"></th>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='admin_WC.html';">

			</section>
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	rs.close();
	conn.close();
	%>

				
			
		</center>
	</main>