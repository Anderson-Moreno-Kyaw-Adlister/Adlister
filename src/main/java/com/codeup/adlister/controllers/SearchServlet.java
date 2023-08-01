package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/search")
public class SearchServlet extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String searchTerm = req.getParameter("search");

        if (!searchTerm.equals("")) {
            try {
                req.setAttribute("search", searchTerm);
                req.setAttribute("ads", DaoFactory.getAdsDao().searchAds(searchTerm));
            } catch (SQLException e) {
                resp.sendRedirect("/error-page.jsp");;
            }
            req.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/ads");
        }
    }
}
