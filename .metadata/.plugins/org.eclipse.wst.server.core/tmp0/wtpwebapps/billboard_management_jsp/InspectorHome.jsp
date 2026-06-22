<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>::Inspector Home::</title>
</head>
<body>
    <h1 align="center">Inspector Portal</h1>
    <%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("index.html");
        return;
    }
    %>
    <h2 align="left">Welcome, <%=username%></h2><br>

    <a href="InspectorViewWork.jsp">View My Work Allocations</a><br><br>
    	<a href ="Logout.jsp">Logout</a><br>

</body>
</html>
