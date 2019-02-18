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

public class LoginRegister extends HttpServlet{

	String dbUrl = "jdbc:mysql://localhost:3306/demo1";
	String user = "root";		
	String pass = "sgn,6,9,1999@GANESH";
	Connection myConn = null;
	PreparedStatement myStmt = null;
	ResultSet myRs = null;
	String username,password;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try { Class.forName("com.mysql.jdbc.Driver");
      	  myConn=DriverManager.getConnection(dbUrl, user, pass);
      	 myStmt=myConn.prepareStatement("select * from customer where username=? and password=?");
      	 username=req.getParameter("name");
       password=req.getParameter("password");
		
      	 // myStmt.setString(1, req.getParameter("phnum"));    
      	  myStmt.setString(1, username);
      	myStmt.setString(2, password);
      	myRs=myStmt.executeQuery();
      	if(myRs.next()) {
      req.setAttribute("user",username);
		req.setAttribute("id",password);
		RequestDispatcher dispatcher=req.getRequestDispatcher("/status.jsp");
		dispatcher.forward(req, resp);//returns the reqDispatcher object that acts as wrapper around it
		
}
      	else{
      		resp.getWriter().println("Invalid username or password or register");
      		
      	}}
	catch(Exception e) {
		System.out.println(e);
	}}}
