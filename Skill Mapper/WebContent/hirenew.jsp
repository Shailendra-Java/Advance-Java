<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hire New Employee</title>
<script type="text/javascript">
               
                function fetch()
                {
                    var req;
                    var user = document.getElementById("skills");
                    var url = "GetEmp?skills="+encodeURIComponent(user.value);
                    if(window.XMLHttpRequest)
                    {
                        req = new XMLHttpRequest();
                    }
                    else if(window.ActiveXObject)
                    {
                        req = new ActiveXObject("Microsoft.XMLHttp");
                    }
                    else
                    {
                        alert('Javascript not supported');
                    }
                    req.open("GET",url,true);
                    req.send();
                    req.onreadystatechange = callback;
                    function callback()
                    {
                        if(req.readyState==4 && req.status==200)
                        {
                            document.getElementById("op").innerHTML = req.responseText;
                        }
                    }
                }
            </script>
<style>
	#pnl{
		width: 90%;
		height:auto;
		min-height: 200px;
		padding: 10px;
		margin: auto;
		border: solid 1px;
	}
</style>
</head>
<body>
	<%@ include file="EmplrHdr.jsp" %>
	<div id="pnl">
		<input type="text" id="skills" placeholder="Find Skills" onkeyup="fetch()">
		<div id="op"></div>
	</div>
</body>
</html>