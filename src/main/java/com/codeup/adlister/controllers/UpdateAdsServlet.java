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

@WebServlet(name="UpdateAdsServlet", urlPatterns = "/ads/updateAd")
public class UpdateAdsServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            String currentURL = request.getRequestURL().toString();
            request.getSession().setAttribute("intendedRedirect", currentURL);
            response.sendRedirect("/login");
            return;
        }

        long adId = Long.parseLong(request.getParameter("ad_id"));
        Ad adToUpdate = DaoFactory.getAdsDao().findAdByID(adId);
        request.getSession().setAttribute("adToUpdate", adToUpdate);
        request.getRequestDispatcher("/WEB-INF/ads/updateAd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long adId = Long.parseLong(request.getParameter("ad_id"));
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("updateTitle");
        String description = request.getParameter("updateDescription");
        if (title != null && description != null) {
            Ad changedAd = new Ad(
                    adId,
                    user.getId(),
                    title,
                    description
            );
            DaoFactory.getAdsDao().updateAd(changedAd);
        }
        response.sendRedirect("/profile");
    }
}
