<%@ page import="com.codeup.adlister.models.User" %>
<style><%@include file="/CSS/navbar.css"%></style>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">ChickenLister</a>
        </div>
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
