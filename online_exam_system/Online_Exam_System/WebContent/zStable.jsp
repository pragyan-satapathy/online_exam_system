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
background:cyan;
}
 .btn {
  
  background-color: blue;
  border: none;
  color: white;
 border-radius: 30px;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border:2px solid black;
 
 
 
}
.btn:hover
        {
            background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
            background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
            background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);

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
	String sql="select * from slogin";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>

			
					<h1>List of Students</h1><br>
			
				<table class="table" border="1" cellpadding="5">
  					<tr>
  					  <th>Sl No.</th>
  					  <th>USER ID</th>
  					   <th>NAME</th>
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
			 			<%=rs.getString("sid") %>
						
					</td>
					<td>
			 			<%=rs.getString("sname") %>
						
					</td>
					<td><a href="zSupdate.jsp?id=<%=rs.getString("sid")%>" > - UPDATE</a><br><a href="zSdelete.jsp?id=<%=rs.getString("sid")%>" > - Delete</a></td>

				
			<%
				i++;
			}
			i=1;

			%>
				</table>
				
				<input type="button" name="Exit" style="white-space: normal;" value="Add Student" class="btn" onclick="window.location.href='add_student.html';"></th>
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