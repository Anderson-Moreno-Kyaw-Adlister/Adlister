<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/29/23
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/deletead.css"%></style>
<html>
<head>
    <title>Update your Ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<div id="deleteadimage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container position-absolute top-50 start-50 translate-middle fill-info">

    <h1>Delete your Ad </h1>
    <form action="/ads/deleteAd" method="post">
        <div class="form-group">
    <input type="hidden" name="ad_id" value="${sessionScope.adToDelete.id}">
        <button type="submit" class="btn btn-outline-danger my-3 w-100">CONFIRM DELETE</button>

        <button type="submit" name="ad_id" class="btn btn-outline-success my-3 w-100">
            <a href="${pageContext.request.contextPath}/profile">GO BACK TO PROFILE</a>
        </button>
        </div>
    </form>
</div>
</div>

</body>
</html>
