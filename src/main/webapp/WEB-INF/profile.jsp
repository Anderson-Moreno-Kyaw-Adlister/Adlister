<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style><%@include file="/CSS/profile.css"%></style>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<div id="background-image">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome to Your Profile, ${sessionScope.user.username}!</h1>

        <h2>Your Ads:</h2>
        <c:forEach var="userAd" items="${userAds}">
            <div>
                <h3 class="text-danger ">${userAd.title}</h3>
                <p class="text-danger">${userAd.description}</p>
                <c:url value="/ads/updateAd" var="updateAdUrl">
                    <c:param name="ad_id" value="${userAd.id}" />
                </c:url>
                <a href="${updateAdUrl}"><button class="btn btn-outline-danger my-3">Update the ad!</button></a>
                <c:url value="/ads/deleteAd" var="updateAdUrl">
                    <c:param name="ad_id" value="${userAd.id}" />
                </c:url>
                <a href="${updateAdUrl}"><button class="btn btn-outline-danger my-3">Deleting the ad!</button></a>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
