<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
background-image:url("https://images.wallpaperscraft.com/image/flight_plane_sky_color_line_61872_1920x1080.jpg");
}
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String driverName = "com.mysql.cj.jdbc.Driver";
String dbUrl = "jdbc:mysql://localhost:3306/demo1";
String user = "root";		
String pass = "sgn,6,9,1999@GANESH";
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>

<%
Connection myConn = null;
PreparedStatement stmt=null;
ResultSet myRs = null;



try {
Class.forName(driverName);
myConn = DriverManager.getConnection(dbUrl, user, pass);
stmt=myConn.prepareStatement("select * from customer where username=? and password=?");
stmt.setString(1,request.getAttribute("name").toString());//sql injection avoiding
stmt.setString(2,request.getAttribute("pass").toString());
myRs=stmt.executeQuery();
while(myRs.next()){
%>
<table id="customers">
<tr>
<th>User</th>
<th>Detail</th>
</tr>
<tr>
<td>UserName</td>
<td><%=myRs.getString("username") %></td></tr>
<tr>
<td>FirstName</td>
<td><%=myRs.getString("firstname") %></td></tr>
<tr>
<td>LastName</td>
<td><%=myRs.getString("lastname") %></td></tr>
<tr>
<td>Email</td>
<td><%=myRs.getString("email") %></td></tr>
<tr>
<td>Address</td>
<td><%=myRs.getString("address") %></td></tr>

<tr>
<td>Passport</td>
<td><%=myRs.getString("passport") %></td></tr>

</table>
<% 
}
myConn.close();
}
catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
%>
<form action="ApplyVisa.jsp" method="post">
<% session.setAttribute("pword",request.getAttribute("pass")); %>
<input type="submit" value="ApplyVisa"/><br/>
</form>
<a href="Status.jsp">Status</a>
</body>
</html>


