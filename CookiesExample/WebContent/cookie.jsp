<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <div style="border: black">
    <form action="validate.jsp" method="post">
    <input  type="text" name="fname" placeholder="Your ID:"/>
    <input type="password" name="password" placeholder="Password"/>
    <input type="submit" name="submit" value="submit"/>
    </form>
    <% 
    String err=null;
    err=request.getParameter("err");
    try
    {
    if(!err.equals(null)||err.equals("null"))
    {
    %>
    <b style="color: red"><%=err %>
    <%
    }
    }catch(NullPointerException ne){} 
    %>
    </div>
</body>
</html>