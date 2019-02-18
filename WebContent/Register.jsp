<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include  file="Logo.html" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Register.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<div class="regi">
<p>Personal Information</p>
<form action="Register" method="post" class="pure-form">
<table>
       
      
      <tr><td><input type="text" name="Fname" placeholder="Enter the first name"/></td></tr>
     
      <tr><td><input type="text" name="Lname" placeholder="Enter the last name"/></td></tr>
      
      <tr><td>
       <select  name="sex">
         <option value="Male">Male</option>
         <option value="Female">Female</option>
       </select>
       </td>
      </tr>
      
       <tr><td>
      <input type="number" name="passport" placeholder="passport id"/>
      </td></tr>
      <tr><td>
      <input type="email" name="email" placeholder="enter the email"/>
      </td></tr>
      <tr><td>
      <input type="text" name="address" placeholder="enter the address"/>
      </td></tr>
     
         </table>
         <p>
         Login Detail
         </p>
         <table>
         <tr><td><input type="text" name="username" placeholder="Enter the username"/></td></tr>
         <tr><td><input type="password" placeholder="Password" name="password" id="password" required></td></tr>
        <tr><td><input type="password" placeholder="Confirm Password" id="confirm_password" required></td></tr>

        <tr><td><button type="submit" name="submit" class="pure-button pure-button-primary" >Check confirm</button></td></tr>
         
     <tr><td> 
      <input type="submit" name="Register" value="register"/>
      </td></tr>
     
     </table>
     
</form>
</div>
<script>
var password = document.getElementById("password")
  , confirm_password = document.getElementById("confirm_password");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else {
    confirm_password.setCustomValidity('');
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>

</body>
</html>