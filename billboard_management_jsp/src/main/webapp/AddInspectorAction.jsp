<%@page import="com.mvc.bean.InspectorBean"%>
<%@page import="com.mvc.dao.InspectorDAO"%>

<%
	int loginId = Integer.parseInt(request.getParameter("loginId"));
	String inspectorName = request.getParameter("inspectorName");
	long phone = Long.parseLong(request.getParameter("phone"));

	InspectorBean inspectorBean = new InspectorBean();

	inspectorBean.setLoginId(loginId);
	inspectorBean.setInspectorName(inspectorName);
	inspectorBean.setPhone(phone);

	boolean status = InspectorDAO.addInspector(inspectorBean);

	if(status){
		response.sendRedirect("ViewInspector.jsp");
	}else{
		out.println("Error.jsp");
	}
%>