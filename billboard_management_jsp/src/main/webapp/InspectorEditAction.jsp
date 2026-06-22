<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import ="com.mvc.bean.InspectorBean" %>
<%@ page import ="com.mvc.dao.InspectorDAO" %>

<%
	int inspectorId = Integer.parseInt(request.getParameter("inspectorId"));
	int loginId = Integer.parseInt(request.getParameter("loginId"));
	String inspectorName = request.getParameter("inspectorName");
	long phone = Long.parseLong(request.getParameter("phone"));

	InspectorBean inspectorBean = new InspectorBean();

	inspectorBean.setInspectorId(inspectorId);
	inspectorBean.setLoginId(loginId);
	inspectorBean.setInspectorName(inspectorName);
	inspectorBean.setPhone(phone);

	boolean updateFlag = InspectorDAO.updateInspector(inspectorBean);

	if(updateFlag){
		response.sendRedirect("ViewInspector.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>