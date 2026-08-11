package com.Foodiee.model;

public class OrderItem {

	 private int item_id;
	    private int order_id;
	    private int menu_id;
	    private double price;
	    private int quantity;
	    
	    public OrderItem() {
			// TODO Auto-generated constructor stub
		}
	    
	    

		public OrderItem(int order_id, int menu_id, double price, int quantity) {
			super();
			this.order_id = order_id;
			this.menu_id = menu_id;
			this.price = price;
			this.quantity = quantity;
		}



		public OrderItem(int item_id, int order_id, int menu_id, double price, int quantity) {
			super();
			this.item_id = item_id;
			this.order_id = order_id;
			this.menu_id = menu_id;
			this.price = price;
			this.quantity = quantity;
		}

		public int getItem_id() {
			return item_id;
		}

		public void setItem_id(int item_id) {
			this.item_id = item_id;
		}

		public int getOrder_id() {
			return order_id;
		}

		public void setOrder_id(int order_id) {
			this.order_id = order_id;
		}

		public int getMenu_id() {
			return menu_id;
		}

		public void setMenu_id(int menu_id) {
			this.menu_id = menu_id;
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

		@Override
		public String toString() {
			return "OrderItem [item_id=" + item_id + ", order_id=" + order_id + ", menu_id=" + menu_id + ", quantity="
					+ quantity + ", price=" + price + "]";
		}
	    
	    
}
