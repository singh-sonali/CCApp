// Base code of Java Servlet 
//Source: https://www.codejava.net/java-ee/servlet/java-servlet-quick-start-tomcat-xml-config

//package name (directory location)
package net.codejava.servlet;

//importing necessary packages from java
import java.sql.*;
import static java.lang.System.out;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//QuickServlet is servlet name
public class QuickServlet extends HttpServlet {

	/**
	 * this life-cycle method is invoked when this servlet is first accessed
	 * by the client
	 */
	public void init(ServletConfig config) {
		System.out.println("Servlet is being initialized");
	}

	/**
	 * handles HTTP GET request
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		PrintWriter writer = response.getWriter();
		writer.println("<html>Hello, I am the Java servlet for the College Counseling Database Application!</html>");
		writer.flush();
	}

	/**
	 * handles HTTP POST request
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
				try{
					//establishes connection to mysql database
					Connection con = DatabaseConnection.initializeDatabase();
					String visit = request.getParameter("visit");
					String announcement = request.getParameter("announcement");

					//inserts visits from form into database
					if (visit!= null){
						PreparedStatement st = con.prepareStatement("INSERT INTO visits (college, rep_name, place, dt) VALUES (?,?,?,?)");
						String college = request.getParameter("college");
						String rep_name = request.getParameter("rep_name");
						String place = request.getParameter("place");
						String dt = request.getParameter("dt");

						st.setString(1, college);
						st.setString(2, rep_name);
						st.setString(3, place);
						st.setString(4, dt);
						st.executeUpdate();
						st.close();
						con.close();
					}
					//inserts announcements from form into database
					if (announcement!=null){
						PreparedStatement st = con.prepareStatement("INSERT INTO posts (title, description, dt) VALUES (?,?,?)");
						String title = request.getParameter("title");
						String description = request.getParameter("description");
						String dt = request.getParameter("dt2");

						st.setString(1, title);
						st.setString(2, description);
						st.setString(3, dt);
						st.executeUpdate();
						st.close();
						con.close();
					}
					
					//Prints successful message to screen
					PrintWriter writer = response.getWriter();
					writer.println("<html>Your data has been received and entered!<a href='index.jsp'><br>Click here to go back to the main page.</a></html>");
					writer.flush();

				} //end of try
				catch (Exception e){
					PrintWriter writer = response.getWriter();
					writer.println("<html>You did not enter any data, or did not enter something correctly. Please <a href='index.jsp'>try again</a></html>");
					writer.flush();
					e.printStackTrace();
				}

	}



	/**
	 * this life-cycle method is invoked when the application or the server
	 * is shutting down
	 */
	public void destroy() {
		System.out.println("Servlet is being destroyed");
	}
}