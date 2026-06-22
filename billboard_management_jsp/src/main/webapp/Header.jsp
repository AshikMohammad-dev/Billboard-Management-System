<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>::Admin Home::</title>
<script>
function goToPage(selectObj)
{
    if(selectObj.value != "")
    {
        window.location.href = selectObj.value;
    }
}
	</script>
</head>
<body>
	<h1 align ="center">Admin Home</h1><br>
	<% 
	String username =(String)session.getAttribute("username");
	%>
	<h2 align ="left">Welcome  <%=username %></h2><br>
	
	<select onchange="goToPage(this)">
    <option value=""selected disabled>Settings</option>
    <option value="AddLocation.jsp">Add Location</option>
    <option value="ViewLocation.jsp">View Location</option>
    <option value="AddBillSize.jsp">Add Billboard Size</option>
    <option value="ViewSize.jsp">View Billboard Size</option>
    <option value="AssignLocationSize.jsp">Assign location and Size</option>
	</select>&nbsp;&nbsp;
	
	<select onchange="goToPage(this)">
    <option value=""selected disabled>Customer</option>
    <option value="AddCustomer.jsp">Add Customer</option>
    <option value="ViewCustomer.jsp">View Customer</option>
	</select>&nbsp;&nbsp;
	
	<select onchange="goToPage(this)">
    <option value=""selected disabled>Billboard</option>
    <option value="Billboardpurchase.jsp">Purchase Billboard</option>
    <option value="ViewPurchase.jsp">Purchase History</option>
	</select>&nbsp;&nbsp;
	
	<select onchange="goToPage(this)">
    <option value="" selected disabled>Inspector</option>
    <option value="AddInspector.jsp">Add Inspector</option>
    <option value="ViewInspector.jsp">View Inspector</option>
    <option value="workallocation.jsp">Allocate work</option>
    <option value="ViewWorkallocation.jsp">View Allocated work</option>
	</select>&nbsp;&nbsp;
	
	<select onchange="goToPage(this)">
    <option value="" selected disabled>Payment</option>
    <option value="AddPayment.jsp">Add Payment</option>
    <option value="ViewPayment.jsp">View Payments</option>
	</select>&nbsp;&nbsp;
	
	<a href ="Logout.jsp">Logout</a><br>