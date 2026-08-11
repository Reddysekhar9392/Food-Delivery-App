package com.Foodiee.Servlet;

import java.io.IOException;

import com.Foodiee.DAOImpl.OrderDAOImpl;
import com.Foodiee.DAOImpl.OrderItemDAOImpl;
import com.Foodiee.model.Cart;
import com.Foodiee.model.CartItem;
import com.Foodiee.model.Order;
import com.Foodiee.model.OrderItem;
import com.Foodiee.model.User;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkoutServlet")
public class CheckoutServlet extends HttpServlet {

	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 HttpSession session = req.getSession();
		 User user = (User) session.getAttribute("user");
		 Integer restaurantId = (Integer) session.getAttribute("restaurantId");
		 Cart cart = (Cart) session.getAttribute("cart");
		 
		 double grandTotal = (double) session.getAttribute("grandTotal");
		 
		 if (user != null) {
			 
			 if(cart != null && ! cart.getItems().isEmpty()) {
				 
				 int user_id = user.getUser_id();
				 String paymentMode = req.getParameter("paymentMode");				 
				 
				 Order order = new Order(
					        user_id,
					        LocalDateTime.now(),
					        grandTotal,
					        "Pending",
					        paymentMode,
					        restaurantId
					);
				 
				 OrderDAOImpl dao = new OrderDAOImpl();
				 int order_id = dao.addOrder(order);
				 
				 for( CartItem cartItem : cart.getItems().values()) {
					 
					 int menu_id = cartItem.getMenu_id();
					 int quantity = cartItem.getQuantity();
					 double price = cartItem.getPrice();
					
					 OrderItem orderItem = new OrderItem(order_id, menu_id, price, quantity);
					 OrderItemDAOImpl dao1 = new OrderItemDAOImpl();
					 dao1.addOrderItem(orderItem);
				 }
				 
				 session.removeAttribute("restaurantId");
				 session.removeAttribute("cart");
				 session.removeAttribute("grandTotal");
				 
				 resp.sendRedirect("orderConfirmation.jsp");
				 
			 }
		 } else {
			 
			 RequestDispatcher rd = req.getRequestDispatcher("LoginServlet");
			 rd.forward(req, resp);
			 
		 }
	}
}
