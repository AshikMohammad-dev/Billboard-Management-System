<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Work Allocations</title>
</head>
<body>

<%
    // Session guard
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("index.html");
        return;
    }
%>

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.bean.WorkAllocationBean" %>
<%@ page import="com.mvc.dao.WorkAllocationDAO" %>

<h1 align="center">Inspector Portal</h1>
<h2 align="left">Welcome, <%=username%></h2>


<h2 align="center">My Work Allocations</h2>

<table border="1">
    <tr>
        <th>SL No</th>
        <th>Company</th>
        <th>Location</th>
        <th>Work Description</th>
        <th>Assigned Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        List<WorkAllocationBean> myWork = WorkAllocationDAO.getWorkByUsername(username);
        int i = 1;
        for (WorkAllocationBean wa : myWork) {
    %>
    <tr>
        <td><%=i%></td>
        <td><%=wa.getCompanyName()%></td>
        <td><%=wa.getLocationName()%></td>
        <td><%=wa.getWorkDescription()%></td>
        <td><%=wa.getAllocationDate()%></td>
        <td><%=wa.getStatus()%></td>
        <td><a href="UpdateWorkStatus.jsp?workId=<%=wa.getAllocationId()%>&currentStatus=<%=wa.getStatus()%>">UPDATE STATUS</a></td>
    </tr>
    <%
    i++;
    } 
    %>
</table>

</body>
</html>
