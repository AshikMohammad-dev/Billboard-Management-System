<%@ include file="Header.jsp" %>
	<script>
			function valForm()
			{	
				
				if(document.addLocForm.locationname.value=="")
				{
					alert("Enter Location Name");
					document.addLocForm.locationname.focus();
					return false;
				}
				if(document.addLocForm.locationaddress.value=="")
				{
					alert("Enter Location Address");
					document.addLocForm.locationaddress.focus();
					return false;
				}
				document.addLocForm.submit();			
			}
		</script>

	<h1 align ="center">ADD LOCATION</h1>
	<form name="addLocForm" method="post" action="AddLocationAction.jsp" >
		Location Name<input type="text" name="locationname"/><br><br>
		Address<input type="text" name="locationaddress"/><br><br>
		<br> <input type="submit" value="ADD" onclick ="return valForm();"/>
	</form>
	
</body>
</html>