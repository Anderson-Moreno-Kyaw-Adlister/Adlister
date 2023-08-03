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

    <div class="container">
        <div class="directions">
        <h1>Please Log In</h1>
        </div>
        <div class="form-container">
        <form action="${pageContext.request.contextPath}/login" method="POST">
            <div class="form-group">
                <label for="username" class="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password" class="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="login-button w-100">
            <input type="submit" class="login-button my-3 mx-auto w-100 btn btn-outline-danger" value="Log In">
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>
