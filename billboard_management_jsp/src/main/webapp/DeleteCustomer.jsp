<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.mvc.bean.CustomerBean" %>
<%@ page import ="com.mvc.dao.CustomerDAO" %>
    <% 
int customerId = Integer.parseInt(request.getParameter("customerId"));
    
	CustomerBean customerBean = new CustomerBean();
	customerBean.setCustomerId(customerId);
	
	boolean deleteFlag = CustomerDAO.deleteCustomer(customerBean);
	if(deleteFlag){
		response.sendRedirect("ViewCustomer.jsp");
	}else{
		response.sendRedirect("Error.jsp");
	}
	%>