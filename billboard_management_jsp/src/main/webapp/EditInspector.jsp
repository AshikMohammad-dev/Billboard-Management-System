<%@ include file="Header.jsp" %>
<%@ page import="com.mvc.bean.LoginBean" %>
<%@ page import ="com.mvc.bean.InspectorBean" %>
<%@ page import ="com.mvc.dao.InspectorDAO" %>
<%@ page import="java.util.List" %>

<script>
	function valForm()
	{	
		
		if(document.editInspectorForm.inspectorName.value=="")
		{
			alert("Enter Inspector Name");
			document.editInspectorForm.inspectorName.focus();
			return false;
		}
		
		if(document.editInspectorForm.phone.value=="")
		{
			alert("Enter phone number");
			document.editInspectorForm.phone.focus();
			return false;
		}
		
		document.editInspectorForm.submit();			
	}
</script>

<h2>Inspector Edit</h2>

<%
	List<LoginBean> logins = InspectorDAO.getInspectorLogins();
	int inspectorId = Integer.parseInt(request.getParameter("inspectorId"));

	InspectorBean inspectorBean = new InspectorBean();
	inspectorBean.setInspectorId(inspectorId);

	InspectorBean inspectorEdit = InspectorDAO.editInspector(inspectorBean);
%>

<form name="editInspectorForm" method="post" action="InspectorEditAction.jsp">

	<input type="hidden" name="inspectorId"
		value="<%=inspectorEdit.getInspectorId()%>"/><br><br>

	        Login Account
        <select name="loginId">
            <option value="">-- Select Login --</option>
            <% for (LoginBean lb : logins) { %>
                <option value="<%=lb.getLoginId()%>"><%=lb.getLoginUsername()%></option>
            <% } %>
        </select><br><br>

	Inspector Name
	<input type="text" name="inspectorName"
		value="<%=inspectorEdit.getInspectorName()%>"/><br><br>

	Phone
	<input type="text" name="phone"
		value="<%=inspectorEdit.getPhone()%>"/><br><br>

	<br>
	<input type="submit" value="Save" onclick="return valForm();"/>

</form>

</body>
</html>