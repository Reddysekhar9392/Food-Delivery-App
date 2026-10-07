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

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        User user = new User();

        user.setFull_name(req.getParameter("full_name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setPhone(req.getParameter("phone"));
        user.setAddress(req.getParameter("address"));
        user.setCity(req.getParameter("city"));
        user.setPincode(req.getParameter("pincode"));
        user.setRole(req.getParameter("role"));

        UserDAOImpl dao = new UserDAOImpl();
        dao.addUser(user);

        // SIGNUP -> LOGIN
        resp.sendRedirect(
            req.getContextPath() + "/signin.jsp"
        );
    }
}