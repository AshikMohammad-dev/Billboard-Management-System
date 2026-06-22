<%@ include file="Header.jsp" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.ArrayList" %>
<%@ page import ="com.mvc.bean.BillboardPurchaseBean" %>
<%@ page import ="com.mvc.dao.BillboardPurchaseDAO" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<h2 align ="center">Purchase History</h2>
	
	<table border =1>
    <tr>
        <th>SLNO</th>
        <th>Company Name</th>
        <th>Location</th>
        <th>Start Date</th>
        <th>Duration</th>
        <th>End Date</th>
        <th>Days Left</th>
        <th>Amount</th>
        <%
        List<BillboardPurchaseBean > purchase = BillboardPurchaseDAO.getAllPurchases();
       
        int i=1;
        for(BillboardPurchaseBean billboardPurchase:purchase){
        	 LocalDate endDate = billboardPurchase.getStart_date().toLocalDate().plusDays(billboardPurchase.getDuration());
             long daysLeft = ChronoUnit.DAYS.between(LocalDate.now(), endDate);
        %>
        <tr>
        <td><%=i %></td>
        <td><%=billboardPurchase.getCompanyName()%></td>
        <td><%=billboardPurchase.getLocationName() %></td>
        <td><%=billboardPurchase.getStart_date() %></td>
        <td><%=billboardPurchase.getDuration() %></td>
        <td><%=endDate%></td>
        <td><%=daysLeft %></td>
        <td><%=billboardPurchase.getAmount() %></td>
        
       <%i++;
       }%>

    </tr>
    </table>

</body>
</html>