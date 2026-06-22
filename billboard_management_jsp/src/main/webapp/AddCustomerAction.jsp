<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mvc.bean.CustomerBean"%>
<%@ page import="com.mvc.dao.CustomerDAO"%>
<%  
String companyName = request.getParameter("companyName");
String contactPerson = request.getParameter("contactPerson");
Long phone = Long.parseLong(request.getParameter("phone"));

CustomerBean customerBean = new CustomerBean();
customerBean.setCompanyName(companyName);
customerBean.setContactPerson(contactPerson);
customerBean.setPhone(phone);

boolean addFlag = CustomerDAO.addCustomer(customerBean);

if(addFlag){
	response.sendRedirect("ViewCustomer.jsp");
}else{
	response.sendRedirect("Error.jsp");
}


%>