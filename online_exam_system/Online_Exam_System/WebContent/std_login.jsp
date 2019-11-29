<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.sql.*,java.io.*" %>
<%





String sid = request.getParameter("sid");
String spword = request.getParameter("spword");
String sname=null;
try {
	
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
	
	
	String sql = "select * from slogin";
	PreparedStatement pst=con.prepareStatement(sql);
	 
			//pst.setString(1,sid);
			ResultSet rs=pst.executeQuery();
			
		while(rs.next())
		{
		String a=rs.getString(2);
		String b=rs.getString(3);
		
		sname=rs.getString("sname");
		session.setAttribute("sname",sname);
		
		if(a.equals(sid) &&  b.equals(spword))
		{
			out.println("login succesful");	

					response.sendRedirect("instruction.jsp");
		}
		else 
		{
			out.print("<center><h2>Wrong Username or Password</h2></center>");
			out.print("<br><center><a href='std_login.html'>CLICK HERE TO GO LOGIN PAGE</a></center>");
			break;
		}			
	}		
}
catch (Exception e) {
	e.printStackTrace();
	
	 out.print("Enter Username and password correctly");
	 out.print("Username and password cann't be blank");
	 out.print("<br><a href='index.html'>CLICK HERE TO GO HOME PAGE</a>");
}
%>
</body>
</html>

