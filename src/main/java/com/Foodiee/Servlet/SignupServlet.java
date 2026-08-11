package com.Foodiee.Servlet;

import java.io.IOException;

import com.Foodiee.DAOImpl.UserDAOImpl;
import com.Foodiee.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullname = req.getParameter("full_name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String pincode = req.getParameter("pincode");
		String role = req.getParameter("role");
		
		
		User user = new User();
		
        user.setFull_name(fullname);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setAddress(address);
        user.setCity(city);
        user.setPincode(pincode);
        user.setRole(role);
        
		UserDAOImpl dao = new UserDAOImpl();
		dao.addUser(user);
		
		resp.sendRedirect("signin.jsp");
	}
	
	

}
