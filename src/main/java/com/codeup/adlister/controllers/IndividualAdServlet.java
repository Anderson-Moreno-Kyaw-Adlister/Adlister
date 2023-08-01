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



    @WebServlet(name="IndividualAdServlet", urlPatterns = "/ads/individualad")
    public class IndividualAdServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            long adId = Long.parseLong(request.getParameter("ad_id"));
            request.setAttribute("individualAd", DaoFactory.getAdsDao().findAdByID(adId));
                request.getRequestDispatcher("/WEB-INF/ads/individualad.jsp").forward(request, response);
    }












}
