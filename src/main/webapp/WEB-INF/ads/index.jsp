<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container d-flex-row">
    <h1 class="h1 row text-center header">Displaying All the Ads!</h1>
    <div class="row d-flex">
        <div class="userAds container col-8">
            <table class="table table-striped-rows">
                <thead>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                <th scope="col">Individual Ad</th>
                </thead>
                <c:forEach var="ad" items="${ads}">
                    <tbody>
                    <tr>
                        <td>${ad.title}</td>
                        <td >${ad.description}</td>
                       <td>
                        <c:url value="/ads/individualad" var="individualadUrl">
                            <c:param name="ad_id" value="${ad.id}" />
                        </c:url>
                        <a href="${individualadUrl}"><button type="button" class="btn btn-danger"> Individual Ad </button></a>
                       </td>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>

