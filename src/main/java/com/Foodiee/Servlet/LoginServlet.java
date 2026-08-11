package com.Foodiee.Servlet;

import java.io.IOException;

import com.Foodiee.DAOImpl.UserDAOImpl;
import com.Foodiee.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDAOImpl dao = new UserDAOImpl();
		User user = dao.getUserByEmail(email);
		
		if(user!= null && user.getPassword().equals(password)) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("RestaurantServlet");
		} else {
			
			req.setAttribute("error","Invalid Email or Password");

            req.getRequestDispatcher("signin.jsp")
                    .forward(req,resp);
		}
	}

}
