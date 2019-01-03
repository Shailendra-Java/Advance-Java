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
    int i;
    String name=null;
    Cookie[] allcookies=request.getCookies();
    for(i=0; i<allcookies.length; i++)
    {
    	if(allcookies[i].getName().equals("id")&&allcookies[i+1].getName().equals("pass"))
    	{
    		name=allcookies[i].getValue();
    	}
    }
    try
    {
    if(!name.equals(null)||name.equals("null"))
    {
    %>
    <h1>Welcome </h1><h2><%= name%></h2>
    <a href="logout.jsp">logout</a>
    <%
    }
    else
    	response.sendRedirect("cookie.jsp");
    }catch(NullPointerException ne){response.sendRedirect("cookie.jsp");} %>
</body>
</html>