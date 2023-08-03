<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/login.css"%></style>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
<div id="baby-chicks">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container position-absolute top-50 start-50 translate-middle">
        <h1>Please Log In</h1>

        <%--  Shows message if previous failure--%>
        <c:choose>
            <c:when test="${failedLogin}">
                <h4 class="text-warning"><c:out value="${message}" /></h4>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>

        <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="form-group">
                <label for="username" class="username1">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password" class="password2">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-outline-danger my-3 w-100 btn-block" value="Log In">
        </form>
    </div>
</div>
</body>
</html>
