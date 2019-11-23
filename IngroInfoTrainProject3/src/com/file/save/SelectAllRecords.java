package com.file.save;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.ResultSet;
  
public class SelectAllRecords{
 
 static String driverName = "com.mysql.jdbc.Driver";
 static String url = "jdbc:mysql://localhost:3306/trainprojectversion2";

 static String userName = "hbstudent";
 static String password = "hbstudent";
	
 public static void main(String[] args){

	Connection con=null;
	Statement stmt=null;
	try{
		Class.forName(driverName).newInstance();
		con = DriverManager.getConnection(url, userName, password);
		System.out.println("connection suceed..");
		try{
		   stmt = con.createStatement();
		   String query = "SELECT * FROM daily_arrear_list";
		   ResultSet rs=stmt.executeQuery(query);
		   System.out.println("consumer_no"+"\t"+"Consumer_name"+"\t\t"+"Reader");
		
		   while(rs.next()){
				 System.out.println(""+rs.getInt("Consumer_no")+"\t\t"+rs.getString("Consumer_name")+"\t\t"+rs.getString("Reader"));				
			  }
		 
		   rs.close();
		   } catch(SQLException s){						
				s.printStackTrace();
			 }
		// close Connection and Statement
		con.close();
		stmt.close();
		}catch (Exception e){
			e.printStackTrace();
		 }
  }
}
