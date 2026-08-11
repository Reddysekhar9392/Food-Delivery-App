package com.Foodiee.DAO;

import java.util.List;

import com.Foodiee.model.OrderItem;

public interface OrderItemDAO {

    void addOrderItem(OrderItem orderItem);

    OrderItem getOrderItem(int itemId);

    void updateOrderItem(OrderItem orderItem);

    void deleteOrderItem(int itemId);

    List<OrderItem> getAllOrderItems();
}