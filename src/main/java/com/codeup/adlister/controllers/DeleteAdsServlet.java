package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/ads/deleteAd")
public class DeleteAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        long adId = Long.parseLong(request.getParameter("ad_id"));
        Ad adToDelete = DaoFactory.getAdsDao().findAdByID(adId);
        request.getSession().setAttribute("adToDelete", adToDelete);
        request.getRequestDispatcher("/WEB-INF/ads/deleteAd.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long adId = Long.parseLong(request.getParameter("ad_id"));
        DaoFactory.getAdsDao().deleteAd(adId);
        response.sendRedirect("/profile");

    }
}

