<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Hired List</title>
<style>
table {
  width:100%;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
  text-align: left;
}
table#t01 tr:nth-child(even) {
  background-color: #eee;
}
table#t01 tr:nth-child(odd) {
 background-color: #fff;
}
table#t01 th {
  background-color: black;
  color: white;
}
</style>
</head>
<body>
	<%@ include file="HRhdr.jsp" %>
	<h3>Employee List for Approvable</h3>
	<form action="ActivateAccount" method="post">
	<table id="t01">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Gender</th>
		<th>Role</th>
		<th>Employer</th>
	</tr>
	<% 
		String query = "select * from userrecord where hire='Y'";
		try{
			Class.forName("org.h2.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/skillMapper","niit","12345");
			
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
	%>
		<tr>
			<td><%= rs.getString("FirstName")%></td>
			<td><%= rs.getString("LastName")%></td>
			<td><%= rs.getString("Email")%></td>
			<td><%= rs.getString("Gender")%></td>
			<td><%= rs.getString("Role")%></td>
			<td><%= rs.getString("Employer") %>
		</tr>
			<%}
			}catch(Exception exp){}%>
		</table>
	</form>
</body>
</html>