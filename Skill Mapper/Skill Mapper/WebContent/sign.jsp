<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign IN</title>
<style>
	#container{
		width:600px;
		height: 400px;
		border: solid 1px;
		margin: auto;
		padding: 10px;
	}
	#signin{
		width:35%;
		height: 350px;
		border: none;
		border-right: solid 1px;
		position:relative;
		float:left;
		padding: 10px;
	}
	#signup{
		width:60%;
		height: 350px;
		border: none;
		position:relative;
		float:right;
	}
</style>
</head>
<body>
	<%@ include file="header.html" %>
	<div id="container">
		<div id="signin">
			<h3>Sign IN</h3>
			<form action="verify" method="post">
				<input type="text" name="id" placeholder="User ID :"/><br><br>
				<input type="password" name="psw" placeholder="Password :"/><br><br>
				<input type="submit" value="LOGIN"/>
				<h3 style="color:red">${param.err}</h3>
			</form>
		</div>
		<div id="signup">
			<h3>Sign UP</h3>
			<form action="Register" method="post">
				<input type="text" name="fname" placeholder="First Name :"/>
				<input type="text" name="lname" placeholder="Last Name :"/><br><br>
				<input type="email" name="eid" placeholder="Email ID :"/>
				<input type="password" name="psw" placeholder="Password :"/><br><br>
				<input type="radio" name="gender" value="Male"/>Male
				<input type="radio" name="gender" value="Female"/>Female<br><br>
				<input type="radio" name="type" value="Employee"/>Employee
				<input type="radio" name="type" value="Employeer"/>Employeer<br><br>
				<input type="submit" value="CREATE ACCOUNT"/>
			</form>
			<h3 style="color:red">${param.msg}</h3>
		</div>
	</div>
</body>
</html>