<%@ page import="com.codeup.adlister.models.User" %>
<style><%@include file="/CSS/navbar.css"%></style>
<jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Please Log In" />
</jsp:include>
<nav class="navbar navbar-expand-lg bg-body-transparent row">
    <div class="container-fluid">
        <a class="navbar-brand p-2 col" href="/ads">Chicken Lister</a>
        <button class="navbar-toggler btn btn-outline-danger opacity-50 p-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon btn btn-danger btn-lg"></span>
        </button>
        <div class="collapse navbar-collapse col" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <% User user = (User) session.getAttribute("user");
                    if (user == null) { %>
                <li class="nav-item">
                    <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" aria-current="page" href="/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" href="/register">Register</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" href="/logout">Logout</a>
                </li> <li class="nav-item">
                <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" href="/profile">Profile</a>
            </li> <li class="nav-item">
                <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" href="/updateProfile">Update Profile</a>
            </li> <li class="nav-item">
                <a class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover m-3 p-2 col" href="/ads/create">Create Ad</a>
                <% } %>
            </ul>
            <form class="d-flex col-4 p-2" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-danger" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
        <ul class="nav navbar-nav navbar-right">

            <% User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
            <li class="login"><a href="/login">Login</a></li>
            <li class="register"> <a href="/register"> Register</a> </li>
            <%
            }else{
            %>
            <li class="logout"><a href="/logout">Logout</a></li>
            <li class="profile"> <a href="/profile"> Profile</a> </li>
            <li class="updateprofile"> <a href="/updateProfile"> Update Profile</a> </li>
            <li class="createad"> <a href="/ads/create"> Create Ad</a> </li>
            <li class="deletead"> <a href="/ads/deleteAd"> Delete Ad</a> </li>
        </ul>
        <%
            }
        %>
        <div class="search-form">
        <form action="/search" method="GET">
            <label for="search">Search</label>
            <input id="search" name="search" type="text">
            <button type="submit">Search</button>
        </form>

    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
