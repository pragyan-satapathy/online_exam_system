<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
    
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
<center><h2>Thank You & Exit</h2></center>
	<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="lit"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from counter	
	</sql:query>
	<center><h2>Results</h2></center>
	<table border="2" width="100%">
		<tr>
			<th>No. of Ques Attempted</th>
			<th>No. of Correct Answers</th>
			<th>Total Marks Obtained</th>
		
			
		
		</tr>
		<c:forEach var="table" items="${rs.rows }">
			<tr>
				<td><c:out value="${table.attempt }"></c:out>    </td>
				<td><c:out value="${table.correct }"></c:out>    </td>
				<td><c:out value="${table.correct }"></c:out>    </td>
		
			</tr>
		</c:forEach>
	</table>
	<center><h1><a href="index.html">EXIT</a></h1></center>
	
</body>
</html>
