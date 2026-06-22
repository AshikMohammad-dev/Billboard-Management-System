<%@ include file="Header.jsp" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="com.mvc.bean.LocationSizeBean" %>
<%@page import ="com.mvc.dao.LocationSizeDAO" %>
	
	<h2 align ="center">Assigned Location and Size</h2>
	
	<table border =1>
    <tr>
        <th>SLNO</th>
        <th>Location Name</th>
        <th>Size</th>
        <th>Price</th>
        <th>Availability</th>
    </tr>
  <%
  List<LocationSizeBean> locationSize = LocationSizeDAO.getAllLocationAndSize();
  
  int i =1;
  for(LocationSizeBean locsize : locationSize){
  %>  
  <tr>
        <td><%=i%></td>
        <td><%=locsize.getLocationName()%></td>
        <td><%=locsize.getSize() %></td>
        <td><%=locsize.getPrice()%></td>
		<td><%=locsize.getAvailabilityStatus()%></td>
	
   </tr>
   <%
    i++; 
    } 
    %>
    </table>
</body>
</html>