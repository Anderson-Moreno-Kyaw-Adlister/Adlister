package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        if (loggedInUser == null) {
            // Redirect to the login page if the user is not logged in
            response.sendRedirect("/login");
            return;
        }
        List<Ad> userAds = DaoFactory.getAdsDao().userAds(loggedInUser.getId());

        // Set the userAds attribute in the request
        request.setAttribute("userAds", userAds);
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}




