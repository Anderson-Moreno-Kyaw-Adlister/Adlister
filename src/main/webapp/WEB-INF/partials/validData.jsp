<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/31/23
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Filtering Valid Data</title>
</head>
<body>
<%-- Check for validation errors and display them --%>
<% if (request.getSession().getAttribute("formErrors") != null) {
    List<String> errors = (List<String>) request.getSession().getAttribute("formErrors");
    for (String error : errors) {
%>
<p class="error-message"><%= error %></p>
<% }
    // Clear the formErrors after displaying them
    request.getSession().removeAttribute("formErrors");
} %>

<%-- Prefill form fields with previously submitted data --%>
<input type="text" name="username" value="<%= request.getParameter("username") %>">
<input type="email" name="email" value="<%= request.getParameter("email") %>">

</body>
</html>
