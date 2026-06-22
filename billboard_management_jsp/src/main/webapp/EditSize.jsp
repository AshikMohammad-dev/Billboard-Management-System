<%@ include file="Header.jsp" %>
<%@page import ="com.mvc.bean.SizeBean" %>
<%@page import="com.mvc.dao.SizeDAO" %>
		<script>
			function valForm()
			{	
				
				if(document.editSizeForm.billboardSize.value=="")
				{
					alert("Enter Location Size");
					document.editSizeForm.billboardSize.focus();
					return false;
				}
				document.editSizeForm.submit();			
			}
		</script>
		
	<% 
    int sizeId = Integer.parseInt(request.getParameter("sizeId"));
    
	SizeBean sizeBean = new SizeBean();
	sizeBean.setSizeId(sizeId);
	
	SizeBean size = SizeDAO.editSize(sizeBean);
	
    %>	


	<h2 align ="center">EDIT SIZE</h2>
	<form name="editSizeForm" method="post" action="EditSizeAction.jsp" >
		<input type="hidden" name="sizeId" value ="<%=size.getSizeId()%>"/><br><br>
		Billboard Size<input type="text" name="billboardSize" value ="<%=size.getBillboardSize()%>"/><br><br>
		<br> <input type="submit" value="ADD" onclick ="return valForm();"/>
	</form>


</body>
</html>