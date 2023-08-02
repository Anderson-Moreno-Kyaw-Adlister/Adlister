<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>

        <%--  Shows message if previous failure--%>
        <c:choose>
            <c:when test="${failed}">
                <h4><c:out value="${message}" /></h4>
            </c:when>
            <c:otherwise>
            </c:otherwise>
        </c:choose>

        <form action="/ads/create" method="POST">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
<%--            Added checkboxes for catagories to jsp--%>
            <div>
                <input type="checkbox" id="White" name="categories" value="White">
                <label for="White">White</label>
                <input type="checkbox" id="Brown" name="categories" value="Brown">
                <label for="Brown">Brown</label>
                <input type="checkbox" id="Tinted" name="categories" value="Tinted">
                <label for="Tinted">Tinted</label>
                <input type="checkbox" id="Egg Layers" name="categories" value="Egg Layers">
                <label for="Egg Layers">Egg Layers</label>
                <input type="checkbox" id="Meat Birds" name="categories" value="Meat Birds">
                <label for="Meat Birds">Meat Birds</label>
                <input type="checkbox" id="Pets" name="categories" value="Pets">
                <label for="Pets">Pets</label>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
