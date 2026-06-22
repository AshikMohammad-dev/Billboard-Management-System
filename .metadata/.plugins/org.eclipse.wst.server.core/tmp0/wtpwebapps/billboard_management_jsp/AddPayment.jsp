<%@ include file="Header.jsp" %>
<%@ page import="com.mvc.bean.BillboardPurchaseBean" %>
<%@ page import="com.mvc.dao.BillboardPurchaseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<script>
    function valForm() {
        if (document.addPaymentForm.purchaseId.value == "") {
            alert("Select a Purchase");
            document.addPaymentForm.purchaseId.focus();
            return false;
        }
        if (document.addPaymentForm.amountPaid.value == "" || isNaN(document.addPaymentForm.amountPaid.value)) {
            alert("Enter a valid Amount");
            document.addPaymentForm.amountPaid.focus();
            return false;
        }
        if (parseFloat(document.addPaymentForm.amountPaid.value) <= 0) {
            alert("Amount must be greater than zero");
            document.addPaymentForm.amountPaid.focus();
            return false;
        }
        if (document.addPaymentForm.paymentDate.value == "") {
            alert("Select Payment Date");
            document.addPaymentForm.paymentDate.focus();
            return false;
        }
        if (document.addPaymentForm.paymentStatus.value == "") {
            alert("Select Payment Status");
            document.addPaymentForm.paymentStatus.focus();
            return false;
        }
        document.addPaymentForm.submit();
    }
</script>

<%
    // If coming from ViewPurchase with a pre-selected purchase_id
    String preSelectedId = request.getParameter("purchaseId");
    List<BillboardPurchaseBean> purchases = BillboardPurchaseDAO.getAllPurchases();
%>

<h2 align="center">Add Payment</h2>

<form name="addPaymentForm" method="post" action="AddPaymentAction.jsp">

    Purchase <select name="purchaseId">
        <option value="" disabled <%=(preSelectedId == null) ? "selected" : ""%>>-- Select Purchase --</option>
        <% for (BillboardPurchaseBean p : purchases) { %>
            <option value="<%=p.getPurchase_id()%>"
                <%=(preSelectedId != null && preSelectedId.equals(String.valueOf(p.getPurchase_id()))) ? "selected" : ""%>>
                <%=p.getPurchase_id()%> - <%=p.getCompanyName()%> (Total: <%=p.getAmount()%>)
            </option>
        <% } %>
    </select><br><br>

    Amount Paid <input type="number" step="0.01" name="amountPaid" placeholder="Enter amount" /><br><br>

    Payment Date <input type="date" name="paymentDate" /><br><br>

    Payment Status
    <select name="paymentStatus">
        <option value="" disabled selected>-- Select Status --</option>
        <option value="Paid">Paid</option>
        <option value="Partial">Partial</option>
        <option value="Pending">Pending</option>
    </select><br><br>

    <input type="submit" value="ADD PAYMENT" onclick="return valForm();" />

</form>

</body>
</html>
