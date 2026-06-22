<%@ include file="Header.jsp" %>

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.bean.InspectorBean" %>
<%@ page import="com.mvc.dao.InspectorDAO" %>

<h2 align="center">INSPECTORS</h2>

<table border="1">

<tr>
	<th>SLNO</th>
	<th>Login ID</th>
	<th>Inspector Name</th>
	<th>Phone</th>
	<th colspan="2">Action</th>
</tr>

<%
	List<InspectorBean> inspectors = InspectorDAO.getAllInspectors();

	int i = 1;

	for(InspectorBean inspector : inspectors){
%>

<tr>
	<td><%=i%></td>
	<td><%=inspector.getLoginId()%></td>
	<td><%=inspector.getInspectorName()%></td>
	<td><%=inspector.getPhone()%></td>

	<td>
		<a href="EditInspector.jsp?inspectorId=<%=inspector.getInspectorId()%>">
			EDIT
		</a>
	</td>

	<td>
		<a href="DeleteInspector.jsp?inspectorId=<%=inspector.getInspectorId()%>">
			DELETE
		</a>
	</td>
</tr>

<%
	i++;
	}
%>

</table>

</body>
</html>