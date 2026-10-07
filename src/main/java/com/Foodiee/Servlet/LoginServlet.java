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
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email != null) {
            email = email.trim();
        }

        UserDAOImpl dao = new UserDAOImpl();

        User user = dao.getUserByEmail(email);

        if (user != null &&
            user.getPassword() != null &&
            user.getPassword().equals(password)) {

            HttpSession session = req.getSession(true);

            // IMPORTANT: use "user" everywhere
            session.setAttribute("user", user);

            System.out.println("Login successful");

            // LOGIN -> RESTAURANTS
            resp.sendRedirect(req.getContextPath() + "/RestaurantServlet");

            return;
        }

        req.setAttribute("error", "Invalid Email or Password");

        req.getRequestDispatcher("/signin.jsp" ).forward(req, resp);
    }
}