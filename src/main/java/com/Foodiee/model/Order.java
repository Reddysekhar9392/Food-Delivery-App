package com.Foodiee.model;

import java.time.LocalDateTime;

public class Order {

	private int user_id;
	private int order_id;
	private LocalDateTime order_date;
	private double totalAmount;
	private String status;
	private String paymentMethod;
	private int restaurant_id;


	public Order() {
		// TODO Auto-generated constructor stub
	}
	

	public Order(int user_id, LocalDateTime order_date, double totalAmount, String status, String paymentMethod,
			int restaurant_id) {
		super();
		this.user_id = user_id;
		this.order_date = order_date;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurant_id = restaurant_id;
	}


	public Order( int user_id, int order_id, LocalDateTime order_date, double totalAmount, String status,String paymentMethod,
			int restaurant_id) {
		super();
		this.user_id = user_id;
		this.order_id = order_id;
		this.order_date = order_date;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurant_id = restaurant_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public LocalDateTime getOrder_date() {
		return order_date;
	}

	public void setOrder_date(LocalDateTime order_date) {
		this.order_date = order_date;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getRestaurant_id() {
		return restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	@Override
	public String toString() {
		return "Order [user_id=" + user_id + ", order_id=" + order_id + ", order_date=" + order_date + ", totalAmount="
				+ totalAmount + ", status=" + status + ", paymentMethod=" + paymentMethod + ", restaurant_id="
				+ restaurant_id + "]";
	}
	
	
	


}
