<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/29/23
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="h1">Are you delete your ad? <br/> This action cannot be undone!</div>
<form action="deleteAd" method="post">
    <div class="title">${sessionScope.adToDelete.title}</div>
    <div class="description">${sessionScope.adToDelete.description}</div>
    <input type="hidden" name="ad_id" value="${sessionScope.adToUpdate.id}">
    <br/><br/>
    <button type="submit" class="btn btn-danger">Yes</button>
    <a href="/profile" class="btn btn-info">No</a>
</form>


</body>
</html>
