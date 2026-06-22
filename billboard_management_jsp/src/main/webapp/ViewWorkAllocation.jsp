<%@ include file="Header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mvc.bean.WorkAllocationBean" %>
<%@ page import="com.mvc.dao.WorkAllocationDAO" %>

    <h2 align="center">Work Allocations</h2>


    <table border="1">
        <tr>
            <th>SL No</th>
            <th>Allocation ID</th>
            <th>Inspector</th>
            <th>Company</th>
            <th>Location</th>
            <th>Work Description</th>
            <th>Date</th>
            <th>Status</th>
        </tr>

        <%
        List<WorkAllocationBean> allocations = WorkAllocationDAO.getAllAllocations();
        int i = 1;
        for (WorkAllocationBean wa : allocations) {
        %>
        <tr>
            <td><%=i%></td>
            <td><%=wa.getAllocationId()%></td>
            <td><%=wa.getInspectorName()%></td>
            <td><%=wa.getCompanyName()%></td>
            <td><%=wa.getLocationName()%></td>
            <td><%=wa.getWorkDescription()%></td>
            <td><%=wa.getAllocationDate()%></td>
            <td><%=wa.getStatus()%></td>
        </tr>
        <%
            i++;
        }
        %>
    </table>

</body>
</html>
