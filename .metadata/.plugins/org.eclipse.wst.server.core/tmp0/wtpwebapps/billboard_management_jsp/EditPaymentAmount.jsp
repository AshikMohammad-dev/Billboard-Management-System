<%@ include file="Header.jsp" %>
<%@ page import="com.mvc.bean.PaymentBean" %>
<%@ page import="com.mvc.dao.PaymentDAO" %>

<script>
    function valForm() {
        if (document.editPaymentForm.amountPaid.value == "" || isNaN(document.editPaymentForm.amountPaid.value)) {
            alert("Enter a valid Amount");
            document.editPaymentForm.amountPaid.focus();
            return false;
        }
        if (parseFloat(document.editPaymentForm.amountPaid.value) <= 0) {
            alert("Amount must be greater than zero");
            document.editPaymentForm.amountPaid.focus();
            return false;
        }
        document.editPaymentForm.submit();
    }
</script>

<%
    int paymentId = Integer.parseInt(request.getParameter("paymentId"));
    PaymentBean payment = PaymentDAO.getPaymentById(paymentId);
%>

<h2 align="center">Edit Payment Amount</h2>

<form name="editPaymentForm" method="post" action="EditPaymentAmountAction.jsp">
    <input type="hidden" name="paymentId" value="<%=payment.getPaymentId()%>" />

    Company Name: <strong><%=payment.getCompanyName()%></strong><br><br>
    Total Amount: <strong><%=payment.getTotalAmount()%></strong><br><br>
    Payment Date: <strong><%=payment.getPaymentDate()%></strong><br><br>
    Status: <strong><%=payment.getPaymentStatus()%></strong><br><br>

    Amount Paid <input type="number" step="0.01" name="amountPaid" value="<%=payment.getAmountPaid()%>" /><br><br>

    <input type="submit" value="UPDATE" onclick="return valForm();" />


</form>

</body>
</html>
