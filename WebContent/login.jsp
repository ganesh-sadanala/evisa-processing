<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="LoginRegister.css">
<meta charset="ISO-8859-1">

<title>Insert title here</title>
<style type="text/css">
  body{
background-image:url("http://www.netherlands-tourism.com/wp-content/uploads/2013/12/Travel_on_Inspiration_New_Logo_copy.png");}
</style>
</head>
<body >
<div class="form">
<form action="Login" method="post" class="login-form">
       
      <table ><tr><td><input type="text" name="name" placeholder="Enter the username"/></td></tr>
      <tr><td><input type="password" name="password" placeholder="Enter the password"/></td></tr>
      <tr><td>
     <input type="submit"  name="Submit" value="login"/>
      </td>
      </tr>
      
      <!-- <a href="visaBook.jsp"><button>Log-In</button></a> -->
   <tr><td> <p class="message">Not registered? <a href="Register.jsp">Create an account</a></p></td></tr>
      
      
      </table>
      </form>
      </div>
</body>
</html>				