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
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            System.out.println("RestaurantServlet called");

            RestaurantDAOImpl dao =
                    new RestaurantDAOImpl();

            List<Restaurant> restaurants =
                    dao.getAllRestaurants();

            System.out.println(
                "Restaurants found: " +
                restaurants.size()
            );

            req.setAttribute(
                "restaurants",
                restaurants
            );

            RequestDispatcher rd =
                req.getRequestDispatcher(
                    "/restaurant.jsp"
                );

            rd.forward(req, resp);

        } catch (Exception e) {

            System.out.println(
                "ERROR in RestaurantServlet"
            );

            e.printStackTrace();

            throw new ServletException(
                "Unable to load restaurants",
                e
            );
        }
    }
}