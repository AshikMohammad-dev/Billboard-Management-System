<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="com.mvc.bean.SizeBean" %>
<%@page import ="com.mvc.dao.SizeDAO" %>
<%
String billboardSize = request.getParameter("billboardSize");

SizeBean sizeBean = new SizeBean();
sizeBean.setBillboardSize(billboardSize);

Boolean sizeAddFlag = SizeDAO.addSize(sizeBean);

if(sizeAddFlag){
	response.sendRedirect("AddBillSize.jsp");
}else{
	response.sendRedirect("Error.jsp");
}
%>