<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Work Status</title>
<script>
    function valForm() {
        if (document.updateStatusForm.newStatus.value == "") {
            alert("Select a Status");
            document.updateStatusForm.newStatus.focus();
            return false;
        }
        document.updateStatusForm.submit();
    }
</script>
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("index.html");
        return;
    }

    int workId = Integer.parseInt(request.getParameter("workId"));
    String currentStatus = request.getParameter("currentStatus");
%>

<h1 align="center">Inspector Portal</h1>
<h2 align="left">Welcome, <%=username%></h2>
<a href="InspectorViewWork.jsp">Back to My Work</a><br><br>

<h2 align="center">Update Work Status</h2>

<form name="updateStatusForm" method="post" action="UpdateWorkStatusAction.jsp">
    <input type="hidden" name="workId" value="<%=workId%>" />

    Work ID: <strong><%=workId%></strong><br><br>
    Current Status: <strong><%=currentStatus%></strong><br><br>

    New Status
    <select name="newStatus">
        <option value="" disabled selected>-- Select New Status --</option>
        <option value="Assigned" >Assigned</option>
        <option value="In Progress" >In Progress</option>
        <option value="Completed" >Completed</option>
    </select><br><br>

    <input type="submit" value="UPDATE" onclick="return valForm();" />
    &nbsp;
    
</form>

</body>
</html>
