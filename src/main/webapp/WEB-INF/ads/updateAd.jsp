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
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad" />
    </jsp:include>

    <style>
        h1 {
            display: flex;
            justify-content: space-around;
            font-size: 100px;
            margin: 15px auto;
            color: black;
        }
    </style>

</head>
<body>
<div class="container">
    <h1>Update your Ad</h1>
    <form action="updateAd" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="updateTitle" class="form-control" type="text" placeholder="${sessionScope.adToUpdate.title}" value="${sessionScope.adToUpdate.title}">
        </div>
        <div class="form-group">
            <label for="description">Title</label>
            <input id="description" name="updateDescription" class="form-control" type="text" placeholder="${sessionScope.adToUpdate.description}" value="${sessionScope.adToUpdate.description}">
        </div>
        <input type="hidden" name="ad_id" value="${sessionScope.adToUpdate.id}">
        <button type="submit" class="btn btn-info">CONFIRM UPDATE</button>
    </form>
</div>


</body>
</html>