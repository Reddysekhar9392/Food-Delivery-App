package com.Foodiee.Servlet;

import java.io.IOException;
import java.util.List;

import com.Foodiee.DAOImpl.RestaurantDAOImpl;
import com.Foodiee.model.Restaurant;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            RestaurantDAOImpl restaurantDaoImplementation = new RestaurantDAOImpl();
            List<Restaurant> allRestaurants = restaurantDaoImplementation.getAllRestaurants();

            // Store the list as a request attribute so the JSP can access it
            request.setAttribute("allRestaurants", allRestaurants);
            
            // Forward (same request object) to the JSP
            RequestDispatcher rd = request.getRequestDispatcher("restaurant.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}