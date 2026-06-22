<%@ include file="Header.jsp" %>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import="com.mvc.dao.LocationDAO" %>
	<script>
			function valForm()
			{	
				
				if(document.editLocForm.locationname.value=="")
				{
					alert("Enter Location Name");
					document.editLocForm.locationname.focus();
					return false;
				}
				if(document.editLocForm.locationaddress.value=="")
				{
					alert("Enter Location Address");
					document.editLocForm.locationaddress.focus();
					return false;
				}
				document.editLocForm.submit();			
			}
		</script>
		
	<h2>Location Edit </h2>
	<% 
    int locationId = Integer.parseInt(request.getParameter("locationId"));
    
	LocationBean locationBean = new LocationBean();
	locationBean.setLocationId(locationId);
	
	LocationBean locationEdit = LocationDAO.editLocation(locationBean);
	
    %>	


	<form name="editLocForm" method="post" action="LocationEditAction.jsp" >
		<input type="hidden" name="locationId" value ="<%=locationEdit.getLocationId()%>"/><br><br>
		Location name<input type="text" name="locationname" value ="<%=locationEdit.getLocationName()%>"/><br><br>
		Address<input type="text" name="locationaddress" value ="<%=locationEdit.getLocationAddress()%>"/><br><br>
		<br> <input type="submit" value="Save" onclick ="return valForm();"/>
	</form>


</body>
</html>