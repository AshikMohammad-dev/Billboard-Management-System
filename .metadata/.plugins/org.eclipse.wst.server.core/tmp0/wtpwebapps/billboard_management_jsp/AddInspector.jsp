<%@ include file="Header.jsp" %>
<%@ page import="com.mvc.bean.LoginBean" %>
<%@ page import="com.mvc.dao.InspectorDAO" %>
<%@ page import="java.util.List" %>

    <script>
        function valForm() {
            if (document.addInspectorForm.loginId.value == "") {
                alert("Select a Login Account");
                document.addInspectorForm.loginId.focus();
                return false;
            }
            if (document.addInspectorForm.inspectorName.value == "") {
                alert("Enter Inspector Name");
                document.addInspectorForm.inspectorName.focus();
                return false;
            }
            if (document.addInspectorForm.phone.value == "") {
                alert("Enter Phone Number");
                document.addInspectorForm.phone.focus();
                return false;
            }
            if (isNaN(document.addInspectorForm.phone.value)) {
                alert("Enter a valid Phone Number");
                document.addInspectorForm.phone.focus();
                return false;
            }
            document.addInspectorForm.submit();
        }
    </script>

    <%
    List<LoginBean> logins = InspectorDAO.getInspectorLogins();
    %>

    <h2 align="center">Add Inspector</h2>

    <form name="addInspectorForm" method="post" action="AddInspectorAction.jsp">

        Login Account
        <select name="loginId">
            <option value="">-- Select Login --</option>
            <% for (LoginBean lb : logins) { %>
                <option value="<%=lb.getLoginId()%>"><%=lb.getLoginUsername()%></option>
            <% } %>
        </select><br><br>

        Inspector Name <input type="text" name="inspectorName" placeholder="Enter name" /><br><br>

        Phone <input type="text" name="phone" placeholder="Enter phone number" /><br><br>

        <input type="submit" value="Add Inspector" onclick="return valForm();" />

    </form>

</body>
</html>
