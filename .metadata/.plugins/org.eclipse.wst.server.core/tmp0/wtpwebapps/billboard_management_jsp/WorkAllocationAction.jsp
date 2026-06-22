<%@ page import="com.mvc.bean.WorkAllocationBean" %>
<%@ page import="com.mvc.dao.WorkAllocationDAO" %>
<%@ page import="java.sql.Date" %>

<%
    int inspectorId      = Integer.parseInt(request.getParameter("inspectorId"));
    int purchaseId       = Integer.parseInt(request.getParameter("purchaseId"));
    String workDesc      = request.getParameter("workDescription");
    String dateStr       = request.getParameter("allocationDate");
    String status        = request.getParameter("status");

    WorkAllocationBean workBean = new WorkAllocationBean();
    workBean.setInspectorId(inspectorId);
    workBean.setPurchaseId(purchaseId);
    workBean.setWorkDescription(workDesc);
    workBean.setAllocationDate(Date.valueOf(dateStr));
    workBean.setStatus(status);

    boolean flag = WorkAllocationDAO.allocateWork(workBean);

    if (flag) {
        response.sendRedirect("ViewWorkAllocation.jsp");
    } else {
        response.sendRedirect("Error.jsp");
    }
%>
