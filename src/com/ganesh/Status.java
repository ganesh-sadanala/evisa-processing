package com.ganesh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Status extends HttpServlet
     
   {

	String dbUrl = "jdbc:mysql://localhost:3306/demo1";
	String user = "root";		
	String pass = "sgn,6,9,1999@GANESH";
	Connection myConn = null;
	PreparedStatement myStmt = null;
	PreparedStatement myStmt1;
	ResultSet myRs = null;
	Statement s=null;
	String username;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {Class.forName("com.mysql.cj.jdbc.Driver");}
	catch(Exception e) {System.out.print(e);}
	try {
		   
		myConn = DriverManager.getConnection(dbUrl, user, pass);
		String ins="insert into visausers (tocountry,status,startdate,todate,age,password) "+"values(?,?,?,?,?,?)";
		myStmt=myConn.prepareStatement(ins);
		myStmt.setString(1, req.getParameter("country"));
		if(Integer.parseInt(req.getParameter("age"))<20) {
			myStmt.setString(2,"rejected");
		}
		else
		{
			myStmt.setString(2,"approved");
		}
		myStmt.setString(3,req.getParameter("sdate"));
		myStmt.setString(4,req.getParameter("tdate"));
		myStmt.setInt(5,Integer.parseInt(req.getParameter("age")));
		myStmt.setString(6, req.getParameter("pass"));
	    int my=myStmt.executeUpdate();
	    req.setAttribute("id",req.getParameter("pass"));
	    String pass=req.getParameter("pass");
//	    myStmt1=myConn.prepareStatement("select * from customer where password=?");
//	    myStmt1.setString(1,pass);
//	    myRs=myStmt1.executeQuery();
//	    while(myRs.next()) {
//	    	username=myRs.getString("username");
//	    }
//	    req.setAttribute("user",username);
	    RequestDispatcher dispatcher=req.getRequestDispatcher("/status.jsp");
		dispatcher.forward(req, resp);//returns the reqDispatcher object that acts as wrapper around it
//		
	}
	catch(Exception e)
	{System.out.println(e);}
	
	}
}
