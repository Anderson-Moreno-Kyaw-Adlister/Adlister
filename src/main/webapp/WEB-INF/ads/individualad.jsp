<%--
  Created by IntelliJ IDEA.
  User: michaellamoreno
  Date: 8/1/23
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>
<<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Individual Ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="individualad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>Ads</h1>
<h2>${individualAd.title}</h2>
<h3>${individualAd.description}</h3>
</body>
</html>