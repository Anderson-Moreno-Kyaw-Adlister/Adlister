<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <input id="title" name="title" class="form-control" type="text" value="${validData.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${validData.description}</textarea>
            </div>
<%--            Added checkboxes for catagories to jsp--%>
            <div>
                <input type="checkbox" id="cat1" name="categories" value="cat1" ${fn:contains(validData.categories, 'cat1') ? 'checked' : ''}>
                <label for="cat1">Cat 1</label>
                <input type="checkbox" id="cat2" name="categories" value="cat2" ${fn:contains(validData.categories, 'cat2') ? 'checked' : ''}>
                <label for="cat2">Cat 2</label>
                <input type="checkbox" id="cat3" name="categories" value="cat3" ${fn:contains(validData.categories, 'cat3') ? 'checked' : ''}>
                <label for="cat3">Cat 3</label>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
