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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("signin.jsp");
            return;
        }

        // Read form values
        String full_name = req.getParameter("full_name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String city = req.getParameter("city");
        String pincode = req.getParameter("pincode");
        String role = req.getParameter("role");

        // Update user object
        user.setFull_name(full_name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setCity(city);
        user.setPincode(pincode);
        user.setRole(role);

        // Update database
        UserDAOImpl dao = new UserDAOImpl();
        dao.updateUser(user);

        // Update session
        session.setAttribute("user", user);

        // Redirect back to profile page
        resp.sendRedirect("profile.jsp");
    }
}