package com.Foodiee.Servlet;

import java.io.IOException;

import com.Foodiee.DAOImpl.OrderDAOImpl;
import com.Foodiee.model.Order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderDetailsServlet")
public class OrderDetailsServlet extends HttpServlet {
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String orderIdStr = req.getParameter("orderId");

		System.out.println("Order Id = [" + orderIdStr + "]");

		int orderId = Integer.parseInt(orderIdStr.trim());
		
		OrderDAOImpl dao = new OrderDAOImpl();
		Order order = dao.getOrder(orderId);
		
		req.setAttribute("order", order);
		
		RequestDispatcher rd = req.getRequestDispatcher("orderDetails.jsp");
		rd.forward(req, resp);
	}
}
