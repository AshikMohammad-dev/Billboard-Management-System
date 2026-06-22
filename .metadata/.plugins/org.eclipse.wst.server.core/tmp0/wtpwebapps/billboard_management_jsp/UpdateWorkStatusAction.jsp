<%@ page import="com.mvc.dao.WorkAllocationDAO" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("index.html");
        return;
    }

    int workId = Integer.parseInt(request.getParameter("workId"));
    String newStatus = request.getParameter("newStatus");

    boolean flag = WorkAllocationDAO.updateWorkStatus(workId, newStatus);

    if (flag) {
        response.sendRedirect("InspectorViewWork.jsp");
    } else {
        response.sendRedirect("Error.jsp");
    }
%>
