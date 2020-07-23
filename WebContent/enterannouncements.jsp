<!-- This page allows the user to enter the announcements data from the MySQL database. -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="net.codejava.servlet.*" %>
<link rel="stylesheet" type="text/css" href="form.css"/>

<html>
<head>
<title>Enter Announcement Information</title>
</head>
<body>
<h1>Announcements Form</h1>

<!-- Allows the user to enter information about announcements and sends the information to the servlet to process and enter in database. -->
<form action="QuickServlet" method="post">
	<h3> Enter an announcement:</h3>
		Title <input type="text" size="25" name="title"/>&nbsp;&nbsp;
		<br>
		Due Date (YYYY-MM-DD hh:mm:ss) <input type="text" size="25" name="dt2"/>&nbsp;&nbsp;
		<br>
		Description<input type="text" size="50" name="description" class="desc"/>&nbsp;&nbsp;
		<br>
		<input type="submit" value="Submit Announcement Information" name="announcement"/>
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