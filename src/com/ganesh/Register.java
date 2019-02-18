package com.ganesh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	String dbUrl = "jdbc:mysql://localhost:3306/demo1";
	String user = "root";		
	String pass = "sgn,6,9,1999@GANESH";
	Connection myConn = null;
	PreparedStatement myStmt = null;
	ResultSet myRs = null;
	String username,password;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		 try {

		        Class.forName("com.mysql.jdbc.Driver");
       	  myConn=DriverManager.getConnection(dbUrl, user, pass);
       	   myStmt=myConn.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
       	 username=req.getParameter("username");
       	 password=req.getParameter("password");
		
       	 // myStmt.setString(1, req.getParameter("phnum"));    
       	  myStmt.setString(1, req.getParameter("Fname"));
       	myStmt.setString(2, req.getParameter("Lname"));
       	myStmt.setString(3, password);
       	myStmt.setString(4, req.getParameter("email"));
       	myStmt.setInt(5, Integer.parseInt(req.getParameter("passport")));
       	myStmt.setString(6, req.getParameter("address"));
       	myStmt.setString(7, username);
       	int status=myStmt.executeUpdate();
       	if(status >0) {
       	req.setAttribute("name",username);
		req.setAttribute("pass",password);
		RequestDispatcher dispatcher=req.getRequestDispatcher("/UserDetails.jsp");
		dispatcher.forward(req, resp);//returns the reqDispatcher object that acts as wrapper around it
		//forward it to the jsp
         }
       	else {
       		System.out.println("Its not working");
       	}
		 }
         catch(Exception e)
         {System.out.println(e);}   
	}

}
