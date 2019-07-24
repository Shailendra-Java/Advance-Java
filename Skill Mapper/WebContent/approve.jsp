<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approvable Page</title>
</head>
<body>
	<h1>HR Page</h1>
	<h3>Employee List for Approvable</h3>
	<form action="ActivateAccount" method="post">
	<table border="1">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email</th>
		<th>Gender</th>
		<th>Role</th>
		<th>Action</th>
	</tr>
	<% 
		String query = "select * from userrecord where status='NA'";
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
			<td><input type="checkbox" name="st" value="A">
				<input type="submit" value="APPROVE"/>
			</td>
		</tr>
		<input type="hidden" value="<%= rs.getString("Email")%>" name="id"/>
			<%}
			}catch(Exception exp){}%>
		</table>
	</form>
</body>
</html>