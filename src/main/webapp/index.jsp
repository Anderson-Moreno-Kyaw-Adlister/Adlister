<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <style><%@include file="/CSS/webapp_index.css"%></style>
    <title>Welcome to the ChickenLister</title>
</head>
<body>
    <div id="chicken-image">
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    </div>
    <div class="container">
        <h1 class="title">Welcome to the ChickenLister!</h1>
    </div>
</body>
</html>
