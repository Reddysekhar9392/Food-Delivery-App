package com.Foodiee.model;

public class CartItem {

    private int cart_id;
    private int user_id;
    private int menu_id;
    private int restaurant_id;
    private int quantity;
    private double price;

    // Default Constructor
    public CartItem() {
    }

    // Parameterized Constructor
    public CartItem(int cart_id, int user_id, int menu_id, int restaurant_id, int quantity, double price) {
        this.cart_id = cart_id;
        this.user_id = user_id;
        this.menu_id = menu_id;
        this.restaurant_id = restaurant_id;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters
    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public int getRestaurant_id() {
        return restaurant_id;
    }

    public void setRestaurant_id(int restaurant_id) {
        this.restaurant_id = restaurant_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Helper method for total price of this item
    public double getTotalPrice() {
        return quantity * price;
    }

    @Override
    public String toString() {
        return "CartItem [cart_id=" + cart_id + ", user_id=" + user_id + ", menu_id=" + menu_id
                + ", restaurant_id=" + restaurant_id + ", quantity=" + quantity + ", price=" + price + "]";
    }
}
