<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.mvc.bean.SizeBean" %>
<%@page import="com.mvc.dao.SizeDAO" %>
	
<%
	int sizeId = Integer.parseInt(request.getParameter("sizeId"));
	String billboardSize = request.getParameter("billboardSize");
	
	SizeBean sizeBean = new SizeBean();
	sizeBean.setSizeId(sizeId);
	sizeBean.setBillboardSize(billboardSize);
	
	boolean sizeEditFlag = SizeDAO.updateSize(sizeBean);
	
	if(sizeEditFlag){
		response.sendRedirect("ViewSize.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
%>