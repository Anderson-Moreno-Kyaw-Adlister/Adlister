<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/28/23
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <h1>Error</h1>
    <h2><c:out value="${message}"/></h2>
</body>
</html>
