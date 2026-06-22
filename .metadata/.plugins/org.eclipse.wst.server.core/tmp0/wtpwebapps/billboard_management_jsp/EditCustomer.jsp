<%@ include file="Header.jsp" %>
<%@ page import ="com.mvc.bean.CustomerBean" %>
<%@ page import ="com.mvc.dao.CustomerDAO" %>

		<script>
			function valForm()
			{	
				
				if(document.editCustomerForm.companyName.value=="")
				{
					alert("Enter Company Name");
					document.editCustomerForm.companyName.focus();
					return false;
				}
				if(document.editCustomerForm.customerName.value=="")
				{
					alert("Enter Customer Name");
					document.editCustomerForm.customerName.focus();
					return false;
				}
				if(document.editCustomerForm.phone.value=="")
				{
					alert("Enter phone number");
					document.editCustomerForm.phone.focus();
					return false;
				}
				document.editCustomerForm.submit();			
			}
		</script>
		
	<h2>Customer Edit </h2>
	<% 
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    
	CustomerBean customerBean = new CustomerBean();
	customerBean.setCustomerId(customerId);
	
	CustomerBean customerEdit = CustomerDAO.editCustomers(customerBean);
	
    %>	


	<form name="editCustomerForm" method="post" action="CustomerEditAction.jsp" >
		<input type="hidden" name="customerId" value ="<%=customerEdit.getCustomerId()%>"/><br><br>
		Company Name<input type="text" name="companyName" value ="<%=customerEdit.getCompanyName() %>"/><br><br>
		Contact Person<input type="text" name="contactPerson" value ="<%=customerEdit.getContactPerson()%>"/><br><br>
		Phone<input type="text" name="phone" value ="<%=customerEdit.getPhone()%>"/><br><br>
		<br> <input type="submit" value="Save" onclick ="return valForm();"/>
	</form>


</body>
</html>