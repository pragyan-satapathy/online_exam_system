<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<center><h1>Instruction</h1></center>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	//out.print();
	String sql="delete from slogin where sid='"+request.getParameter("id")+"'";
	
	try{
	int rs=st.executeUpdate(sql);
	%><jsp:forward page="zStable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}

	st.close();
	conn.close();
	%>

				
			
		</center>
	</main>
</body>
</html>