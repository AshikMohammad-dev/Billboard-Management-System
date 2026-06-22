<%@ include file="Header.jsp" %>
<%@page import ="com.mvc.bean.LocationSizeBean" %>
<%@page import ="com.mvc.dao.LocationSizeDAO" %>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import ="com.mvc.dao.LocationDAO" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="com.mvc.bean.SizeBean" %>
<%@page import ="com.mvc.dao.SizeDAO" %>

	<script>
			function valForm()
			{	
				
				if(document.assignLocSizeForm.locationname.value=="")
				{
					alert("Enter Location Name");
					document.assignLocSizeForm.locationname.focus();
					return false;
				}
				if(document.assignLocSizeForm.locationaddress.value=="")
				{
					alert("Enter Location Address");
					document.assignLocSizeForm.locationaddress.focus();
					return false;
				}
				document.assignLocSizeForm.submit();			
			}
	</script>
	<%
	List<LocationBean> locations = LocationDAO.getAllLocation();
	List<SizeBean>sizes = SizeDAO.getAllSize();
	%>
		
	<h1 align ="center">ASSIGN LOCATION AND SIZE</h1>
	
	<form name="assignLocSizeForm" method="post" action="AssignLocationSizeAction.jsp" >
	
		Location:<select name ="locationId">
		
		<% for(LocationBean location:locations){%>
					<option value ="<%= location.getLocationId()%>"><%=location.getLocationName()%></option>
		<%} %>
		</select><br><br>
		
		Size:<select name=sizeId>
		
		<%for(SizeBean size :sizes) {%>
				<option value ="<%=size.getSizeId()%>" ><%=size.getBillboardSize() %></option>
		<%} %>
		</select><br><br>
		
		Price:<input type = "number" name ="price"/>
		
		Availability Status:<select name ="availability">
							<option>Available</option>
							<option>Not Available</option>
							</select>
		<br> <input type="submit" value="ADD" onclick ="return valForm();"/>
	</form>

</body>
</html>