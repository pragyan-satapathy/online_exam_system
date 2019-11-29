<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<style>
body{
background:#FFDAB9;
}
.div1 {
  background-color: white;
    background-image: ;
  margin-left: 500px;
            margin-right: 50px;
            margin-top: 25px;
			margin-left:300px;
         
            
  
  width: 500px;
  height:400px;
  border: 10px solid blue;
  padding: 50px;
  border-radius:30px
  }
</style>
<body>

<div class="div1">
<center><h2>Welcome <%=session.getAttribute("sname")%></h2></center>
<%

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
Statement st=conn.createStatement();

String sql="select * from instruction";

ResultSet rs=st.executeQuery(sql);

out.println("<center><h3>Instructions</center></h3>");

while(rs.next())
{
out.println("<center>"+rs.getString("inst")+"</center><br/>");

}
String sql1="update counter set correct=0,attempt=0 where serialno=1";
st.executeUpdate(sql1);
out.println("<center><h3><a href='Qall.jsp'>Start</a></h3></center>");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>


</div>

</body>
</html>