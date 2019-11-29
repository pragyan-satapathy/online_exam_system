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



<center><h1>Instruction</h1></center>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	String sql="select * from instruction";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>
			
			
					<h1>List of Instructions</h1><br>
			
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>Instructions</th>
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
			 			<%=rs.getString("inst") %>
						
					</td>
					<td><a href="zIupdate.jsp?id=<%=rs.getString("inst")%>" > - Update</a><br><a href="zIdelete.jsp?id=<%=rs.getString("inst")%>" > - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				
				<input type="button" name="Exit" style="white-space: normal;" value="Add Instruction" class="btn" onclick="window.location.href='add_inst.html';"></th>
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