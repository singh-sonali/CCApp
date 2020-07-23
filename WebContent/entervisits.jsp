<!-- This page allows the user to enter the visits data from the MySQL database. -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="net.codejava.servlet.*" %>
<link rel="stylesheet" type="text/css" href="form.css"/>

<html>
<head>
<title>Enter Visit Information</title>
</head>
<body>
<h1> College Visit Form</h2>
<!-- Allows the user to enter information about visits and sends the information to the servlet to process and enter in database. -->
<form action="QuickServlet" method="post">
	<h3> Enter information about a college visit:</h3>
		College <input type="text" size="25" name="college"/> 
		&nbsp;&nbsp;
		<br>
		Representative Name <input type="text" size="25" name="rep_name"/>
		&nbsp;&nbsp;
		<br>
		Location <input type="text" size="25" name="place"/>
		&nbsp;&nbsp;
		<br>
		Date/Time (YYYY-MM-DD hh:mm:ss) <input type="text" size="25" name="dt"/>
		&nbsp;&nbsp;
		<br>
		<input type="submit" value="Submit Visit Information" name="visit"/>
</form>
<!-- back button -->
<table>
	<tr>
		<td><FORM ACTION="index.jsp" method="get" >
		<button type="submit"><-- back</button></td>
	</tr>
</table>

</body>
</html>