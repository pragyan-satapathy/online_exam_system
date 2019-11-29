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
	<%! String olda=null; %>
	<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "lit");
	Statement st=conn.createStatement();
	//out.print();
	
	int serialno=0;
	String  question=null;
	String  op1=null;
	String  op2=null;
	String  op3=null;
	String  op4=null;
	String crctans=null;
	
	
	
	olda=request.getParameter("id");
	session.setAttribute("olda", olda);
	
	String sql="select * from question where op1='"+olda+"'";
	ResultSet rs=st.executeQuery(sql);
	while(rs.next())
	{

	 question=rs.getString("question");
	 op1=rs.getString("op1");
	 op2=rs.getString("op2");
	 op3=rs.getString("op3");
	 op4=rs.getString("op4");
	 crctans=rs.getString("crctans");
	}
	
	
	
	%>
	
	
	<form  method="post">

<pre>

             <h1>Update Question</h1>
        
   Question :<input type="text" name="question" value="<%= question%>"><br>
    Option a:<input type="text" name="op1" value="<%= op1%>"><br> 
    Option b:<input type="text" name="op2" value="<%= op2%>"><br> 
    Option c:<input type="text" name="op3" value="<%= op3%>"><br> 
    Option d:<input type="text" name="op4" value="<%= op4%>"><br> 
    Answer(Option)  :<input type="text" name="crctans" value="<%= crctans%>"><br> 

     <input type="submit" formaction="zQupdate2.jsp" value="Done" />
     
      <input type="submit" formaction="zQupdate.jsp" value="clear" />
    </form>


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