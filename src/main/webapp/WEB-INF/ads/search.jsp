<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Andy
  Date: 7/27/23
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Viewing All The Ads" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
  <h1>Results for "${search}"</h1>

  <c:forEach var="ad" items="${ads}">
    <div class="col-md-6">
      <h2><c:out value="${ad.title}"/></h2>
      <p>${ad.description}</p>
    </div>
  </c:forEach>
</div>
</body>
</html>
