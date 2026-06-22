<%@ include file="Header.jsp" %>
<%@ page import="com.mvc.bean.InspectorBean" %>
<%@ page import="com.mvc.bean.BillboardPurchaseBean" %>
<%@ page import="com.mvc.dao.InspectorDAO" %>
<%@ page import="com.mvc.dao.BillboardPurchaseDAO" %>
<%@ page import="java.util.List" %>

    <script>
        function valForm() {
            if (document.workForm.inspectorId.value == "") {
                alert("Select an Inspector");
                document.workForm.inspectorId.focus();
                return false;
            }
            if (document.workForm.purchaseId.value == "") {
                alert("Select a Purchase / Billboard");
                document.workForm.purchaseId.focus();
                return false;
            }
            if (document.workForm.workDescription.value == "") {
                alert("Enter Work Description");
                document.workForm.workDescription.focus();
                return false;
            }
            if (document.workForm.allocationDate.value == "") {
                alert("Select Allocation Date");
                document.workForm.allocationDate.focus();
                return false;
            }
            document.workForm.submit();
        }
    </script>

    <%
    List<InspectorBean> inspectors = InspectorDAO.getAllInspectors();
    List<BillboardPurchaseBean> purchases = BillboardPurchaseDAO.getAllPurchases();
    %>

    <h2 align="center">Allocate Work</h2>

    <form name="workForm" method="post" action="WorkAllocationAction.jsp">

        Inspector
        <select name="inspectorId">
            <option value="">-- Select Inspector --</option>
            <% for (InspectorBean ins : inspectors) { %>
                <option value="<%=ins.getInspectorId()%>"><%=ins.getInspectorName()%></option>
            <% } %>
        </select><br><br>

        Purchase (Company - Location)
        <select name="purchaseId">
            <option value="">-- Select Purchase --</option>
            <% for (BillboardPurchaseBean p : purchases) { %>
                <option value="<%=p.getPurchase_id()%>">
                    <%=p.getCompanyName()%> - <%=p.getLocationName()%>
                </option>
            <% } %>
        </select><br><br>

        Work Description<br>
        <textarea name="workDescription" rows="4" cols="40" placeholder="Describe the work to be done..."></textarea><br><br>

        Allocation Date <input type="date" name="allocationDate" /><br><br>

        Status
        <select name="status">
            <option value="Assigned">Assigned</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select><br><br>

        <input type="submit" value="Allocate Work" onclick="return valForm();" />

    </form>

</body>
</html>
