<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/27/23
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update your Ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Update your Ad</h1>

    <%--  Shows message if previous failure--%>
    <c:choose>
        <c:when test="${failedUpdateAd}">
            <h4><c:out value="${message}" /></h4>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

    <form action="/ads/updateAd" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="updateTitle" class="form-control" type="text" value="${sessionScope.adToUpdate.title}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="updateDescription" class="form-control" type="text" value="${sessionScope.adToUpdate.description}">
        </div>
        <input type="hidden" name="ad_id" value="${sessionScope.adToUpdate.id}">
        <button type="submit" class="btn btn-info">CONFIRM UPDATE</button>
    </form>
</div>
</body>
</html>
