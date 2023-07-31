<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/29/23
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <h1>Delete your Ad </h1>
    <form action="/ads/deleteAd" method="post">
        <div class="form-group">
    <input type="hidden" name="ad_id" value="${sessionScope.adToDelete.id}">
        <button type="submit" class="btn btn-danger">CONFIRM DELETE</button>

        <button type="submit" name="ad_id">
            <a href="${pageContext.request.contextPath}/profile" class="btn btn-info">GO BACK TO PROFILE</a></button>
        </div>
    </form>
</div>

</body>
</html>
