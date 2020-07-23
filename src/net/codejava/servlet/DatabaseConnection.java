//This file uses Java and MySQL to create a connection to our announcements database.
//Package name
package net.codejava.servlet;
//from tutorialspoint.com
//from www.geeksforgeeks.org/java-servlet-and-jdbc-example-insert-data-in-mysql/
//STEP 1. Import required packages
import java.sql.*;
import static java.lang.System.out;

public class DatabaseConnection {
   public static Connection initializeDatabase()
   throws SQLException, ClassNotFoundException{
   // JDBC driver name and database URL
      String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
      String DB_URL = "jdbc:mysql://localhost/announcements?serverTimezone=UTC";

      //  Database credentials
      String USER = "root";
      String PASS = "password";
      Connection conn = null;

      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      log("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      return conn;
   }//end exception statement
   
   private static void log(String string){
      System.out.println(string);
   }//end of log
}//end of DatabaseConnection