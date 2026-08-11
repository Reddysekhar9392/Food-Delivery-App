package com.Foodiee.model;

import java.time.LocalTime;

public class Restaurant {

	
	 private int restaurant_id;
	    private String restaurant_name;
	    private String owner_name;
	    private String phone;
	    private String email;
	    private String address;
	    private String city;
	    private double rating;
	    private LocalTime opening_time;
	    private LocalTime closing_time;
	    private String cuisine_type;
	    private String Image_path;
	    
	    public Restaurant() {
			// TODO Auto-generated constructor stub
		}

	    
		public Restaurant(String restaurant_name, String owner_name, String phone, String email, String address,
				String city, double rating, LocalTime opening_time, LocalTime closing_time, String cuisine_type, String Image_path) {
			super();
			this.restaurant_name = restaurant_name;
			this.owner_name = owner_name;
			this.phone = phone;
			this.email = email;
			this.address = address;
			this.city = city;
			this.rating = rating;
			this.opening_time = opening_time;
			this.closing_time = closing_time;
			this.cuisine_type = cuisine_type;
			this.Image_path = Image_path;
		}

	
		public Restaurant(int restaurant_id, String restaurant_name, String owner_name, String phone, String email,
				String address, String city, double rating, LocalTime opening_time, LocalTime closing_time,
				String cuisine_type, String image_path) {
			super();
			this.restaurant_id = restaurant_id;
			this.restaurant_name = restaurant_name;
			this.owner_name = owner_name;
			this.phone = phone;
			this.email = email;
			this.address = address;
			this.city = city;
			this.rating = rating;
			this.opening_time = opening_time;
			this.closing_time = closing_time;
			this.cuisine_type = cuisine_type;
			Image_path = image_path;
		}


		public int getRestaurant_id() {
			return restaurant_id;
		}

		public void setRestaurant_id(int restaurant_id) {
			this.restaurant_id = restaurant_id;
		}

		public String getRestaurant_name() {
			return restaurant_name;
		}

		public void setRestaurant_name(String restaurant_name) {
			this.restaurant_name = restaurant_name;
		}

		public String getOwner_name() {
			return owner_name;
		}

		public void setOwner_name(String owner_name) {
			this.owner_name = owner_name;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public double getRating() {
			return rating;
		}

		public void setRating(double rating) {
			this.rating = rating;
		}

		public LocalTime getOpening_time() {
			return opening_time;
		}

		public void setOpening_time(LocalTime opening_time) {
			this.opening_time = opening_time;
		}

		public LocalTime getClosing_time() {
			return closing_time;
		}

		public void setClosing_time(LocalTime closing_time) {
			this.closing_time = closing_time;
		}

		public String getCuisine_type() {
			return cuisine_type;
		}

		public void setCuisine_type(String cuisine_type) {
			this.cuisine_type = cuisine_type;
		}
		
		public String getImage_path() {
			return Image_path;
		}

		public void setImage_path(String Image_path) {
			this.Image_path =Image_path;
		}


		@Override
		public String toString() {
			return "Restaurant [restaurant_id=" + restaurant_id + ", restaurant_name=" + restaurant_name
					+ ", owner_name=" + owner_name + ", phone=" + phone + ", email=" + email + ", address=" + address
					+ ", city=" + city + ", rating=" + rating + ", opening_time=" + opening_time + ", closing_time="
					+ closing_time + ", cuisine_type=" + cuisine_type + ", Image_path=" + Image_path + "]";
		}

		
	    
	    

}
