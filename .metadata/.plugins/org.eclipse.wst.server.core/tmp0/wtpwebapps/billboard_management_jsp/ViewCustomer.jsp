<%@ include file="Header.jsp" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@ page import ="com.mvc.bean.CustomerBean" %>
<%@ page import ="com.mvc.dao.CustomerDAO" %>

	
	<h2 align ="center">CUSTOMERS</h2>
	
	<table border =1>
    <tr>
        <th>SLNO</th>
        <th>Company Name</th>
        <th>Contact Person</th>
        <th>Phone No</th>
        <th>Action</th>
    </tr>
	<%
	List<CustomerBean>customers = CustomerDAO.getAllCustomers();
	int i =1;
	for(CustomerBean customer :customers){
	%>
	<tr>
        <td><%=i%></td>
        <td><%=customer.getCompanyName()%></td>
        <td><%=customer.getContactPerson() %></td>
        <td><%=customer.getPhone()%></td>
        <td><a href="EditCustomer.jsp?customerId=<%=customer.getCustomerId()%>">EDIT</a></td>
		<td><a href="DeleteCustomer.jsp?customerId=<%=customer.getCustomerId()%>">DELETE</a></td>
   </tr>
	<% 
    i++;
    }
	%>
    </table>
	
</body>
</html>
