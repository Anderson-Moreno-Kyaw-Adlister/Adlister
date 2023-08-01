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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") == null) {
            String currentURL = request.getRequestURL().toString();
            request.getSession().setAttribute("intendedRedirect", currentURL);
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }


        //Sets attribute if not previously set
        if (request.getSession().getAttribute("failed") == null) {
            request.getSession().setAttribute("failed", false);
        }


        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        request.getSession().setAttribute("message", "Oops! Something went wrong.");

        User loggedInUser = (User) request.getSession().getAttribute("user");

        String title = request.getParameter("title").trim();
        String description = request.getParameter("description").trim();
        String[] categories = request.getParameterValues("categories"); //Pulls cats from jsp

        boolean isValidTitle = isValidTitle(title);
        boolean isValidDescription = isValidDescription(description);
        boolean isValidCategories =isValidCategories(categories);
        // ... perform validation on other form fields

        // Store the valid data in a Map
        Map<String, String> validData = new HashMap<>();
        if (isValidTitle) {
            validData.put("title", title);
        }
        if (isValidDescription) {
            validData.put("description", description);
        }
        if (isValidCategories) {
            validData.put("categories", String.join(",", categories));
        }
        request.getSession().setAttribute("validData", validData);

        // Validate input
        //Sets message and failed attributes reloads page
        if (title.equals("")) {
            request.getSession().setAttribute("message", "Please enter a title!");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/ads/create");
            return;
        } else if (description.equals("")) {
            request.getSession().setAttribute("message", "Please enter a description");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/ads/create");
            return;
        } else if (categories == null) {
            request.getSession().setAttribute("message", "Please select at least one category");
            request.getSession().setAttribute("failed", true);
            response.sendRedirect("/ads/create");
            return;
        }

        Ad ad = new Ad(
            loggedInUser.getId(),
                title,
                description
        );

        long index = DaoFactory.getAdsDao().insert(ad);

        //For loop used here, each selected category sent to method in MySQLAdsDao
        for (String category : categories) {
            try {
                DaoFactory.getAdsDao().setCategories(index, category);
            } catch (SQLException e) {
                request.getSession().setAttribute("failed", true);
                response.sendRedirect("/ads/create");
                return;
            }
        }

        response.sendRedirect("/ads");
        request.getSession().removeAttribute("validData");
    }

    private boolean isValidTitle(String title) {
        return title != null && !title.trim().isEmpty();
    }
    private boolean isValidDescription(String description) {
        return description != null && !description.trim().isEmpty();
    }

    private boolean isValidCategories(String[] categories) {
        return categories != null && categories.length > 0;
    }
}
