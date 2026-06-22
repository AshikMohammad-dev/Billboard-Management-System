<%@ page import="com.mvc.bean.PaymentBean" %>
<%@ page import="com.mvc.dao.PaymentDAO" %>
<%@ page import="java.sql.Date" %>

<%
    int purchaseId = Integer.parseInt(request.getParameter("purchaseId"));
    float amountPaid = Float.parseFloat(request.getParameter("amountPaid"));
    String paymentDateStr = request.getParameter("paymentDate");
    String paymentStatus = request.getParameter("paymentStatus");

    PaymentBean paymentBean = new PaymentBean();
    paymentBean.setPurchaseId(purchaseId);
    paymentBean.setAmountPaid(amountPaid);
    paymentBean.setPaymentDate(Date.valueOf(paymentDateStr));
    paymentBean.setPaymentStatus(paymentStatus);

    boolean flag = PaymentDAO.addPayment(paymentBean);

    if (flag) {
        response.sendRedirect("ViewPayment.jsp");
    } else {
        response.sendRedirect("AddPayment.jsp");
    }
%>
