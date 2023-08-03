<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/CSS/register.css"%></style>
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
<div id="updateprofileimage">
<%--  Shows message if previous failure--%>
<c:choose>
  <c:when test="${failed}">
    <h4 class="text-warning"><c:out value="${message}" /></h4>
  </c:when>
  <c:otherwise>
  </c:otherwise>
</c:choose>

<jsp:include page="partials/navbar.jsp" />
<div class="container position-absolute top-50 start-50 translate-middle fill-info">

  <h1>Updating the profile</h1>

<%--  Shows message if previous failure--%>
  <c:choose>
    <c:when test="${failedUpdate}">
      <h4 class="text-warning"><c:out value="${message}" /></h4>
    </c:when>
    <c:otherwise>
    </c:otherwise>
  </c:choose>

  <form action="${pageContext.request.contextPath}/updateProfile" method="post">
    <div class="form-group">
      <label for="new_username" class="newusername">New Username</label>
      <input id="new_username" name="username" class="form-control" type="text">
    </div>
    <div class="form-group">
      <label for="new_email" class="newemail">New Email</label>
      <input id="new_email" name="email" class="form-control" type="text">
    </div>
    <div class="form-group">
      <label for="new_password" class="newpassword">New Password</label>
      <input id="new_password" name="new_password" class="form-control" type="password"> <!-- Add name="new_password" here -->
    </div>
    <div class="form-group">
      <label for="confirm_password"class="confirmpassword">Confirm Password</label>
      <input id="confirm_password" name="confirm_password" class="form-control" type="password"> <!-- Add name="confirm_password" here -->
    </div>
    <input type="submit" class="btn btn-outline-danger my-3 w-100 btn-block" value="save changes">
  </form>
</div>
</div>
</body>
</html>




