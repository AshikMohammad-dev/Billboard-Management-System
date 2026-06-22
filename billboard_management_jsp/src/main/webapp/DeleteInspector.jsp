<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import ="com.mvc.bean.InspectorBean" %>
<%@ page import ="com.mvc.dao.InspectorDAO" %>

<%
	int inspectorId = Integer.parseInt(request.getParameter("inspectorId"));

	InspectorBean inspectorBean = new InspectorBean();
	inspectorBean.setInspectorId(inspectorId);

	boolean deleteFlag = InspectorDAO.deleteInspector(inspectorBean);

	if(deleteFlag){
		response.sendRedirect("ViewInspector.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>