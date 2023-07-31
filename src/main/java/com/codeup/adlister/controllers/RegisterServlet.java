package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!=null){
            response.sendRedirect("/profile");
            return;
        }

        if (request.getSession().getAttribute("failed") == null) {
            request.getSession().setAttribute("failed", false);
        }

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // Validate input
        //Sets message and failed attributes reloads page
        if (username.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid username");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/register");
            return;
        }else if (email.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid email");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/register");
            return;
        } else if (password.isEmpty()) {
            request.getSession().setAttribute("message", "Please enter a valid password");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/register");
            return;
        } else if ((! password.equals(passwordConfirmation))) {
            request.getSession().setAttribute("message", "Please confirm password");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/register");
            return;
        } else if (DaoFactory.getUsersDao().findByUsername(username) != null) {
            request.getSession().setAttribute("message", "Username already in use");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        User user = new User(username, email, password);

        // hash the password

        String hash = Password.hash(user.getPassword());

        user.setPassword(hash);

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
