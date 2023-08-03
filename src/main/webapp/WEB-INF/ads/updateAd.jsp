<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/27/23
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/updatead.css"%></style>
<html>
<head>
    <title>Update your Ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<div id="updateadimage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container position-absolute top-50 start-50 translate-middle fill-info">
    <h1>Update your Ad</h1>

    <%--  Shows message if previous failure--%>
    <c:choose>
        <c:when test="${failedUpdateAd}">
            <h4 class="text-warning"><c:out value="${message}" /></h4>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <form action="/ads/updateAd" method="post">
        <div class="form-group">
            <label for="title" class="title-update">Title</label>
            <input id="title" name="updateTitle" class="form-control" type="text" value="${sessionScope.adToUpdate.title}">
        </div>
        <div class="form-group">
            <label for="description" class="description-update">Description</label>
            <input id="description" name="updateDescription" class="form-control" type="text" value="${sessionScope.adToUpdate.description}">
        </div>
        <input type="hidden" name="ad_id" value="${sessionScope.adToUpdate.id}">
        <button type="submit" class="btn btn-outline-danger my-3 w-100">CONFIRM UPDATE</button>
    </form>
</div>
</div>
</body>
</html>
