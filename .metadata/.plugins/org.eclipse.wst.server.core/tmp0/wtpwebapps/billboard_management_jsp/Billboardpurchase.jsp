<%@ include file="Header.jsp" %>
<%@ page import ="com.mvc.bean.CustomerBean" %>
<%@ page import ="com.mvc.dao.CustomerDAO" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@ page import="com.mvc.dao.LocationSizeDAO"%>
<%@ page import="com.mvc.bean.LocationSizeBean"%>
	<script>
			function valForm()
			{
			    if(document.purchaseForm.startDate.value == "")
			    {
			        alert("Enter Start Date");
			        document.purchaseForm.startDate.focus();
			        return false;
			    }

			    if(document.purchaseForm.duration.value == "")
			    {
			        alert("Enter Duration");
			        document.purchaseForm.duration.focus();
			        return false;
			    }

			    if(isNaN(document.purchaseForm.duration.value))
			    {
			        alert("Enter a valid Duration in days");
			        document.purchaseForm.duration.focus();
			        return false;
			    }

			    document.purchaseForm.submit();
			}
		</script>
		
	<% 
	List<CustomerBean> company = CustomerDAO.getAllCompanyName();
	List<LocationSizeBean>billboard = LocationSizeDAO.getAllAvailable();
	%>
	<h1 align ="center">PURCHASE BILLBOARD</h1>
	
	<form name="purchaseForm" method="post" action="PurchaseAction.jsp" >
	Company Name <select name ="customerId">
	<% for(CustomerBean customer:company){ %>
				<option value ="<%=customer.getCustomerId() %>"><%=customer.getCompanyName()%></option>
	<%} %>					
					</select><br><br>
		Choose Billboard <select name ="locSizeId">
	<% 	for(LocationSizeBean billboards:billboard){ %>
				<option value ="<%=billboards.getLocSizeId() %>"><%=billboards.getLocationName()+"-"+billboards.getSize()%></option>
	<%} %>					
					</select><br><br>
		
		Start Date<input type="date" name="startDate" />
    	Duration<input type="number" name="duration" placeholder="Duration in days" />
		<br> <input type="submit" value="ADD" onclick ="return valForm();"/>
	</form>

</body>
</html>