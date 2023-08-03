<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/register.css"%></style>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
<div id="hen-hen">

    <jsp:include page="partials/navbar.jsp" />

        <div class="container position-absolute top-50 start-50 translate-middle fill-info">
        <h1>Please fill in your information.</h1>

        <%--  Shows message if previous failure--%>
        <c:choose>
            <c:when test="${failedRegister}">
                <h4 class="text-warning"><c:out value="${message}" /></h4>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>

        <form action="/register" method="post">
            <div class="form-group">
                <label for="username" class="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="email" class="email">Email</label>
                <input id="email" name="email" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password" class="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password" class="confirm-password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-outline-danger my-3 w-100 btn-block">
        </form>
        </div>
    </div>
</body>
</html>
