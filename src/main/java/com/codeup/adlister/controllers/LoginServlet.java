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

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("failedLogin") == null) {
            request.getSession().setAttribute("failedLogin", false);
        }

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        if (user == null) {
            request.getSession().setAttribute("message", "Incorrect login");
            request.getSession().setAttribute("failedLogin", true);
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());

        if (validAttempt) {
            request.getSession().setAttribute("failedLogin", false);

            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("userId", user.getId());
            String intendedRedirect = (String) request.getSession().getAttribute("intendedRedirect");
            if (intendedRedirect != null && !intendedRedirect.isEmpty()) {
                request.getSession().removeAttribute("intendedRedirect");
                response.sendRedirect(intendedRedirect);
            } else {
                response.sendRedirect("/profile");
            }
        } else {
            request.getSession().setAttribute("message", "Incorrect login");
            request.getSession().setAttribute("failedLogin", true);
            response.sendRedirect("/login");
        }
    }
}
