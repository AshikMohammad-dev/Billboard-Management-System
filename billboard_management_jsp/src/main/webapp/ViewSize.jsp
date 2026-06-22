<%@ include file="Header.jsp" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="com.mvc.bean.SizeBean" %>
<%@page import ="com.mvc.dao.SizeDAO" %>
	
	<h2 align ="center">SIZE</h2>
	
	<table border =1>
    <tr>
        <th>SLNO</th>
        <th>Billboard Size</th>
        <th>Action</th>
    </tr>
	<%
	List<SizeBean>sizes = SizeDAO.getAllSize();
	int i =1;
	for(SizeBean bsize :sizes){
	%>
	<tr>
        <td><%=i%></td>
        <td><%=bsize.getBillboardSize()%></td>
        <td><a href="EditSize.jsp?sizeId=<%=bsize.getSizeId()%>">EDIT</a></td>
		<td><a href="DeleteSize.jsp?sizeId=<%=bsize.getSizeId()%>">DELETE</a></td>
   </tr>
	<% 
    i++;
    }
	%>
    </table>
	
</body>
</html>