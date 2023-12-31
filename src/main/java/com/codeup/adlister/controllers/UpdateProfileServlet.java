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
        if (request.getSession().getAttribute("failedUpdate") == null) {
            request.getSession().setAttribute("failedUpdate", false);
        }

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

        boolean isUnique = DaoFactory.getUsersDao().findByUsername(newUsername) == null;
        boolean isCurrentUser = newUsername.equals(user.getUsername());

        // Validate input and Update the user's information
        if (!newUsername.isEmpty()) {
            if (!isUnique && !isCurrentUser) {
                System.out.println("here");
                request.getSession().setAttribute("message", "Username already exists");
                request.getSession().setAttribute("failedUpdate", true);
                response.sendRedirect("/updateProfile");
                return;
            } else {
                user.setUsername(newUsername);
            }
        }

        if (!newEmail.isEmpty()) {
            user.setEmail(newEmail);
        }

        if (!newPassword.isEmpty()) {
            if ((!newPassword.equals(confirmPassword))) {
                request.getSession().setAttribute("message", "Please confirm password");
                request.getSession().setAttribute("failedUpdate", true);
                response.sendRedirect("/updateProfile");
                return;
            } else {
                String hash = Password.hash(newPassword);
                user.setPassword(hash);
            }
        }

        // Save the updated user in the database
        DaoFactory.getUsersDao().updateProfile(user);

        //Resets failedUpdate attribute
        request.getSession().setAttribute("failedUpdate", false);

        response.sendRedirect("/profile");
    }
}

