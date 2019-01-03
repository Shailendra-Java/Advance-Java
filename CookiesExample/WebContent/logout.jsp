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
    Cookie c1=new Cookie("id","");
    Cookie c2=new Cookie("pass","");
    c1.setMaxAge(0);
    c2.setMaxAge(0);
    response.addCookie(c1);
    response.addCookie(c2);
   /*// Cookie[] allcookies=request.getCookies();
    for(i=0; i<allcookies.length; i++)
    {
       allcookies[i].setMaxAge(0);
       allcookies[i].setValue("");
       
    }*/
    response.sendRedirect("cookie.jsp");
    %>
</body>
</html>