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
  <style><%@include file="/CSS/search.css"%></style>
</head>
<body>
<div id="display-ad">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container row-col-auto position-absolute top-50 start-50 translate-middle">
  <h1 class="mb-3 text-center header mb-4" id="ad-list">Results for "${search}"</h1>
  <div class="row d-flex justify-content-center">
      <table class="table-striped-rows bg-transparent table-data text-danger w-75">
        <thead>
        <tr class="bg-transparent">
          <th scope="col">Title</th>
          <th scope="col">Description</th>
          <th scope="col">Individual Ad</th>
        </tr>
        </thead>
        <c:forEach var="ad" items="${ads}">
          <tbody>
          <tr class="pl-5 m-5">
            <td>${ad.title}</td>
            <td >${ad.description}</td>
            <td>
              <c:url value="/ads/individualad" var="individualadUrl">
                <c:param name="ad_id" value="${ad.id}" />
              </c:url>
              <a href="${individualadUrl}"><button type="button" class="btn btn-outline-danger"> Individual Ad </button></a>
            </td>
          </tbody>
        </c:forEach>
      </table>
    </div>
  </div>
</div>
</body>
</html>
