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

        if (request.getSession().getAttribute("failed") == null) {
            request.getSession().setAttribute("failed", false);
        }

        // Forward the request to the JSP for displaying the update form
        request.getRequestDispatcher("/WEB-INF/updateProfile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Retrieve the current user from the session
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

//        // Get the current password entered by the user
//        String currentPassword = request.getParameter("password");
//
//        // Validate the current password
//        boolean isValidPassword = Password.check(currentPassword, user.getPassword());
//        if (!isValidPassword) {
//            response.sendRedirect("/profile");
//            return;
//        }

        // Retrieve the new username, email, and password from the form
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        // Validate input
        //Sets message and failed attributes reloads page
        if (newUsername.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid username");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/updateProfile");
            return;
        }else if (newEmail.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid email");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/updateProfile");
            return;
        } else if (newPassword.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid password");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/updateProfile");
            return;
        } else if ((!newPassword.equals(confirmPassword))) {
            request.getSession().setAttribute("message", "Please confirm password");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/updateProfile");
            return;
        }

        // Update the user's information
        user.setUsername(newUsername);
        user.setEmail(newEmail);

        String hash = Password.hash(newPassword);
        user.setPassword(hash);

        // Save the updated user in the database
        DaoFactory.getUsersDao().updateProfile(user);

        response.sendRedirect("/profile");

    }
}

