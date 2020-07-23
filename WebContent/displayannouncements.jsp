<!-- This page displays the announcements data from the MySQL database. -->
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="net.codejava.servlet.*" %>
<!-- Import CSS file -->
<link rel="stylesheet" type="text/css" href="show.css"/>

<html>
<head>
<title>Announcements from College Counseling</title>
</head>
<body>
<h1>Announcements</h1>
<%
// Very brief java code to establish connection to database (relies on previously created class)
try {
Connection con = DatabaseConnection.initializeDatabase();
PreparedStatement st = null;
ResultSet rs = null;

String getQueryStatement = "SELECT title, description, dt FROM posts WHERE dt >=now() ORDER BY DATE(dt) ASC, dt ASC";
st = con.prepareStatement(getQueryStatement);
rs = st.executeQuery();

%>
<!-- Displays announcements from MySQL database in table. -->
<TABLE cellpadding="15" border="1">
<tr style="font-weight: bold;">
<td>Title</td>
<td>Description</td>
<td>Date and Time</td>
</tr>

<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
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
out.println("Unable to connect to database.");
System.out.println(ex);
}
%>
</font>
</table>
<FORM ACTION="index.jsp" method="get" class="button">
<button type="submit"><-- back</button>
</body>
</html>