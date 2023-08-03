<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/createad.css"%></style>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<div id="createimage">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container position-absolute top-50 start-50 translate-middle fill-info">
        <h1>Create a new Ad</h1>

        <%--  Shows message if previous failure--%>
        <c:choose>
            <c:when test="${failedCreate}">
                <h4 class="text-warning"><c:out value="${message}" /></h4>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>

        <form action="/ads/create" method="POST">
            <div class="form-group">
                <label for="title" class="text-danger">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${validData.title}">
            </div>
            <div class="form-group">
                <label for="description" class="text-danger">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${validData.description}</textarea>
            </div>
<%--            Added checkboxes for catagories to jsp--%>
            <div>
                <input type="checkbox" id="White" name="categories" value="White">
                <label for="White" class="text-danger">White</label>
                <input type="checkbox" id="Brown" name="categories" value="Brown">
                <label for="Brown" class="text-danger">Brown</label>
                <input type="checkbox" id="Tinted" name="categories" value="Tinted">
                <label for="Tinted" class="text-danger">Tinted</label>
                <input type="checkbox" id="Egg Layers" name="categories" value="Egg Layers">
                <label for="Egg Layers" class="text-danger">Egg Layers</label>
                <input type="checkbox" id="Meat Birds" name="categories" value="Meat Birds">
                <label for="Meat Birds" class="text-danger">Meat Birds</label>
                <input type="checkbox" id="Pets" name="categories" value="Pets" >
                <label for="Pets"class="text-danger">Pets</label>
            </div>
            <input type="submit" class="btn btn-block btn-outline-danger my-3 w-100">
        </form>
    </div>
</div>
</body>
</html>
