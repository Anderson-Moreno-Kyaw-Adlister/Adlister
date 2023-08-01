package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the current user from the session
        User user = (User) request.getSession().getAttribute("user");

        // Set user attributes as request attributes to pre-fill the form
        request.setAttribute("username", user.getUsername());
        request.setAttribute("email", user.getEmail());

        // Forward the request to the JSP for displaying the update form
        request.getRequestDispatcher("/WEB-INF/updateProfile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve the current user from the session
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            String currentURL = request.getRequestURL().toString();
            request.getSession().setAttribute("intendedRedirect", currentURL);
            response.sendRedirect("/login");
            return;
        }
        // Retrieve the new username, email, and password from the form
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        // Validate input
        boolean inputHasErrors = newUsername.isEmpty()
                || newEmail.isEmpty()
                || newPassword.isEmpty()
                || (!newPassword.equals(confirmPassword));

        if (inputHasErrors) {
            response.sendRedirect("/updateProfile");
            return;
        }

        // Update the user's information
        user.setUsername(newUsername);
        user.setEmail(newEmail);

        if (!newPassword.isEmpty()) {
            String hash = Password.hash(newPassword);
            user.setPassword(hash);
        }

        // Save the updated user in the database
        DaoFactory.getUsersDao().updateProfile(user);

        response.sendRedirect("/profile");

    }
}

