package com.Foodiee.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items = new HashMap<>();

    public void addItem(CartItem newItem) {
        if (items.containsKey(newItem.getMenu_id())) {
            CartItem existing = items.get(newItem.getMenu_id());
            existing.setQuantity(existing.getQuantity() + newItem.getQuantity());
        } else {
            items.put(newItem.getMenu_id(), newItem);
        }
    }

    public void updateItem(int menuId, int quantity) {
        if (items.containsKey(menuId)) {
            items.get(menuId).setQuantity(quantity);
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public double getTotalPrice() {
        return items.values().stream()
                .mapToDouble(CartItem::getTotalPrice)
                .sum();
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }
}
