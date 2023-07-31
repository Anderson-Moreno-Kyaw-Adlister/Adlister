<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container d-flex-row">
    <h1 class="h1 row text-center header">Welcome, ${sessionScope.user.username}!</h1>
    <div class="row d-flex">
        <div class="userAds container col-8">
            <h2>Here are all your ads!</h2>
            <table class="table table-striped-rows">
                <thead>
                <th scope="col">Title</th>
                <th scope="col">Description</th>
                </thead>
                <c:forEach var="userAd" items="${userAds}">
                    <tbody>
                    <tr>
                        <td>${userAd.title}</td>
                        <td >${userAd.description}</td>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>



