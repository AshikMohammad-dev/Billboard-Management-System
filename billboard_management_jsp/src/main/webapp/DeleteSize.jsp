<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.mvc.bean.SizeBean"%>
<%@page import="com.mvc.dao.SizeDAO"%>
<%
	int sizeId = Integer.parseInt(request.getParameter("sizeId"));
	SizeBean sizeBean = new SizeBean();
	sizeBean.setSizeId(sizeId);
	
	Boolean deleteFlag = SizeDAO.deletesize(sizeBean);
	if (deleteFlag) {
		response.sendRedirect("ViewSize.jsp");
	} else {
		response.sendRedirect("Error.jsp");
	}
%>