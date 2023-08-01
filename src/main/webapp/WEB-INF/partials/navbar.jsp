<%@ page import="com.codeup.adlister.models.User" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <% User user = (User) session.getAttribute("user");
            if (user == null) {
        %>
            <li><a href="/login">Login</a></li>
            <li> <a href="/register"> Register</a> </li>
            <%
            }else{
            %>
            <li><a href="/logout">Logout</a></li>
            <li> <a href="/profile"> Profile</a> </li>
            <li> <a href="/updateProfile"> Update Profile</a> </li>
            <li> <a href="/ads/create"> Create Ad</a> </li>
            <li> <a href="/ads/deleteAd"> Delete Ad</a> </li>
        </ul>
        <%
            }
        %>
        <form action="/search" method="GET">
            <label for="search">Search</label>
            <input id="search" name="search" type="search">
            <button type="submit">Search</button>
        </form>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
