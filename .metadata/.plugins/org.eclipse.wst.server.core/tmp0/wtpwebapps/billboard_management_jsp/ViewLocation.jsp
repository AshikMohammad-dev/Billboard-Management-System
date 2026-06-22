<%@ include file="Header.jsp" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="com.mvc.bean.LocationBean" %>
<%@page import ="com.mvc.dao.LocationDAO" %>
	
	<h2 align ="center">LOCATIONS</h2>
	
	<table border =1>
    <tr>
        <th>SLNO</th>
        <th>Location Name</th>
        <th>Location Address</th>
        <th>Action</th>
    </tr>
	<%
	List<LocationBean>locations = LocationDAO.getAllLocation();
	int i =1;
	for(LocationBean loc :locations){
	%>
	<tr>
        <td><%=i%></td>
        <td><%=loc.getLocationName() %></td>
        <td><%=loc.getLocationAddress() %></td>
        <td><a href="EditLocation.jsp?locationId=<%=loc.getLocationId()%>">EDIT</a></td>
		<td><a href="DeleteLocation.jsp?locationId=<%=loc.getLocationId()%>">DELETE</a></td>
   </tr>
	<% 
    i++;
    }
	%>
    </table>
	
</body>
</html>