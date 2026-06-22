<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import ="com.mvc.dao.LocationDAO" %>
	
<%
	int locationId = Integer.parseInt(request.getParameter("locationId"));
	String locationname = request.getParameter("locationname");
	String locationaddress = request.getParameter("locationaddress");
	
	LocationBean locBean = new LocationBean();
	locBean.setLocationId(locationId);
	locBean.setLocationName(locationname);
	locBean.setLocationAddress(locationaddress);
	
	boolean locEditFlag = LocationDAO.updateLocation(locBean);
	
	if(locEditFlag){
		response.sendRedirect("ViewLocation.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>