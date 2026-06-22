<%@ page import="com.mvc.bean.BillboardPurchaseBean" %>
<%@ page import="com.mvc.dao.BillboardPurchaseDAO" %>

<%@ page import="java.sql.Date" %>

<%
    // ---------- 1. GET FORM VALUES ----------
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    int locSizeId  = Integer.parseInt(request.getParameter("locSizeId"));
    String startDateStr = request.getParameter("startDate");
    int duration   = Integer.parseInt(request.getParameter("duration"));


    float price  = BillboardPurchaseDAO.getPrice(locSizeId);
    float amount = price * duration;


    BillboardPurchaseBean purchaseBean = new BillboardPurchaseBean();
    purchaseBean.setCustomer_id(customerId);
    purchaseBean.setLocsize_id(locSizeId);
    purchaseBean.setStart_date(Date.valueOf(startDateStr));  // "yyyy-MM-dd" from date input
    purchaseBean.setDuration(duration);
    purchaseBean.setAmount(amount);

 
    boolean flag = BillboardPurchaseDAO.addPurchase(purchaseBean);


    if(flag) {
        response.sendRedirect("ViewPurchase.jsp");
    } else {
        response.sendRedirect("PurchaseForm.jsp");
    }
%>