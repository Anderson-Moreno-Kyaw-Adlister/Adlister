<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khinememekyaw
  Date: 7/29/23
  Time: 3:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="partials/head.jsp">
    <jsp:param name="title" value="Register For Our Site!" />
  </jsp:include>
</head>
<body>

<%--  Shows message if previous failure--%>
<c:choose>
  <c:when test="${failed}">
    <h4><c:out value="${message}" /></h4>
  </c:when>
  <c:otherwise>
  </c:otherwise>
</c:choose>

<jsp:include page="partials/navbar.jsp" />
<div class="container">

  <h1>Updating the profile</h1>

<%--  Shows message if previous failure--%>
  <c:choose>
    <c:when test="${failedUpdate}">
      <h4><c:out value="${message}" /></h4>
    </c:when>
    <c:otherwise>
    </c:otherwise>
  </c:choose>

  <form action="${pageContext.request.contextPath}/updateProfile" method="post">
    <div class="form-group">
      <label for="new_username">New Username</label>
      <input id="new_username" name="username" class="form-control" type="text">
    </div>
    <div class="form-group">
      <label for="new_email">New Email</label>
      <input id="new_email" name="email" class="form-control" type="text">
    </div>
    <div class="form-group">
      <label for="new_password">New Password</label>
      <input id="new_password" name="new_password" class="form-control" type="password"> <!-- Add name="new_password" here -->
    </div>
    <div class="form-group">
      <label for="confirm_password">Confirm Password</label>
      <input id="confirm_password" name="confirm_password" class="form-control" type="password"> <!-- Add name="confirm_password" here -->
    </div>
    <input type="submit" class="btn btn-primary btn-block" value="save changes">
  </form>
</div>
</body>
</html>




