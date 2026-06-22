<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import ="com.mvc.dao.LocationDAO" %>
	
<%

	String locationname = request.getParameter("locationname");
	String locationaddress = request.getParameter("locationaddress");
	
	LocationBean locBean = new LocationBean();
	locBean.setLocationName(locationname);
	locBean.setLocationAddress(locationaddress);
	
	boolean locAddFlag = LocationDAO.addLocation(locBean);
	
	if(locAddFlag){
		response.sendRedirect("ViewLocation.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>