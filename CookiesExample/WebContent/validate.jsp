<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <% 
    String id = request.getParameter("fname");
    String pass=request.getParameter("password");
    if(id.equals("abc") && pass.equals("123"))
    {
    	Cookie c1=new Cookie("id",id);
    	Cookie c2 = new Cookie("pass",pass);
    	response.addCookie(c1);
    	response.addCookie(c2);
    	response.sendRedirect("welcome.jsp");
    }
    else
    {
    	String err="Inavlid id or Password";
    	response.sendRedirect("cookie.jsp?err="+err);
    }
    %>
</body>
</html>