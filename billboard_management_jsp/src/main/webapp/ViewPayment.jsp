<%@ include file="Header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mvc.bean.PaymentBean" %>
<%@ page import="com.mvc.dao.PaymentDAO" %>

<h2 align="center">Payment Records</h2>



<table border="1">
    <tr>
        <th>SLNO</th>
        <th>Company Name</th>
        <th>Total Amount</th>
        <th>Amount Paid</th>
        <th>Balance</th>
        <th>Payment Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        List<PaymentBean> payments = PaymentDAO.getAllPayments();
        int i = 1;
        for (PaymentBean payment : payments) {
            float balance = payment.getTotalAmount() - payment.getAmountPaid();
    %>
    <tr>
        <td><%=i%></td>
        <td><%=payment.getCompanyName()%></td>
        <td><%=payment.getTotalAmount()%></td>
        <td><%=payment.getAmountPaid()%></td>
        <td><%=balance%></td>
        <td><%=payment.getPaymentDate()%></td>
        <td><%=payment.getPaymentStatus()%></td>
        <td><a href="EditPaymentAmount.jsp?paymentId=<%=payment.getPaymentId()%>">EDIT AMOUNT</a></td>
    </tr>
    <%
            i++;
        }
    %>
</table>

</body>
</html>
