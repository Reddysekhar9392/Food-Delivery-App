package com.Foodiee.Servlet;

import java.io.IOException;
import java.util.List;

import com.Foodiee.DAOImpl.MenuDAOImpl;
import com.Foodiee.DAOImpl.RestaurantDAOImpl;
import com.Foodiee.model.Menu;
import com.Foodiee.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String restaurantIdParam = req.getParameter("restaurantId");
        int restaurantId = Integer.parseInt(restaurantIdParam);
          
        MenuDAOImpl menuImplementation = new MenuDAOImpl();
        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
        
        List<Menu> allMenusByRestaurant = menuImplementation.getMenusByRestaurant(restaurantId);
        Restaurant restaurant = restaurantDAOImpl.getRestaurant(restaurantId);

        req.setAttribute("allMenusByRestaurant", allMenusByRestaurant);
        req.setAttribute("restaurant", restaurant);

        RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
        rd.forward(req, resp);
		
	}
}
