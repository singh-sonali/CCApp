<!-- This page displays the visits data from the MySQL database. -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="net.codejava.servlet.*" %>
<!-- Import CSS page -->
<link rel="stylesheet" type="text/css" href="show.css"/>

<html>
<head>
<title>College Data</title>
</head>
<body>
<h1>Visit Data</h1>
<!-- Form to sort visits database -->
<form action="displayvisits.jsp" method="get">
	<input type="radio" name="sort" value="byname">Sort Alphabetically
	<br>
	<input type="radio" name="sort" value="bydate">Sort By Date
	<br>
	<input type="submit" name="submit" value="Display Sorting">

</form>
<%
// Basic java code to get inputs from form. Additional class was not needed because keeping parameters in the same jsp document was more efficient.
try {
Connection con = DatabaseConnection.initializeDatabase();
PreparedStatement st = null;
ResultSet rs = null;
String getQueryStatement = null;

//Gets information from sort form
String name = request.getParameter("sort");


if (request.getParameter("sort") == null){
	getQueryStatement = "SELECT college, rep_name, place, dt FROM visits WHERE dt>=now()";
	name = "null";
}

//Sort by date
if (name.equals("bydate")){
	getQueryStatement = "SELECT college, rep_name, place, dt FROM visits WHERE dt >=now() ORDER BY DATE(dt) ASC, dt ASC";
}
//Sort alphabetically
else if (name.equals("byname")){
	getQueryStatement = "SELECT college, rep_name, place, dt FROM visits WHERE dt>=now() ORDER BY college";
}
st = con.prepareStatement(getQueryStatement);
rs = st.executeQuery();

%>
<!-- Display results in table -->
<TABLE cellpadding="15" border="1">
<tr style="font-weight: bold;">
<td>College</td>
<td>Representative Name</td>
<td>Location</td>
<td>Date and Time</td>
</tr>

<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
</tr>
<% } %>
<%
// close all the connections.
rs.close();
st.close();
con.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
//Catch an error and print it to the screen.
out.println("Unable to connect to database.");
out.println(ex);
}
%>
</font>
</table>
<!-- back button -->
<FORM ACTION="index.jsp" method="get" class="button">
<button type="submit"><-- back</button>

</body>
</html>