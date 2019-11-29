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
	
	
	String question=request.getParameter("question");
	String op1=request.getParameter("op1");
	String op2=request.getParameter("op2");
	String op3=request.getParameter("op3");
	String op4=request.getParameter("op4");
	String crctans=request.getParameter("crctans");
	
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	String olda= (String) session.getAttribute("olda");
	


	
	String sql="update question set question='"+question+"',op1='"+op1+"',op2='"+op2+"',op3='"+op3+"',op4='"+op4+"',crctans='"+crctans+"' where op1='"+olda+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zQtable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	
</body>
</html>