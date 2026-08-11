package com.Foodiee.Servlet;

import java.io.IOException;
import java.util.List;

import com.Foodiee.DAOImpl.OrderDAOImpl;
import com.Foodiee.model.Order;
import com.Foodiee.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			resp.sendRedirect("signin.jsp");
			return;
		}
		
		int user_id = user.getUser_id();
		
		OrderDAOImpl dao = new OrderDAOImpl();
		List<Order> orders = dao.getOrdersByUserId(user_id);
		
		req.setAttribute("orders", orders);
		
		RequestDispatcher rd = req.getRequestDispatcher("orders.jsp");
		rd.forward(req, resp);
	}
}
