<%@ page import="com.mvc.dao.PaymentDAO" %>

<%
    int paymentId = Integer.parseInt(request.getParameter("paymentId"));
    float newAmount = Float.parseFloat(request.getParameter("amountPaid"));

    boolean flag = PaymentDAO.updateAmountPaid(paymentId, newAmount);

    if (flag) {
        response.sendRedirect("ViewPayment.jsp");
    } else {
        response.sendRedirect("EditPaymentAmount.jsp?paymentId=" + paymentId);
    }
%>
