<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.mvc.dao.LocationSizeDAO"%>
<%@ page import="com.mvc.bean.LocationSizeBean"%>
<%
	int locationId = Integer.parseInt(request.getParameter("locationId"));
	int sizeId = Integer.parseInt(request.getParameter("sizeId"));
	Float price = Float.parseFloat(request.getParameter("price"));
	String availability = request.getParameter("availability");
	
	LocationSizeBean locationSizeBean = new LocationSizeBean();
	
	locationSizeBean.setLocationId(locationId);
	locationSizeBean.setSizeId(sizeId);
	locationSizeBean.setPrice(price);
	locationSizeBean.setAvailabilityStatus(availability);
	
	boolean LocSizeFlag = LocationSizeDAO.addLocationAndSize(locationSizeBean);
	
	if (LocSizeFlag) {
		response.sendRedirect("ViewLocationSize.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
%>
