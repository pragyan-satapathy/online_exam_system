<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	String inst=request.getParameter("inst");
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	String oldinstr= (String) session.getAttribute("oldinstr");
	


	
	String sql="update instruction set inst='"+inst+"' where inst='"+oldinstr+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zItable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	</main>
</body>
</html>