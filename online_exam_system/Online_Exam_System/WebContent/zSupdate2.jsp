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
	
	
	

	
	

	String sid=request.getParameter("sid");
	String sname=request.getParameter("sname");
	String spword=request.getParameter("spword");
	int sln=(Integer) session.getAttribute("sln");
	
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	String olduid= (String) session.getAttribute("olduid");
	


	
	String sql="update slogin set sl='"+sln+"',sid='"+sid+"',sname='"+sname+"',spword='"+spword+"' where sid='"+olduid+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zStable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	
</body>
</html>