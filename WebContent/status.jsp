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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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


<table id="customers"><tr>
<th>Visaid   </th>
<th>To Country   </th>
<th>Start Date  </th>
<th>To Date</th>
<th>Age</th>
<th>Status</th>
</tr>
<%
Connection myConn = null;
PreparedStatement myStmt = null;
ResultSet myRs = null;
try {
Class.forName(driverName);
myConn = DriverManager.getConnection(dbUrl, user, pass);

myStmt=myConn.prepareStatement("select * from visausers where password=?");
myStmt.setString(1,request.getAttribute("id").toString());
myRs=myStmt.executeQuery();
while(myRs.next()){
%>

<tr>
<td><%= myRs.getString("visaid")%></td>
<td><%= myRs.getString("tocountry")%></td>
<td><%=myRs.getString("startdate")%></td>
<td><%=myRs.getString("todate")%></td>
<td><%=myRs.getString("age")%></td>
<td><%=myRs.getString("status")%></td>
</tr>
<% 
}
myConn.close();
}
catch (ClassNotFoundException e) {
    e.printStackTrace();
  }
%>

</table>
</body>
</html>