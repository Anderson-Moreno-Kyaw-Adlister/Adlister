<%--
  Created by IntelliJ IDEA.
  User: michaellamoreno
  Date: 8/1/23
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/individualad.css"%></style>
<html>
<head>
    <title>Individual Ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="individualad"/>
    </jsp:include>
</head>
<body>
<div id="indiviualad">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="card text-danger bg-transparent my-3 w-75 col mx-auto">
        <div class="card-body w-75">
<h1>Individual Ad</h1>
<h2 class="text-danger">${individualAd.title}</h2>
<h3 class="text-danger">${individualAd.description}</h3>
        </div>
    </div>
</div>
</body>
</html>