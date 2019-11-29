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

</style>
<body>


<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	//out.print();
	
	int sln=0;
	String sid=null;
	String sname=null;
	String spword=null;
	
	
	
	s=request.getParameter("id");
	session.setAttribute("olduid", s);
	
	String sql="select * from slogin where sid='"+s+"'";
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{
		sln=rs.getInt("sl");
	 sid=rs.getString("sid");
	 sname=rs.getString("sname");
	 spword=rs.getString("spword");
	}
	
	session.setAttribute("sln", sln);
	
	%>
	
	
	<form  method="post">

<pre>

             <center><h1>Update Student Page</h1></center>
        
     <center>User ID :<input type="text" name="sid"  value="<%= sid%>"></center>
     <center>Name      :<input type="text" name="sname" value="<%= sname%>" ></center>
     <center>Password  :<input type="password" name="spword" value="<%= spword%>"></center> 

     <center><input type="submit" formaction="zSupdate2.jsp" value="Done" /></center>
     
  
     
    
    </form>
  <center><h2><a href="admin_WC.html" id="back">BACK</a></h2></center>

</pre>
	

	
	<%
		}

	catch(Exception e)
	{
out.print(e);
	}


	%>

				
			
		</center>
	</main>
	
</body>
</html>