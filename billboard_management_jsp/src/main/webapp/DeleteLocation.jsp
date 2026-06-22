<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import ="com.mvc.dao.LocationDAO" %>
<%
	int locationId = Integer.parseInt(request.getParameter("locationId"));
	
	LocationBean locationBean = new LocationBean();
	locationBean.setLocationId(locationId);
	
	Boolean deleteFlag = LocationDAO.deleteLocation(locationBean);
	if(deleteFlag){
		response.sendRedirect("ViewLocation.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>