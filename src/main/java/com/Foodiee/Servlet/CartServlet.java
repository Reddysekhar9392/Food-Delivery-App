package com.Foodiee.Servlet;

import java.io.IOException;

import com.Foodiee.DAOImpl.MenuDAOImpl;
import com.Foodiee.model.Cart;
import com.Foodiee.model.CartItem;
import com.Foodiee.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        Integer newRestaurantId = Integer.parseInt(req.getParameter("restaurant_id"));
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");

        // Reset cart if switching restaurants
        if (cart == null || restaurantId == null || !restaurantId.equals(newRestaurantId)) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addItemToCart(req, cart, session);
        } else if ("update".equals(action)) {
            updateItemToCart(req, cart);
        } else if ("remove".equals(action)) {
            removeItemToCart(req, cart);
        }

        session.setAttribute("cart", cart);
        
        RequestDispatcher rd = req.getRequestDispatcher("Cart.jsp");
        rd.forward(req, resp);
    }

    private void addItemToCart(HttpServletRequest req, Cart cart, HttpSession session) {
        int menuId = Integer.parseInt(req.getParameter("menu_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        MenuDAOImpl dao = new MenuDAOImpl();
        Menu menu = dao.getMenu(menuId);

        if (menu == null) return;

        CartItem item = new CartItem();
        item.setUser_id(1); 
        item.setMenu_id(menu.getMenu_id());
        item.setRestaurant_id(menu.getRestaurant_id());
        item.setPrice(menu.getPrice());
        item.setQuantity(quantity);

        cart.addItem(item);
        
        session.setAttribute("restaurantId", menu.getRestaurant_id());
    }

    private void updateItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menu_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        cart.updateItem(menuId, quantity);
    }

    private void removeItemToCart(HttpServletRequest req, Cart cart) {
        int menuId = Integer.parseInt(req.getParameter("menu_id"));
        cart.removeItem(menuId);
    }
}
