<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		body{
			margin: 0px;
		}
		.h_main{
			width: 100%;
			height: 60px;
			background: #0C4589;
			border: none;
			border-bottom: solid 1px #999;
			box-shadow: 0px 1px 14px 4px #777;
		}
		.logo{
			width: auto;
			height: auto;
			padding: 5px;
			color: #B3D5FF;
			position: relative;
			float: left;
		}
		#title{
			color: #B3D5FF;
			font-size: 25px;
		}
		#comm{
			color: #F48E0A;
			font-size: 35px;
			padding-left: 4px;
			padding-right: 4px;
		}
		.navbar{
			padding: 20px;
			position: relative;
			float: right;
			right: 100px;
			top: 3px;
		}
		.navbar a{
			text-decoration: none;
			color: white;
			font-size: 18px;
			font-family: calibri;
			padding-left: 10px;
		}
		.navbar a:hover{
			text-decoration: none;
			color: #F48E0A;
			font-size: 20px;
			font-family: calibri;
			padding-left: 10px;
		}
		#wlcm{
			position:relative;
			left:30px;
			color:darkorange;
			font-size: 15px;
		}
	</style>
</head>
<body>
	<div class="h_main">
		<div class="logo">
			<span id="title">skill<span id="comm">M</span>apper</span>
		</div>
		<div class="navbar">
			<a href="emplist.jsp">Employee List</a>
			<a href="hirenew.jsp">Hire New Employee</a>
			<span id="wlcm">Welcome : ${cookie.usr.value}</span>
		</div>
		
	</div>
</body>
</html>