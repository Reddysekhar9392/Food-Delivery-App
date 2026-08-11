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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
			
			List<Restaurant> allRestaurants = restaurantDAOImpl.getAllRestaurants();
			
			req.setAttribute("restaurants", allRestaurants);
			
			RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
			rd.forward(req, resp);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
